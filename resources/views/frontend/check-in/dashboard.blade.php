@extends('frontend.layouts.frontend')

@section('content')
    <section id="pm-banner-1" class="pm-banner-section-1 position-relative custom-css">
        <div class="container">
            <div class="pm-banner-content position-relative">
                <div class="pm-banner-text pm-headline pera-content">
                    <span class="pm-title-tag">{{setting('site_name')}}</span>
                    <br><br>
                    <p>{{setting('site_description')}}</p>
                    <h2> {{strip_tags(setting('welcome_screen'))}} </h2>
                    <br>
                    <div class="row">
                    <div class="col-sm">
                    <div class="ei-banner-btn">
                    <a href="{{ route('check-in.step-one') }}" style="background-color: #00c853  !important">
                            <img  src="{{ asset('website/img/check-in-icon.png')}}" style="height: 40px;"><span>{{__('Masuk')}}</span>
                        </a> 
                    </div>
                    </div>
                    <div class="col-sm" style="margin-left: -55px">
                    <div class="ei-banner-btn">
                    <a href="{{ route('checkout.index') }}">
                            <img  src="{{ asset('website/img/check-out-icon.png')}}" style="height: 40px;"><span>{{__('Keluar')}}</span>
                        </a> 
                    </div>
                    </div>
                    </div>
                </div>
                <div class="pm-banenr-img position-absolute">
                    <img src="{{asset('images/frontend.png')}}" alt="">
                </div>
            </div>
        </div>
    </section>
@endsection

