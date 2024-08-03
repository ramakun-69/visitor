@extends('frontend.layouts.frontend')

@section('content')
<!-- Default Page -->
<section id="pm-banner-1" class="custom-css-step">
    <div class="container">
        <div class="card" style="margin-top:40px;">
            <div class="card-header" id="Details" align="center">
                <h4 style="color: #111570;font-weight: bold">{{__('Tamu Keluar')}}</h4>
            </div>
            <div class="card-body">
                <div style="margin: auto;">
                    {!! Form::open(['route' => 'checkout.index', 'id' => 'myForm']) !!}
                    <div class="save">
                        <div class="row">
                            <div class="col-md-4 col-sm-4">
                                <div class="form-group {{ $errors->has('visitorID') ? 'has-error' : ''}}">
                                    {!! Html::decode(Form::label('visitorID', "ID Visitor <span class='text-danger'>*</span>", ['class' => 'control-label'])) !!}
                                    {!! Form::text('visitorID', old('visitorID'), ('' == 'required') ? ['class' => 'form-control input','id '=>'visitorID','required' => 'required', 'placeholder'=>"Search visitorID.."] : ['class' => 'form-control input','id '=>'visitorID', 'placeholder'=>"Masukkan ID Visitor ..."]) !!}
                                    <!-- {!! $errors->first('visitorID', '<p class="text-danger">:message</p>') !!} -->
                                    @if ($errors->any())
                                            @foreach ($errors->all() as $error)
                                            <p class="text-danger">{{ $error }}</p>
                                            @endforeach
                                       
                                    @endif
                                </div>
                            
                                
                                <div class="row">
                                    
                                    <div class="col-md-6">
                                        <a href="{{ route('/') }}" class="btn btn-danger float-left text-white">
                                            <i class="fa fa-arrow-left" aria-hidden="true"></i> {{__('Batal')}}
                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-success float-right" id="continue">
                                            <i class="fa fa-arrow-right" aria-hidden="true"></i> {{__('Lanjut')}}
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                @if(isset($visitingDetails))
                                <div class="card" style="border: 0;">
                                    <div class="card-body">
                                        <div class="id-card-hook"></div>
                                        <div class="img-cards" id="printidcard">
                                            <div class="id-card-holder">
                                                <div class="id-card">
                                                    <div class="id-card-photo">
                                                        @if($visitingDetails->getFirstMediaUrl('visitor'))
                                                        <img src="{{ asset($visitingDetails->getFirstMediaUrl('visitor')) }}" alt="">
                                                        @else
                                                        <img src="{{ asset('images/'.setting('site_logo')) }}" alt="">
                                                        @endif
                                                    </div>
                                                    <h2>{{$visitingDetails->visitor->name}}</h2>
                                                    <h3>{{__('HP: ')}}{{$visitingDetails->visitor->phone}}</h3>
                                                    <h3>{{__('ID#')}}{{$visitingDetails->reg_no}}</h3>
                                                    <h3>{{$visitingDetails->company_name}}</h3>
                                                    <h3>{{$visitingDetails->visitor->address}}</h3>
                                                    <h2>{{__('KUNJUNGAN KE')}}</h2>
                                                    <h3>{{__('')}} {{$visitingDetails->employee->name}}</h3>
                                                    <hr>
                                                    <p><strong>{{ setting('site_name') }} </strong></p>
                                                    <p><strong>{{ setting('site_address') }} </strong></p>
                                                    <p>{{__('Telp:')}} {{ setting('site_phone_number') }} | {{__('E-mail:')}} {{ setting('site_email') }} </p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row justify-content-md-center">
                                            <div class="col-md-4">
                                                <div class="justify-content-center mt-10">
                                                    @if(!$visitingDetails->checkout_at)
                                                    <a class="checkout" href="{{ route('checkout.update',$visitingDetails) }}">
                                                        <img src="{{ asset('website/img/check-out-icon.png')}}" style="height: 40px;"><span>{{__('Keluar')}}</span>
                                                    </a>
                                                    @else
                                                    <div>
                                                        <p align="center" class="not-data">{{__('Tamu sudah berhasil check-out')}}</p>
                                                    </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                @else
                                @if(!$details)
                                <div>
                                    <p align="center" class="not-data">{{__('ID Tidak Ditemukan !')}}</p>
                                </div>
                                @endif
                                @endif

                            </div>
                        </div>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
@section('scripts')
<script type="application/javascript">
    $(document).ready(function() {
        $("#form-submit").click(function() {
            $("#myForm").submit(); // Submit the form
        });
    });
</script>
@endsection