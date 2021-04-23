@extends('adminlte::page')

@section('title')
    Call Datas
@endsection

@section('content')
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Call Datas</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active">Call Datas</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        @if(Session::has('success'))
                            <div class="alert alert-success" role="alert">
                                {{Session::get('success')}}
                            </div>
                        @endif
                        
                        <div class="row">
                            <div id="filter-section" class="col-md-12">
                                <div class="card">
                                    <div class="card-header row" id="filterHeading" style="background-color: #eeeeef;">
                                        <div class="col-md-6">
                                            <h5 class="mb-0">
                                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFilter" aria-expanded="true" aria-controls="collapseFilter">
                                                <i class="fa fa-filter"></i> Advanced Filter
                                                </button>
                                            </h5>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            
                                        </div>
                                    </div>

                                    <div id="collapseFilter" class="collapse" aria-labelledby="filterHeading" data-parent="#filter-section">
                                        <div class="card-body">
                                            <form action="#" role="form" method="POST" id="form-calldata">
                                                @csrf
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <!--begin::Group-->
                                                        <div class="form-group row fv-plugins-icon-container">
                                                            <label class="col-xl-4 col-lg-4 col-form-label">Range Date</label>
                                                            <div class="col-lg-7 col-xl-7 reportrange_field">
                                                                <div id="reportrange">
                                                                    <i class="fa fa-calendar"></i>&nbsp;
                                                                    <span></span> <i class="fa fa-caret-down"></i>
                                                                </div>
                                                                <div class="fv-plugins-message-container text-danger"></div>
                                                            </div>
                                                        </div>
                                                        <!--end::Group-->

                                                        <!--begin::Group-->
                                                        <div class="form-group row fv-plugins-icon-container">
                                                            <label class="col-xl-4 col-lg-4 col-form-label">Source</label>
                                                            <div class="col-lg-7 col-xl-7 source_field">
                                                                <input class="form-control form-control-solid form-control-lg" name="source" id="source" type="number" maxlength="20" value="">
                                                                <div class="fv-plugins-message-container text-danger"></div>
                                                            </div>
                                                        </div>
                                                        <!--end::Group-->

                                                        <!--begin::Group-->
                                                        <div class="form-group row fv-plugins-icon-container">
                                                            <label class="col-xl-4 col-lg-4 col-form-label">Destination</label>
                                                            <div class="col-lg-7 col-xl-7 destination_field">
                                                                <input class="form-control form-control-solid form-control-lg" name="destination" id="destination" type="number" maxlength="20" value="">
                                                                <div class="fv-plugins-message-container text-danger"></div>
                                                            </div>
                                                        </div>
                                                        <!--end::Group-->
                                                    </div>
                                                    <div class="col-md-6">
                                                        @if(auth()->user()->hasRole('customer'))
                                                            <input name="customer_id" id="customer_id" value="{{ auth()->user()->customer_id }}" type="hidden">
                                                        @else
                                                            <!--begin::Group-->
                                                            <div class="form-group row fv-plugins-icon-container">
                                                                <label class="col-xl-4 col-lg-4 col-form-label">Customer Name</label>
                                                                <div class="col-lg-7 col-xl-7 customer_id_field">
                                                                    <select class="form-control select2" name="customer_id" id="customer_id" style="width:100%;">
                                                                        @php($i = 1)
                                                                        <option value="">Select</option>
                                                                        @foreach($customer as $row)
                                                                            <option value="{{ $row->id }}" @if($i == "1") selected @php($i++) @endif>{{ $row->name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                    <div class="fv-plugins-message-container text-danger"></div>
                                                                </div>
                                                            </div>
                                                            <!--end::Group-->
                                                        @endif

                                                        <!--begin::Group-->
                                                        <div class="form-group row fv-plugins-icon-container">
                                                            <label class="col-xl-4 col-lg-4 col-form-label">Type Call</label>
                                                            <div class="col-lg-7 col-xl-7 typecall_field">
                                                                <select class="form-control" name="typecall" id="typecall">
                                                                    <option value="">Select</option>
                                                                    <option value="internal">Internal</option>
                                                                    <option value="inbound">Inbound</option>
                                                                    <option value="outbound">Outbound</option>
                                                                </select>
                                                                <div class="fv-plugins-message-container text-danger"></div>
                                                            </div>
                                                        </div>
                                                        <!--end::Group-->

                                                        <!--begin::Group-->
                                                        <div class="form-group row fv-plugins-icon-container">
                                                            <label class="col-xl-4 col-lg-4 col-form-label">Disposition</label>
                                                            <div class="col-lg-7 col-xl-7 disposition_field">
                                                                <select class="form-control" name="disposition" id="disposition">
                                                                    <option value="">Select</option>
                                                                    <option value="ANSWERED">ANSWERED</option>
                                                                    <option value="BUSY">BUSY</option>
                                                                    <option value="NO ANSWER">NO ANSWER</option>
                                                                    <option value="CONGESTION">CONGESTION</option>
                                                                    <option value="FAILED">FAILED</option>
                                                                </select>
                                                                <div class="fv-plugins-message-container text-danger"></div>
                                                            </div>
                                                        </div>
                                                        <!--end::Group-->
                                                    </div>
                                                </div>
                                                <input type="hidden" name="rangedate" id="rangedate">
                                            </form>
                                            <br>
                                            <div class="row">
                                                <button type="button" onclick="search()" class="btn btn-warning btn-sm"><i class="fa fa-search"></i> Search</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3"></div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-bordered table-striped" id="calldata-table">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Date</th>
                                                        <th>Customer Name</th>
                                                        <th>CLI Destination</th>
                                                        <th>Source</th>
                                                        <th>Destination</th>
                                                        <th>Type Call</th>
                                                        <th>Duration</th>
                                                        <th>Bill Second</th>
                                                        <th>Account Code</th>
                                                        <th>Disposition</th>
                                                        <th>Start</th>
                                                        <th>Answer</th>
                                                        <th>End</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3"></div>
                        
                    </div>
                </div>
            </div>
        </section>

@endsection

@push('styles')
@endpush

@push('scripts')
@endpush

@section('js')
<script type="text/javascript">
    $(function() {

        var start = moment().subtract(29, 'days');
		var end = moment();

        function cb(start, end) {
            if(start > 0 && end > 0) {
                $('#reportrange span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));

                var rangedate = start.format('YYYY-MM-DD') + ',' + end.format('YYYY-MM-DD');
            } 
            else {
                $('#reportrange span').html('All Data');
                var rangedate = '';
            }

            $('#rangedate').val(rangedate);
            search();
        }

        $('#reportrange').daterangepicker({
            startDate: start,
            endDate: end,
            maxDate: moment(),
            showDropdowns: true,
            ranges: {
                // 'All': ['', ''],
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);

        cb(start, end);
    });
    
    function search() {
        if($('#customer_id').val() != ""){
            $('#calldata-table').DataTable({
                destroy: true,
            }).destroy();

            $.ajax({
                type: "GET",
                url: "{{ route('report.calldata.getdata') }}",
                dataType: 'json',
                data:{
                    rangedate: $('#rangedate').val(),
                    customer_id: $('#customer_id').val(),
                    source: $('#source').val(),
                    destination: $('#destination').val(),
                    typecall: $('#typecall').val(),
                    disposition: $('#disposition').val(),
                },
                success: function (obj, textstatus) {
                    var dataSet = new Array;
                    if (!('error' in obj)) {
                        $.each(obj, function (index, value) {
                            var tempArray = new Array;
                            for (var o in value) {
                                tempArray.push(value[o]);
                            }
                            dataSet.push(tempArray);
                        })

                        $('#calldata-table').DataTable({
                            data: dataSet,
                        });
                    }
                    else {
                        toast.fire({
                            icon: 'error',
                            title: obj.message
                        })
                    }
                },
                error: function (obj, textstatus) {
                    toast.fire({
                        icon: 'error',
                        title: obj.message
                    })
                }
            });
        }
        else{
            toast.fire({
                icon: 'error',
                title: 'Oops, you must select a customer name'
            })
        }
    }

    setTimeout(function() {
        $('.alert').delay(3000).slideUp(300);
    });

</script>
@stop