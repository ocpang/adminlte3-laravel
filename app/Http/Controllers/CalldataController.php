<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Config;
use Log;
use Response;
use App\Models\Customer;

class CalldataController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        if(!auth()->user()->can('read calldata')){
            abort(403);
        }
        
        $customer = Customer::where('status', 1)->orderBy('name', 'asc')->get();
        
        return view('report.calldata', compact('customer'));
    }

    public function getData(Request $request)
    {
        $res_start_date  = "";
        $res_end_date    = "";
        $customer = "";
        $source = "";
        $destination = "";
        $typecall = "";
        $accountcode = "";
        $disposition = "";
        $post_data = array();

        if($request->rangedate != '') {
            $rangedate   = explode(',',$request->rangedate);
            $start_date  = trim($rangedate[0]);
            $end_date    = trim($rangedate[1]);

            $res_start_date  = date('Y-m-d',strtotime($start_date));
            $res_end_date    = date('Y-m-d',strtotime($end_date));

            $post_data['fromdate'] = $res_start_date;
            $post_data['todate'] = $res_end_date;
        }
        
        if($request->source != '') {
            $source = $request->source;
            $post_data['src'] = $source;
        }

        if($request->destination != '') {
            $destination = $request->destination;
            $post_data['dst'] = $destination;
        }

        if($request->customer_id != '') {
            $customer = Customer::find($request->customer_id)->name;
            $post_data['customer'] = $customer;
        }

        if($request->accountcode != '') {
            $accountcode = $request->accountcode;
            $post_data['accountcode'] = $accountcode;
        }

        if($request->disposition != '') {
            $disposition = $request->disposition;
            $post_data['disposition'] = $disposition;
        }

        if($request->typecall != '') {
            $typecall = $request->typecall;
            $post_data['typecall'] = $typecall;
        }

        // Start. Send to VOIP
        $curl = curl_init();
        $post_data = json_encode($post_data);

        curl_setopt_array($curl, array(
                CURLOPT_URL => Config::get('api.api_url')."/cdr/list",
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "POST",
                CURLOPT_POSTFIELDS => $post_data,
                CURLOPT_HTTPHEADER => array(
                    Config::get('api.api_key') . ": " . Config::get('api.api_value'),
                    "Content-Type: application/json"
                ),
            )
        );

        $result = json_decode(curl_exec($curl));
        $response = curl_getinfo($curl);

        if($response['http_code'] == '200' || $response['http_code'] == '201'){
            $data_result = array();
            $no = 1;
            if(!empty($result->data)){
                foreach($result->data as $row){
                    $data_result[] = array(
                        "no" => $no++,
                        "date" => $row->calldate,
                        "customer" => $row->customer,
                        "clid" => $row->clid,
                        "source" => $row->src,
                        "destination" => $row->dst,
                        "typecall" => $row->typecall,
                        "duration" => $row->duration,
                        "billsec" => $row->billsec,
                        "accountcode" => $row->accountcode,
                        "disposition" => $row->disposition,
                        "start" => $row->start,
                        "answer" => $row->answer,
                        "end" => $row->end,
                    );
                }
            }

            return response()->json($data_result);
        }
        else{
            return response()->json(array());
        }

        curl_close($curl);

        // End. Send to VOIP
    }

}
