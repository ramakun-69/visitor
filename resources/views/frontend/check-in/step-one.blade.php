@extends('frontend.layouts.frontend')

@section('content')
    <div class="swal" data-swal="{{ session('warning') }}"></div>
    <section id="pm-banner-1" class="custom-css-step">
        <div class="container">
            <div class="card" style="margin-top:40px;">
                <div class="card-header" id="Details" align="center">
                    <h4 style="color: #111570;font-weight: bold">{{ __('Data Visitor') }}</h4>
                </div>
                <div class="card-body">
                    <div style="margin: 10px;">
                        {!! Form::open(['route' => 'check-in.step-one.next', 'class' => 'form-horizontal', 'files' => true]) !!}
                        <div class="save">
                            <div class="visitor" id="visitor">
                                <div class="row">
                                    <div class="col-md-4 col-sm-6">
                                        <div class="form-group {{ $errors->has('id_card') ? 'has-error' : '' }}">
                                            {!! Html::decode(
                                                Form::label('id_card', 'ID Kartu <span class="text-danger">*</span>', ['class' => 'control-label']),
                                            ) !!}
                                            {!! Form::text(
                                                'id_card',
                                                isset($visitor->id_card) ? $visitor->id_card : null,
                                                '' == 'required'
                                                    ? ['class' => 'form-control input', 'id ' => 'id_card', 'required' => 'required']
                                                    : ['class' => 'form-control input', 'id ' => 'id_card'],
                                            ) !!}
                                            {!! $errors->first('first_name', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group {{ $errors->has('first_name') ? 'has-error' : '' }}">
                                            {!! Html::decode(
                                                Form::label('first_name', 'Nama Depan <span class="text-danger">*</span>', ['class' => 'control-label']),
                                            ) !!}
                                            {!! Form::text(
                                                'first_name',
                                                isset($visitor->first_name) ? $visitor->first_name : null,
                                                '' == 'required'
                                                    ? ['class' => 'form-control input', 'id ' => 'first_name']
                                                    : ['class' => 'form-control input', 'id ' => 'first_name'],
                                            ) !!}
                                            {!! $errors->first('first_name', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group {{ $errors->has('last_name') ? 'has-error' : '' }}">
                                            {!! Html::decode(
                                                Form::label('last_name', 'Nama Belakang <span class="text-danger">*</span>', ['class' => 'control-label']),
                                            ) !!}
                                            {!! Form::text(
                                                'last_name',
                                                isset($visitor->last_name) ? $visitor->last_name : null,
                                                '' == 'required'
                                                    ? ['class' => 'form-control input', 'id ' => 'last_name']
                                                    : ['class' => 'form-control input', 'id ' => 'last_name'],
                                            ) !!}
                                            {!! $errors->first('last_name', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group {{ $errors->has('email') ? 'has-error' : '' }}">
                                            {!! Html::decode(Form::label('email', 'Email <span class="text-danger">*</span>', ['class' => 'control-label'])) !!}
                                            {!! Form::email(
                                                'email',
                                                isset($visitor->email) ? $visitor->email : null,
                                                'required' == 'required'
                                                    ? ['class' => 'form-control input', 'id ' => 'email']
                                                    : ['class' => 'form-control input', 'id ' => 'email'],
                                            ) !!}
                                            {!! $errors->first('email', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group {{ $errors->has('pekerjaan') ? 'has-error' : '' }}">
                                            {!! Html::decode(
                                                Form::label('pekerjaan', 'Pekerjaan <span class="text-danger">*</span>', ['class' => 'control-label']),
                                            ) !!}
                                            {!! Form::text(
                                                'pekerjaan',
                                                isset($visitor->pekerjaan) ? $visitor->pekerjaan : null,
                                                '' == 'required'
                                                    ? ['class' => 'form-control input', 'id ' => 'pekerjaan', 'required' => 'required']
                                                    : ['class' => 'form-control input', 'id ' => 'pekerjaan'],
                                            ) !!}
                                            {!! $errors->first('pekerjaan', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group {{ $errors->has('address') ? 'has-error' : '' }}">
                                            <label for="address">{{ __('Alamat') }}</label>
                                            <textarea name="address"
                                                class="summernote-simple form-control height-textarea-css @error('address') is-invalid @enderror" id="address">{{ isset($visitor->address) ? $visitor->address : null }}</textarea>
                                            @error('address')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group {{ $errors->has('phone') ? 'has-error' : '' }}">
                                            {!! Html::decode(
                                                Form::label('phone', 'Telpon (Whatsapp) <span class="text-danger">*</span>', ['class' => 'control-label']),
                                            ) !!}
                                            {!! Form::text(
                                                'phone',
                                                isset($visitor->phone) ? $visitor->phone : null,
                                                'required' == 'required'
                                                    ? [
                                                        'class' => 'form-control input',
                                                        'id ' => 'phone',
                                                        'placeholder' => 'Gunakan kode negara, contoh : +6283814305090',
                                                    ]
                                                    : [
                                                        'class' => 'form-control input',
                                                        'id ' => 'phone',
                                                        'placeholder' => 'Gunakan kode negara, contoh : +6283814305090',
                                                    ],
                                            ) !!}
                                            {!! $errors->first('phone', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group {{ $errors->has('employee_id') ? 'has-error' : '' }}">
                                            <label for="employee_id">{{ __('Pilih Karyawan') }}</label> <span
                                                class="text-danger">*</span>
                                            <select id="employee_id" name="employee_id"
                                                class="form-control select2 @error('employee_id') is-invalid @enderror">
                                                <option value="">{{ __('Pilih Karyawan') }}</option>
                                                @foreach ($employees as $key => $employee)
                                                    <option value="{{ $employee->id }}" value="{{ $employee->id }}"
                                                        {{ isset($visitor->invitation->employee_id) && $visitor->invitation->employee_id == $employee->id ? 'selected' : '' }}>
                                                        {{ $employee->name }} ( {{ $employee->department->name }} )
                                                    </option>
                                                @endforeach
                                            </select>
                                            {!! $errors->first('employee_id', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group {{ $errors->has('gender') ? 'has-error' : '' }}">
                                            <label for="gender">{{ __('Jenis Kelamin') }}</label> <span
                                                class="text-danger">*</span>
                                            <select id="gender" name="gender"
                                                class="form-control @error('gender') is-invalid @enderror">
                                                @foreach (trans('genders') as $key => $gender)
                                                    <option value="{{ $key }}"
                                                        {{ isset($visitor->gender) && $visitor->gender == $key ? 'selected' : '' }}>
                                                        {{ $gender }}</option>
                                                @endforeach
                                            </select>
                                            @error('gender')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3 col-sm-12">
                                        <div class="form-group {{ $errors->has('id_type') ? 'has-error' : '' }}">
                                            {!! Form::label('id_type', 'Pengenal/Bukti Diri', ['class' => 'control-label']) !!}
                                            <div>
                                                <label class="ml-3 mr-5">{!! Form::radio('id_type', 'KTP', isset($visitor->id_type) && $visitor->id_type == 'KTP', [
                                                    'class' => 'form-check-input',
                                                ]) !!} KTP</label>

                                                <label class="mr-5">{!! Form::radio('id_type', 'SIM', isset($visitor->id_type) && $visitor->id_type == 'SIM', [
                                                    'class' => 'form-check-input',
                                                ]) !!} SIM</label>

                                                <label>{!! Form::radio('id_type', 'Lainnya', isset($visitor->id_type) && $visitor->id_type == 'Lainnya', [
                                                    'class' => 'form-check-input',
                                                ]) !!} Lainnya</label>
                                            </div>
                                            {!! $errors->first('id_type', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <div
                                            class="form-group {{ $errors->has('national_identification_no') ? 'has-error' : '' }}">
                                            {!! Form::label('national_identification_no', 'No ID', ['class' => 'control-label']) !!}
                                            {!! Form::text(
                                                'national_identification_no',
                                                isset($visitor->national_identification_no) ? $visitor->national_identification_no : null,
                                                '' == 'required'
                                                    ? ['class' => 'form-control input', 'id ' => 'national_identification_no']
                                                    : ['class' => 'form-control input', 'id ' => 'national_identification_no'],
                                            ) !!}
                                            {!! $errors->first('national_identification_no', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12">
                                        <div class="form-group {{ $errors->has('transport_type') ? 'has-error' : '' }}">
                                            {!! Form::label('transport_type', 'Jenis Kendaraan', ['class' => 'control-label']) !!}
                                            <div style="display: flex; align-items: center;">
                                                <label class="ml-3 mr-5">
                                                    {!! Form::radio(
                                                        'transport_type',
                                                        'Mini Bus',
                                                        isset($visitor->transport_type) && $visitor->transport_type == 'Mini Bus',
                                                        ['class' => 'form-check-input', 'id' => 'mini-bus'],
                                                    ) !!} Mini Bus
                                                </label>

                                                <label class="mr-5">
                                                    {!! Form::radio(
                                                        'transport_type',
                                                        'Truck',
                                                        isset($visitor->transport_type) && $visitor->transport_type == 'Truck',
                                                        ['class' => 'form-check-input', 'id' => 'truck'],
                                                    ) !!} Truck
                                                </label>

                                                <label class="mr-5">
                                                    {!! Form::radio(
                                                        'transport_type',
                                                        'Sedan',
                                                        isset($visitor->transport_type) && $visitor->transport_type == 'Sedan',
                                                        ['class' => 'form-check-input', 'id' => 'sedan'],
                                                    ) !!} Sedan
                                                </label>

                                                <label>
                                                    {!! Form::radio(
                                                        'transport_type',
                                                        'other',
                                                        isset($visitor->transport_type) && !in_array($visitor->transport_type, ['Mini Bus', 'Truck', 'Sedan']),
                                                        ['class' => 'form-check-input', 'id' => 'other'],
                                                    ) !!} Lainnya

                                                </label>
                                                <label for="">
                                                    {!! Form::text(
                                                        'transport_type',
                                                        isset($visitor->transport_type) && !in_array($visitor->transport_type, ['Mini Bus', 'Truck', 'Sedan'])
                                                            ? $visitor->transport_type
                                                            : null,
                                                        [
                                                            'class' => 'form-control input',
                                                            'id' => 'other-transport-type',
                                                            'placeholder' => 'Nama Kendaraan Lainnya',
                                                            'disabled' =>
                                                                isset($visitor->transport_type) && !in_array($visitor->transport_type, ['Mini Bus', 'Truck', 'Sedan'])
                                                                    ? false
                                                                    : true,
                                                            'style' => 'display:inline-block; width:auto; margin-left:10px;',
                                                        ],
                                                    ) !!}
                                                </label>
                                            </div>
                                            {!! $errors->first('transport_type', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-sm-12">
                                        <div class="form-group {{ $errors->has('visitor_category') ? 'has-error' : '' }}">
                                            {!! Form::label('visitor_category', 'Kategori Visitor', ['class' => 'control-label']) !!}
                                            <div style="display: flex; align-items: center;">
                                                <label class="ml-3 mr-5">
                                                    {!! Form::radio(
                                                        'visitor_category',
                                                        'tamu',
                                                        isset($visitor->visitor_category) && $visitor->visitor_category == 'tamu',
                                                        ['class' => 'form-check-input', 'id' => 'tamu'],
                                                    ) !!}Tamu
                                                </label>

                                                <label>
                                                    {!! Form::radio(
                                                        'visitor_category',
                                                        'rekanan',
                                                        isset($visitor->visitor_category) && $visitor->visitor_category != 'tamu',
                                                        ['class' => 'form-check-input', 'id' => 'rekanan'],
                                                    ) !!} Rekanan
                                                </label>
                                                <label for="">
                                                    <select name="visitor_category" id="rekanan_value" class="form-control"
                                                        style="margin-left:12px;"
                                                        {{ isset($visitor->visitor_category) && $visitor->visitor_category == 'tamu' ? 'disabled' : '' }}>
                                                        <option value="" disabled selected>--Silahkan Pilih--</option>
                                                        <option value="buyer"
                                                            {{ isset($visitor->visitor_category) && $visitor->visitor_category == 'buyer' ? 'selected' : '' }}>
                                                            Buyer</option>
                                                        <option value="vendor"
                                                            {{ isset($visitor->visitor_category) && $visitor->visitor_category == 'vendor' ? 'selected' : '' }}>
                                                            Vendor</option>
                                                        <option value="suplier"
                                                            {{ isset($visitor->visitor_category) && $visitor->visitor_category == 'suplier' ? 'selected' : '' }}>
                                                            Suplier</option>
                                                    </select>
                                                </label>
                                                <label for=""></label>
                                            </div>
                                            {!! $errors->first('transport_type', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-6">
                                        <div class="form-group {{ $errors->has('jumlah_orang') ? 'has-error' : '' }}">
                                            {!! Form::label('jumlah_orang', 'Jumlah Orang', ['class' => 'control-label']) !!}
                                            {!! Form::text(
                                                'jumlah_orang',
                                                isset($visitor->jumlah_orang) ? $visitor->jumlah_orang : null,
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
                                        <div class="form-group {{ $errors->has('visits_plaace') ? 'has-error' : '' }}">
                                            <label for="visits_plaace">{{ __('Tempat Yang Dikunjungi') }}</label> <span
                                                class="text-danger">*</span>
                                            <select id="visit_place" name="visit_place"
                                                class="form-control @error('visit_place') is-invalid @enderror">
                                                <option value="">{{ __('Pilih Tempat Yang Dikunjungi') }}</option>
                                                @foreach ($visitPlaces as $key => $vp)
                                                    <option value="{{ $vp->id }}" value="{{ $vp->id }}"
                                                        {{ isset($visitor->visit_place) && $visitor->visit_place == $vp->id ? 'selected' : '' }}>
                                                        {{ $vp->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            {!! $errors->first('visit_place', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                   
                                </div>

                                <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group {{ $errors->has('company_name') ? 'has-error' : '' }}">
                                            {!! Form::label('company_name', 'Nama Perusahaan', ['class' => 'control-label']) !!}
                                            {!! Form::text(
                                                'company_name',
                                                isset($visitor->company_name) ? $visitor->company_name : null,
                                                '' == 'required'
                                                    ? ['class' => 'form-control input', 'id ' => 'company_name']
                                                    : ['class' => 'form-control input', 'id ' => 'company_name'],
                                            ) !!}
                                            {!! $errors->first('company_name', '<p class="text-danger">:message</p>') !!}
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group {{ $errors->has('purpose') ? 'has-error' : '' }}">
                                            <label for="purpose">{{ __('Keperluan') }}</label> <span
                                                class="text-danger">*</span>
                                            <textarea name="purpose"
                                                class="summernote-simple form-control height-textarea-css @error('purpose')is-invalid @enderror" id="purpose">{{ old('purpose') }}</textarea>
                                            @error('purpose')
                                                <div class="invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>

                                </div>


                                <div class="row">
                                    <div class="col-md-6">
                                        <a href="{{ route('check-in') }}" class="btn btn-danger float-left text-white">
                                            <i class="fa fa-arrow-left" aria-hidden="true"></i> {{ __('Batal') }}
                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-success float-right" id="continue">
                                            <i class="fa fa-arrow-right" aria-hidden="true"></i> {{ __('Lanjut') }}
                                        </button>
                                    </div>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        $(document).ready(function() {
            $('.select2').select2();
            var swal = $(".swal").data('swal');

            if (swal) {
                Swal.fire({
                    title: "Gagal",
                    text: swal,
                    icon: "warning",
                    showConfirmButton: false,
                    timer : 2000,
                    timerProgressBar: true
                });
            }
        })
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var otherRadio = document.getElementById('other');
            var otherTextInput = document.getElementById('other-transport-type');

            var radioButtons = document.querySelectorAll('input[name="transport_type"]');
            radioButtons.forEach(function(radio) {
                radio.addEventListener('change', function() {
                    if (otherRadio.checked) {
                        otherTextInput.disabled = false;
                    } else {
                        otherTextInput.disabled = true;
                        otherTextInput.value = ''; // Clear the input if not 'other'
                    }
                });
            });
        });
        document.addEventListener('DOMContentLoaded', function() {
            var rekanan = document.getElementById('rekanan');
            var rekananSelect = document.getElementById('rekanan_value');

            var categoryVisitor = document.querySelectorAll('input[name="visitor_category"]');
            categoryVisitor.forEach(function(radio) {
                radio.addEventListener('change', function() {
                    if (rekanan.checked) {
                        rekananSelect.disabled = false;
                    } else {
                        rekananSelect.disabled = true;
                        rekananSelect.value = ''; // Clear the input if not 'other'
                    }
                });
            });
        });
    </script>
@endsection
