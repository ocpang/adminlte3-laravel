@extends('adminlte::page')

@section('title', 'Home')

@section('content_header')
    <h1 class="m-0 text-dark">Dashboard</h1>
@stop

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <p class="mb-0">You are logged in!</p>
                </div>
            </div>
        </div>
    </div>
    @if(Auth::user())
        @if(auth()->user()->hasRole('customer'))
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Reload Status</div>
                        <div class="float-right" id="reload_status"><span class="badge badge-primary">On Progress</span></div>
                    </div>
                    <div class="card-body">
                        <div class="progress" id="reload_percentage">
                            <div class="progress-bar bg-primary progress-bar-striped  progress-bar-animated" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endif
    @endif
@stop

@section('js')
<script>
    $(function () {
        @if(Auth::user())
            @if(auth()->user()->hasRole('customer'))
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    url: '{{ route("reload_status") }}',
                    type: 'GET',
                    dataType:'json',
                    cache: false,
                    success: function (data) {
                        if(data.status == 'success'){
                            if(data.message == '0'){
                                $("#reload_status").html('<span class="badge badge-success">Done</span>');
                                $("#reload_percentage").html('<div class="progress-bar bg-success progress-bar-striped  progress-bar-animated" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>');
                            }
                        }else{
                            toast.fire({
                                icon: 'error',
                                title: data.message
                            });
                        }
                    },
                    error: function(jqXHR, text) { // if error occured
                        toast.fire({
                            icon: 'error',
                            title: "Error occured, "+ text +" "+ jqXHR.status+". please try again"
                        });
                    }
                });
            @endif
        @endif
    });

</script>
@stop
