<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use DB;
use Response;
use Str;
use App\Models\Customer;

class CustomersController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {        
        if(!auth()->user()->can('read customer')){
            abort(403);
        }

        return view('customer.index');
    }

    public function getData(Request $request)
    {
        $data = Customer::select('customers.*');

        if($request->rangedate != '') {
            $rangedate   = explode(',',$request->rangedate);
            $start_date  = trim($rangedate[0]);
            $end_date    = trim($rangedate[1]);

            $res_start_date  = date('Y-m-d 00:00:00',strtotime($start_date));
            $res_end_date    = date('Y-m-d 23:59:59',strtotime($end_date));

            $data = $data->whereBetween('customers.created_at', [$res_start_date, $res_end_date]);
        }

        return DataTables::of($data)
            ->addIndexColumn()
            ->editColumn('created_at', function ($row) {
                return $row->created_at ? with(new Carbon($row->created_at))->format('d-m-Y H:i:s') : '';
            })
            ->addColumn('action', function ($row) {
                $action = "";
                if(auth()->user()->can('read customer')){
                    $action .= '<a class="btn btn-info btn-sm text-white" onclick="showDetail(\''.$row->id.'\')" title="View Detail"><i class="fa fa-eye"></i></a> ';
                }

                if(auth()->user()->can('update customer')){
                    $action .= '<a title="Edit" class="btn btn-warning btn-sm text-white" href="'. route("customer.edit") .'/'. $row->id .'"><i class="fa fa-edit"></i></a> ';
                }

                if(auth()->user()->can('delete customer')){
                    $action .= '<a href="javascript:void(0);" onclick="deleteData(\''.$row->id.'\', \''. route("customer.delete") .'\')" class="btn btn-danger btn-sm text-white" title="Delete"><i class="fa fa-trash"></i></a> ';
                }

                return $action;
            })
            ->rawColumns(['action'])
        	->make(true);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if(!auth()->user()->can('create customer')){
            abort(403);
        }

        return view('customer.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        print_r($_POST);
    }

    public function save(Request $request, $id='')
    {   
        $isNewRecord = true;
        $requestData = array();
        if($id != ''){
            $model = Customer::find($id);
            $model->user_updated = auth()->user()->id;
            if( is_null( $model ) ){
                abort(404);
            }
            else{
                $isNewRecord = false;
            }
        }
        else{
            $model = new Customer;
            $requestData['id'] = Str::uuid();
            $requestData['user_created'] = auth()->user()->id;
        }

        $request->flash();

        $rules = [
            'name' => ['required', 'string', 'max:100', 'unique:customers'],
        ];

        $messages = [
        //   'regex' => 'The :attribute field can only be entered alphanumeric and underscore.',
        ];

        if($isNewRecord){

        }
        else{
            $rules['name'] = ['required', 'string', 'max:100', 
                function ($attribute, $value, $fail) {
                        
                    $model = Customer::whereNotIn('id', [$_POST['id']])->where('name', $value)->get()->count();
                    if ($model == 0) {
                        
                    }
                    else{
                        $fail('The ' .$attribute.' has already been taken.');
                    }
                }
            ];
        }

        $requestData['name'] = str_replace(' ', '', $request->name);

        $validatedData = $request->validate($rules);

        $requestData = array_merge(array_filter($request->all()), $requestData);
        $model->fill($requestData);

        DB::beginTransaction();
        try {
            if($model->save()){     
                if($isNewRecord){
                    activity()
                        ->performedOn($model)
                        ->log('created');

                    DB::commit();

                    return response()->json(array(
                        'status' => 'success',
                        'message' => trans('custom.save_success')
                    ));
                    
                }
                else{
                    activity()
                        ->performedOn($model)
                        ->log('edited');
                    DB::commit();

                    return response()->json(array(
                        'status' => 'success',
                        'message' => trans('custom.save_success')
                    ));
                }
                
            }
            else{
                DB::rollBack();
                return response()->json(array(
                    'status' => 'failed',
                    'message' => $model->errors(),
                ));
            }
        }
        catch (Exception $e) {
            DB::rollBack();
            return response()->json(array(
                'status' => 'failed',
                'message' => $e->getMessage(),
            ));
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $get_data = Customer::find($request->id);

        $html = '<table class="table table-hover table-bordered table-striped" width="100%">';
        $html .= '<tr>';
        $html .= '<th width="40%">Name</th>';
        $html .= '<td>'.ucwords($get_data->name).'</td>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<th>PIC Name</th>';
        $html .= '<td>'.$get_data->pic_name.'</td>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<th>Phone</th>';
        $html .= '<td>'.$get_data->phone.'</td>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<th>Email</th>';
        $html .= '<td>'.$get_data->email.'</td>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<th>Address</th>';
        $html .= '<td>'.$get_data->address.'</td>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<th>Sub District</th>';
        $html .= '<td>'.$get_data->sub_district.'</td>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<th>Districts</th>';
        $html .= '<td>'.$get_data->districts.'</td>';
        $html .= '</tr>';
        $html .= '<tr>';
        $html .= '<th>City</th>';
        $html .= '<td>'.$get_data->city.'</td>';
        $html .= '</tr>';
        $html .= '</table>';

        $response = array(
            'html' => $html,
        );

        return Response::json($response);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id=0)
    {
        if(!auth()->user()->can('update customer')){
            abort(403);
        }

        $model = Customer::find($id);
        if($model == null){
            abort(404);
        }

        $data = array(
            'customer'          => $model,
        );

		return view('customer.edit', $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }
    
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::beginTransaction();

        try {
            $model = Customer::find($id);
            $model->user_deleted = auth()->user()->id;
            if($model->save()){
                if($model->delete()){
                    activity()
                        ->performedOn($model)
                        ->log('deleted');
                    
                    DB::commit();

                    return response()->json(array(
                        'status' => 'success',
                        'message' => trans('custom.delete_success')
                    ));
                }
                else{
                    DB::rollBack();

                    return response()->json(array(
                        'status' => 'failed',
                        'message' => $model->getErrors()
                    ));
                }
            }
            else{
                DB::rollBack();

                return response()->json(array(
                    'status' => 'failed',
                    'message' => $model->getErrors()
                ));
            }
            
        } 
        catch (Exception $e) {
            DB::rollBack();
            
            return response()->json(array(
                'status' => 'failed',
                'message' => $e->getMessage(),
            ));
        }
    }
    
}
