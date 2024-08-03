@extends('admin.layouts.master')

@section('main-content')

	<section class="section">
        <div class="section-header">
            <h1>{{ __('Laporan') }}</h1>
        </div>

        <div class="section-body">
        	<div class="row">
	   			<div class="col-12 col-md-12 col-lg-12">
				    <div class="card">
				    	<form action="{{ route('admin.report.store') }}" method="POST">
				    		@csrf
						    <div class="card-body">
						        <div class="form-group row">
                                    <div class="col-6">
                                        <label>{{ __('Periode Awal') }}</label> <span class="text-danger">*</span>
                                        <input type="date" name="start_date" class="form-control @error('start_date') is-invalid @enderror" value="{{ old('start_date') }}">
                                        @error('start_date')
                                            <div class="invalid-feedback">
                                                  {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="col-6">
                                        <label>{{ __('Periode Akhir') }}</label> <span class="text-danger">*</span>
                                        <input type="date" name="end_date" class="form-control @error('end_date') is-invalid @enderror" value="{{ old('end_date') }}">
                                        @error('end_date')
                                            <div class="invalid-feedback">
                                                  {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
			                    </div>       
						    </div>
					        <div class="card-footer">
		                    	<button class="btn btn-primary mr-1" type="submit">{{ __('Cetak') }}</button>
		                  	</div>
		                </form>
					</div>
				</div>
			</div>
        </div>
    </section>

@endsection
