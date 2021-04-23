<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Config;
use App\Models\Customer;
use App\Models\Autoattendant;
use App\Models\Autoattendantentry;
use App\Models\Callgroup;
use App\Models\Callgroupmember;
use App\Models\Callgroupfailover;
use App\Models\Timecall;
use App\Models\Timegroup;
use App\Models\Incoming;
use App\Models\Sipuser;
use App\Models\Callforward;
use App\Models\Voicemail;
use App\Models\Cos;
use App\Models\Cosout;
use App\Models\Cospattern;
use App\Models\Outgoing;
use App\Models\Outgoingrule;
use App\Models\Conference;
use App\Models\Blacklist;
use App\Models\Moh;
use App\Models\Rbt;
use App\Models\Recordingfile;

class HomeController extends Controller
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
        return view('home');
    }

    public function reload()
    {
        if(auth()->user()->hasRole('customer')){
            $status = true;
            $messages = "";

            // SYNCHRONIZE
            $synchronize = array('autoattendant', 'autoattendant_entries', 'callgroup', 'callgroup_member', 'callgroup_failover', 'timecall', 'timegroup', 'incoming-rules', 'sipuser', 'call_forward', 'voicemail', 'cos-name', 'cos-outgoing', 'cos-pattern', 'outgoing-rules-name', 'outgoing-rules', 'conference', 'blacklist', 'moh', 'rbt', 'recording_file');
            foreach($synchronize as $syn){
                if($status){
                    // Start. Send to VOIP
                    $curl = curl_init();
                    $post_data = '
                                    {
                                        "customer" : "'.Customer::find(auth()->user()->customer_id)->name.'"
                                    }
                                ';
                    
                    curl_setopt_array($curl, array(
                            CURLOPT_URL => Config::get('api.api_url')."/".$syn."/list",
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

                    curl_close($curl);

                    // End. Send to VOIP
                    
                    if($response['http_code'] == '200' || $response['http_code'] == '201'){
                        foreach($result->data as $row){
                            $get_ref = $this->getDataExists($syn, $row->id);
                            if(!$get_ref){
                                // Start. Send to VOIP
                                $curl = curl_init();
                                $post_data = '
                                                {
                                                    "id" : "'. $row->id .'",
                                                    "customer" : "'. $row->customer .'"
                                                }
                                            ';

                                curl_setopt_array($curl, array(
                                        CURLOPT_URL => Config::get('api.api_url')."/".$syn."/delete",
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
                                    $status = true;
                                }
                                else{
                                    $status = false;
                                    $messages .= $result->message;
                                }

                                curl_close($curl);

                                // End. Send to VOIP
                            }
                        }
                    }
                    else{
                        $status = false;
                        $messages .= $result->message;
                    }

                }
            }
            // END SYNCHRONIZE


            // Start. Send RELOAD to VOIP
            $curl = curl_init();
            $post_data = '
                            {
                                "customer" : "'.Customer::find(auth()->user()->customer_id)->name.'"
                            }
                        ';

            curl_setopt_array($curl, array(
                    CURLOPT_URL => Config::get('api.api_url')."/reload/do",
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
                if($messages != ""){
                    $messages .= $messages . ' | ';
                }

                return response()->json(array(
                    'status' => 'success',
                    'message' => $messages . trans('custom.reload_success')
                ));
            }
            else{
                $messages .= $result->message;
                // foreach($result as $key => $value){
                //     $messages .= $value[0].'<br>';
                // }

                return response()->json(array(
                    'status' => 'failed',
                    'message' => $messages,
                ));
            }

            curl_close($curl);

            // End. Send to VOIP
        }
        else{
            return response()->json(array(
                'status' => 'failed',
                'message' => 'Your account is not customer'
            ));
        }
    }

    public function reloadStatus()
    {
        if(auth()->user()->hasRole('customer')){
            // Start. Send to VOIP
            $curl = curl_init();
            $post_data = '
                            {
                                "customer" : "'.Customer::find(auth()->user()->customer_id)->name.'"
                            }
                        ';

            curl_setopt_array($curl, array(
                    CURLOPT_URL => Config::get('api.api_url')."/reload/status",
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
                return response()->json(array(
                    'status' => 'success',
                    'message' => $result->data->status,
                ));
            }
            else{
                $messages = $result->message;
                return response()->json(array(
                    'status' => 'failed',
                    'message' => $messages,
                ));
            }

            curl_close($curl);

            // End. Send to VOIP
        }
        else{
            return response()->json(array(
                'status' => 'failed',
                'message' => 'Your account is not customer'
            ));
        }
    }

    public function getDataExists($model, $ref_id){
        $get_data = false;
        // $synchronize = array('autoattendant', 'autoattendant_entries', 'callgroup', 'callgroup_member', 'callgroup_failover', 'timecall', 'timegroup', 'incoming-rules', 'sipuser', 'call_forward', 'voicemail', 'cos-name', 'cos-outgoing', 'cos-pattern', 'outgoing-rules-name', 'outgoing-rules', 'conference', 'blacklist', 'moh', 'rbt', 'recording_file');

        if($model == "ivr"){
            $get_data = Autoattendant::where('ref_id', $ref_id)->exists();
        }
        else if($model == "ivr_entries"){
            $get_data = Autoattendantentry::where('ref_id', $ref_id)->exists();
        }
        else if($model == "callgroup"){
            $get_data = Callgroup::where('ref_id', $ref_id)->exists();
        }
        else if($model == "callgroup_member"){
            $get_data = Callgroupmember::where('ref_id', $ref_id)->exists();
        }
        else if($model == "callgroup_failover"){
            $get_data = Callgroupfailover::where('ref_id', $ref_id)->exists();
        }
        else if($model == "timecall"){
            $get_data = Timecall::where('ref_id', $ref_id)->exists();
        }
        else if($model == "timegroup"){
            $get_data = Timegroup::where('ref_id', $ref_id)->exists();
        }
        else if($model == "incoming-rules"){
            $get_data = Incoming::where('ref_id', $ref_id)->exists();
        }
        else if($model == "sipuser"){
            $get_data = Sipuser::where('ref_id', $ref_id)->exists();
        }
        else if($model == "call_forward"){
            $get_data = Callforward::where('ref_id', $ref_id)->exists();
        }
        else if($model == "voicemail"){
            $get_data = Voicemail::where('ref_id', $ref_id)->exists();
        }
        else if($model == "cos-name"){
            $get_data = Cos::where('ref_id', $ref_id)->exists();
        }
        else if($model == "cos-outgoing"){
            $get_data = Cosout::where('ref_id', $ref_id)->exists();
        }
        else if($model == "cos-pattern"){
            $get_data = Cospattern::where('ref_id', $ref_id)->exists();
        }
        else if($model == "outgoing-rules-name"){
            $get_data = Outgoing::where('ref_id', $ref_id)->exists();
        }
        else if($model == "outgoing-rules"){
            $get_data = Outgoingrule::where('ref_id', $ref_id)->exists();
        }
        else if($model == "conference"){
            $get_data = Conference::where('ref_id', $ref_id)->exists();
        }
        else if($model == "blacklist"){
            $get_data = Blacklist::where('ref_id', $ref_id)->exists();
        }
        else if($model == "moh"){
            $get_data = Moh::where('ref_id', $ref_id)->exists();
        }
        else if($model == "rbt"){
            $get_data = Rbt::where('ref_id', $ref_id)->exists();
        }
        else if($model == "recording_file"){
            $get_data = Recordingfile::where('ref_id', $ref_id)->exists();
        }

        return $get_data;

    }

}
