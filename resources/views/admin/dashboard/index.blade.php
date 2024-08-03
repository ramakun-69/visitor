@extends('admin.layouts.master')

@section('main-content')

    <section class="section">
        <div class="section-header">
            <h1>{{ __('Dashboard') }}</h1>
            {{ Breadcrumbs::render('dashboard') }}
        </div>
        @if(auth()->user()->getrole->name == 'Employee')
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                    <div class="card-icon bg-primary">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>{{ __('Total Visitor') }}</h4>
                        </div>
                        <div class="card-body">
                            {{$totalVisitor}}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                <div class="card card-statistic-1">
                    <div class="card-icon bg-warning">
                        <i class="fas fa-user-secret"></i>
                    </div>
                    <div class="card-wrap">
                        <div class="card-header">
                            <h4>{{ __('Total Pre Register') }}</h4>
                        </div>
                        <div class="card-body">
                            {{$totalPrerigister}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @else
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-danger">
                            <i class="far fa-user"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>{{ __('Total Karyawan') }}</h4>
                            </div>
                            <div class="card-body">
                                {{$totalEmployees}}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-primary">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>{{ __('Total Visitor') }}</h4>
                            </div>
                            <div class="card-body">
                                {{$totalVisitor}}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-warning">
                            <i class="fas fa-user-secret"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>{{ __('Total Pre Register') }}</h4>
                            </div>
                            <div class="card-body">
                                {{$totalPrerigister}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endif

        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4>{{ __('Data Visitor') }} <span class="badge badge-primary">{{$totalVisitor}}</span></h4>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive table-invoice">
                            <table class="table table-striped">
                                <tr>
                                    <th>{{ __('Nama') }}</th>
                                    <th>{{ __('Email') }}</th>
                                    <th>{{ __('ID Visitor') }}</th>
                                    <th>{{ __('Karyawan') }}</th>
                                    <th>{{ __('Masuk') }}</th>
                                    <th>{{ __('Aksi') }}</th>
                                </tr>
                                    @if(!blank($visitors))
                                        @foreach($visitors as $visitor)
                                            @php
                                                if($loop->index > 5) {
                                                    break;
                                                }
                                            @endphp
                                            <tr>
                                                <td>{{ optional($visitor->visitor)->name }}</td>
                                                <td>{{ optional($visitor->visitor)->email }}</td>
                                                <td>{{ $visitor->reg_no }}</td>
                                                <td>{{ optional($visitor->employee->user)->name }}</td>
                                                <td>{{ date('d-m-Y h:i A', strtotime($visitor->checkin_at)) }}</td>
                                                <td>
                                                    <a href="{{ route('admin.visitors.show', $visitor) }}" class="btn btn-sm btn-icon btn-primary"><i class="far fa-eye"></i></a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    @endif
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="profile-dashboard bg-maroon-light">
                        <a href="{{ route('admin.profile') }}">
                            <img src="{{ auth()->user()->images }}" alt="">
                        </a>
                        <h1>{{ auth()->user()->name }}</h1>
                        <p>
                            {{ auth()->user()->getrole->name ?? '' }}
                        </p>
                    </div>
                    <div class="list-group">
                        <li class="list-group-item list-group-item-action"><i class="fa fa-user"></i> {{ auth()->user()->username }}</li>
                        <li class="list-group-item list-group-item-action"><i class="fa fa-envelope"></i> {{ auth()->user()->email }}</li>
                        <li class="list-group-item list-group-item-action"><i class="fa fa-phone"></i> {{ auth()->user()->phone }}</li>
                        <li class="list-group-item list-group-item-action"><i class="fa fa-map"></i> {{ auth()->user()->address }}</li>
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection

