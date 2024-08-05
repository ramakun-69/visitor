@extends('admin.layouts.master')

@section('css')
    <link rel="stylesheet" href="{{ asset('assets/modules/select2/dist/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/modules/bootstrap-social/bootstrap-social.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/modules/summernote/summernote-bs4.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/modules/bootstrap-datepicker/css/bootstrap-datepicker.min.css') }}">
@endsection
{{-- @dd($visitingDetails); --}}
@section('main-content')
    <section class="section">
        <div class="section-header">
            <h1>{{ __('Visitor') }}</h1>
            {{ Breadcrumbs::render('visitors/edit') }}
        </div>

        <div class="section-body">
            <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="card">
                        <form action="{{ route('admin.visitors.update', $visitingDetails) }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="card-body">
                                <div class="form-row">
                                    <div class="form-group col">
                                        <label for="id_card">{{ __('ID Card  ') }}</label> <span
                                            class="text-danger">*</span>
                                        <input id="id_card" type="text" name="id_card"
                                            class="form-control {{ $errors->has('id_card') ? ' is-invalid ' : '' }}"
                                            value="{{ old('id_card', $visitingDetails->visitor->id_card) }}">
                                        @error('id_card')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col">
                                        <label for="first_name">{{ __('Nama Depan') }}</label> <span
                                            class="text-danger">*</span>
                                        <input id="first_name" type="text" name="first_name"
                                            class="form-control {{ $errors->has('first_name') ? ' is-invalid ' : '' }}"
                                            value="{{ old('first_name', $visitingDetails->visitor->first_name) }}">
                                        @error('first_name')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col">
                                        <label for="last_name">{{ __('Nama Belakang') }}</label> <span
                                            class="text-danger">*</span>
                                        <input id="last_name" type="text" name="last_name"
                                            class="form-control {{ $errors->has('last_name') ? ' is-invalid ' : '' }}"
                                            value="{{ old('last_name', $visitingDetails->visitor->last_name) }}">
                                        @error('last_name')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>

                                </div>
                                <div class="form-row">
                                    <div class="form-group col">
                                        <label>{{ __('Alamat E-Mail') }}</label> <span class="text-danger">*</span>
                                        <input type="text" name="email"
                                            class="form-control @error('email') is-invalid @enderror"
                                            value="{{ old('email', $visitingDetails->visitor->email) }}">
                                        @error('email')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col">
                                        <label>{{ __('Telepon') }}</label> <span class="text-danger">*</span>
                                        <input type="text" name="phone"
                                            class="form-control @error('phone') is-invalid @enderror"
                                            value="{{ old('phone', $visitingDetails->visitor->phone) }}">
                                        @error('phone')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col">
                                        <label>{{ __('Pekerjaan') }}</label> <span class="text-danger">*</span>
                                        <input type="text" name="pekerjaan"
                                            class="form-control @error('pekerjaan') is-invalid @enderror"
                                            value="{{ old('pekerjaan', $visitingDetails->visitor->pekerjaan) }}">
                                        @error('pekerjaan')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col">
                                        <label for="gender">{{ __('Jenis Kelamin') }}</label> <span
                                            class="text-danger">*</span>
                                        <select id="gender" name="gender"
                                            class="form-control @error('gender') is-invalid @enderror">
                                            @foreach (trans('genders') as $key => $gender)
                                                <option value="{{ $key }}"
                                                    {{ old('gender', $visitingDetails->visitor->gender) == $key ? 'selected' : '' }}>
                                                    {{ $gender }}</option>
                                            @endforeach
                                        </select>
                                        @error('gender')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col">
                                        <label for="employee_id">{{ __('Pilih Karyawan') }}</label> <span
                                            class="text-danger">*</span>
                                        <select id="employee_id" name="employee_id"
                                            class="form-control select2 @error('employee_id') is-invalid @enderror">
                                            @foreach ($employees as $key => $employee)
                                                <option value="{{ $employee->id }}"
                                                    {{ old('employee_id', $visitingDetails->employee_id) == $employee->id ? 'selected' : '' }}>
                                                    {{ $employee->name }} ( {{ $employee->department->name }} )</option>
                                            @endforeach
                                        </select>
                                        @error('employee_id')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>

                                </div>
                                <div class="form-row">
                                    <div class="form-group col">
                                        <label for="address">{{ __('Alamat') }}</label>
                                        <textarea name="address"
                                            class="summernote-simple form-control height-textarea @error('address')
                                                      is-invalid @enderror"
                                            id="address">
                                            {{ old('address', $visitingDetails->visitor->address) }}
                                        </textarea>
                                        @error('address')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 col-sm-12">
                                        <div class="form-group {{ $errors->has('id_type') ? 'has-error' : '' }}">
                                            <label for="id_type">{{ __('Pengenal/Bukti Diri') }}</label>
                                            <div>
                                                <label class="ml-3 mr-5">
                                                    <input type="radio" name="id_type" value="KTP"
                                                        class="form-check-input"
                                                        {{ old('id_type',$visitingDetails->visitor->id_type ) == 'KTP' ? 'checked' : '' }}>
                                                    KTP
                                                </label>
                                                <label class="mr-5">
                                                    <input type="radio" name="id_type" value="SIM"
                                                        class="form-check-input"
                                                        {{ old('id_type', $visitingDetails->visitor->id_type) == 'SIM' ? 'checked' : '' }}>
                                                    SIM
                                                </label>
                                                <label>
                                                    <input type="radio" name="id_type" value="Lainnya"
                                                        class="form-check-input"
                                                        {{ old('id_type', $visitingDetails->visitor->id_type) == 'Lainnya' ? 'checked' : '' }}>
                                                    Lainnya
                                                </label>
                                            </div>
                                            @if ($errors->has('id_type'))
                                                <p class="text-danger">{{ $errors->first('id_type') }}</p>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <div
                                            class="form-group {{ $errors->has('national_identification_no') ? 'has-error' : '' }}">
                                            <label for="national_identification_no">{{ __('No ID') }}</label>
                                            <input type="text" name="national_identification_no"
                                                id="national_identification_no" class="form-control"
                                                value="{{ old('national_identification_no', $visitingDetails->visitor->national_identification_no) }}">
                                            @if ($errors->has('national_identification_no'))
                                                <p class="text-danger">{{ $errors->first('national_identification_no') }}
                                                </p>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group {{ $errors->has('transport_type') ? 'has-error' : '' }}">
                                            <label for="transport_type">{{ __('Jenis Kendaraan') }}</label>
                                            <div style="display: flex; align-items: center;">
                                                <label class="ml-3 mr-5">
                                                    <input type="radio" name="transport_type" value="Mini Bus"
                                                        class="form-check-input"
                                                        {{ old('transport_type',$visitingDetails->visitor->transport_type) == 'Mini Bus' ? 'checked' : '' }}>
                                                    Mini Bus
                                                </label>
                                                <label class="mr-5">
                                                    <input type="radio" name="transport_type" value="Truck"
                                                        class="form-check-input"
                                                        {{ old('transport_type, $visitingDetails->visitor->transport_type') == 'Truck' ? 'checked' : '' }}>
                                                    Truck
                                                </label>
                                                <label class="mr-5">
                                                    <input type="radio" name="transport_type" value="Sedan"
                                                        class="form-check-input"
                                                        {{ old('transport_type', $visitingDetails->visitor->transport_type) == 'Sedan' ? 'checked' : '' }}>
                                                    Sedan
                                                </label>
                                                <label>
                                                    <input type="radio" name="transport_type" value="other"
                                                        class="form-check-input"
                                                        {{ old('transport_type', $visitingDetails->visitor->transport_type) && !in_array(old('transport_type',$visitingDetails->visitor->transport_type), ['Mini Bus', 'Truck', 'Sedan']) ? 'checked' : '' }} id="other">
                                                    Lainnya
                                                </label>
                                                <label>
                                                    <input type="text" name="transport_type_other"
                                                        id="other-transport-type" class="form-control"
                                                        placeholder="Nama Kendaraan Lainnya"
                                                        style="display:inline-block; width:auto; margin-left:10px;"
                                                        value="{{ !in_array(old('transport_type',$visitingDetails->visitor->transport_type), ['Mini Bus', 'Truck', 'Sedan']) ? old('transport_type',$visitingDetails->visitor->transport_type) : '' }}"
                                                        {{ !in_array(old('transport_type',$visitingDetails->visitor->transport_type), ['Mini Bus', 'Truck', 'Sedan']) ? '' : 'disabled' }} disabled>
                                                </label>
                                            </div>
                                            @if ($errors->has('transport_type'))
                                                <p class="text-danger">{{ $errors->first('transport_type') }}</p>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group {{ $errors->has('visitor_category') ? 'has-error' : '' }}">
                                            <label for="visitor_category">{{ __('Kategori Visitor') }}</label>
                                            <div style="display: flex; align-items: center;">
                                                <label class="ml-3 mr-5">
                                                    <input type="radio" name="visitor_category" value="tamu"
                                                        class="form-check-input"
                                                        {{ old('visitor_category',$visitingDetails->visitor->visitor_category) == 'tamu' ? 'checked' : '' }}>
                                                    Tamu
                                                </label>
                                                <label>
                                                    <input type="radio" name="visitor_category" value="rekanan"
                                                        class="form-check-input" id="rekanan"
                                                        {{ old('visitor_category',$visitingDetails->visitor->visitor_category) != 'tamu' ? 'checked' : '' }}>
                                                    Rekanan
                                                </label>
                                                <label>
                                                    <select name="visitor_category" id="rekanan_value"
                                                        class="form-control" style="margin-left:12px;"
                                                        {{ old('visitor_category',$visitingDetails->visitor->visitor_category) == 'tamu' ? 'disabled' : '' }}>
                                                        <option value="" disabled selected>--Silahkan Pilih--
                                                        </option>
                                                        <option value="buyer"
                                                            {{ old('visitor_category',$visitingDetails->visitor->visitor_category) == 'buyer' ? 'selected' : '' }}>
                                                            Buyer</option>
                                                        <option value="vendor"
                                                            {{ old('visitor_category',$visitingDetails->visitor->visitor_category) == 'vendor' ? 'selected' : '' }}>
                                                            Vendor</option>
                                                        <option value="suplier"
                                                            {{ old('visitor_category',$visitingDetails->visitor->visitor_category) == 'suplier' ? 'selected' : '' }}>
                                                            Suplier</option>
                                                    </select>
                                                </label>
                                            </div>
                                            @if ($errors->has('visitor_category'))
                                                <p class="text-danger">{{ $errors->first('visitor_category') }}</p>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <div class="form-group {{ $errors->has('jumlah_orang') ? 'has-error' : '' }}">
                                            {!! Form::label('jumlah_orang', 'Jumlah Orang', ['class' => 'control-label']) !!}
                                            {!! Form::text(
                                                'jumlah_orang',
                                            $visitingDetails->visitor->jumlah_orang,
                                                '' == 'required'
                                                    ? ['class' => 'form-control input', 'id ' => 'jumlah_orang']
                                                    : ['class' => 'form-control input', 'id ' => 'jumlah_orang'],
                                            ) !!}
                                            {!! $errors->first('jumlah_orang', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group {{ $errors->has('visit_place') ? 'has-error' : '' }}">
                                            <label for="visit_place">{{ __('Tempat Yang Dikunjungi') }}</label> <span
                                                class="text-danger">*</span>
                                            <select id="visit_place" name="visit_place"
                                                class="form-control @error('visit_place') is-invalid @enderror">
                                                <option value="">{{ __('Pilih Tempat Yang Dikunjungi') }}</option>
                                                @foreach ($visitPlaces as $vp)
                                                    <option value="{{ $vp->id }}"
                                                        {{ old('visit_place',$visitingDetails->visitor->visit_place) == $vp->id ? 'selected' : '' }}>
                                                        {{ $vp->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @if ($errors->has('visit_place'))
                                                <p class="text-danger">{{ $errors->first('visit_place') }}</p>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                            
                                <div class="form-row">
                                    <div class="form-group col">
                                        <label>{{ __('Perusahaan') }}</label>
                                        <input type="text" name="company_name"
                                            class="form-control @error('company_name') is-invalid @enderror"
                                            value="{{ old('company_name', $visitingDetails->company_name) }}">
                                        @error('company_name')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                    <div class="form-group col">
                                        <label for="purpose">{{ __('Keperluan') }}</label> <span
                                            class="text-danger">*</span>
                                        <textarea name="purpose"
                                            class="summernote-simple form-control height-textarea @error('purpose')
                                                      is-invalid @enderror"
                                            id="purpose">
                                            {{ old('purpose', $visitingDetails->purpose) }}
                                        </textarea>
                                        @error('purpose')
                                            <div class="invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>

                                </div>
                                <div class="form-row">
                                    <div class="form-group col-6">
                                        <label for="customFile">{{ __('Foto') }}</label>
                                        <div class="custom-file">
                                            <input name="image" type="file"
                                                class="custom-file-input @error('image') is-invalid @enderror"
                                                id="customFile" onchange="readURL(this);">
                                            <label class="custom-file-label"
                                                for="customFile">{{ __('Pilih file') }}</label>
                                        </div>
                                        @if ($errors->has('image'))
                                            <div class="help-block text-danger">
                                                {{ $errors->first('image') }}
                                            </div>
                                        @endif
                                        @if ($visitingDetails->getFirstMediaUrl('visitor'))
                                            <img class="img-thumbnail image-width mt-4 mb-3" id="previewImage"
                                                src="{{ asset($visitingDetails->getFirstMediaUrl('visitor')) }}"
                                                alt="your image" />
                                        @else
                                            <img class="img-thumbnail image-width mt-4 mb-3" id="previewImage"
                                                src="{{ asset('assets/img/default/user.png') }}" alt="your image" />
                                        @endif
                                    </div>

                                </div>
                            </div>

                            <div class="card-footer ">
                                <button class="btn btn-primary mr-1" type="submit">{{ __('Update') }}</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('scripts')
    <script src="{{ asset('assets/modules/select2/dist/js/select2.full.min.js') }}"></script>
    <script src="{{ asset('assets/modules/summernote/summernote-bs4.js') }}"></script>
    <script src="{{ asset('assets/modules/bootstrap-datepicker/js/bootstrap-datepicker.min.js') }}"></script>
    <script src="{{ asset('assets/modules/bootstrap-timepicker/js/bootstrap-timepicker.min.js') }}"></script>
    <script src="{{ asset('js/visitor/edit.js') }}"></script>
@endsection
