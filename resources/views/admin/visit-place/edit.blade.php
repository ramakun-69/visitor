@extends('admin.layouts.master')

@section('main-content')

	<section class="section">
        <div class="section-header">
            <h1>{{ __('Edit Tempat Kunjungan') }}</h1>
            
        </div>

        <div class="section-body">
        	<div class="row">
	   			<div class="col-12 col-md-6 col-lg-6">
				    <div class="card">
				    	<form action="{{ route('admin.visitPlace.update', $visitPlace) }}" method="POST">
				    		@csrf
				    		@method('PUT')
						    <div class="card-body">
						        <div class="form-group">
			                        <label>{{ __('levels.name') }}</label> <span class="text-danger">*</span>
			                        <input type="text" name="name" class="form-control @error('name') is-invalid @enderror" value="{{ old('name', $visitPlace->name) }}">
			                        @error('name')
				                        <div class="invalid-feedback">
				                          	{{ $message }}
				                        </div>
				                    @enderror
			                    </div>

						        <div class="form-group">
						            <label>{{ __('levels.status') }}</label> <span class="text-danger">*</span>
						            <select name="status" class="form-control @error('status') is-invalid @enderror">
						            	@foreach(trans('statuses') as $key => $status)
						                	<option value="{{ $key }}" {{ (old('status', $visitPlace->status) == $key) ? 'selected' : '' }}>{{ $status }}</option>
						                @endforeach
						            </select>
						            @error('status')
				                        <div class="invalid-feedback">
				                          	{{ $message }}
				                        </div>
				                    @enderror
						        </div>
						    </div>

					        <div class="card-footer">
		                    	<button class="btn btn-primary mr-1" type="submit">{{ __('Simpan') }}</button>
		                  	</div>
		                </form>
					</div>
				</div>
			</div>
        </div>
    </section>

@endsection
