<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        @media print {

            /* Gaya untuk cetakan */
            body {
                margin: 0;
                /* Jarak antara ujung halaman dan konten */
                padding: 0;
            }
        }

        .border {
            border-color: #000000;
            border-style: double;
            border-top-width: 3px;
            border-bottom-width: 1.5px;
            border-left-width: 0px;
            border-right-width: 0px;
            margin-top: 5px;
        }


        @media (max-width: 600px) {
            .right-aligned {
                flex-direction: column;
                align-items: flex-end;
            }
        }

        .border-dua {
            display: inline-block;
            position: relative;
            text-align: center;
            font-family: Arial, sans-serif;
            font-size: 15px;
            text-transform: uppercase;
            margin-bottom: 0px;
        }

        .border-dua::after {
            text-align: center;
            content: '';
            display: block;
            width: 100%;
            height: 2px;
            position: relative;
            background: black;
        }

        .table-bordered {
            border-collapse: collapse;
            width: 100%;
        }

        .table-bordered th,
        .table-bordered td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .table-bordered th {
            padding-top: 12px;
            padding-bottom: 12px;
            background-color: #f2f2f2;
            color: black;
        }

        .table-container {
            width: 100%;
        }

        .table-container td {
            width: 50%;
            font-size: 14px;
            font-family: Arial, sans-serif;
        }
    </style>
</head>

<body>
    <table class="table table-bordered" style="margin-top: 15px; margin-bottom: 15px;">
        <thead style="text-align: center">
            <tr>
                <th>{{ __('levels.id') }}</th>
                <th>{{ __('ID Card') }}</th>
                <th>{{ __('levels.name') }}</th>
                <th>{{ __('levels.email') }}</th>
                <th>{!! __("Alamat") !!}</th>
                <th>{{ __("Perusahaan") }}</th>
                <th>{{ __("Tanda Pengenal/Bukti Diri") }}</th>
                <th>{{ __("No ID") }}</th>
                <th>{{ __('Pekerjaan') }}</th>
                <th>{{ __('Jenis Kendaraan') }}</th>
                <th>{{ __('Karyawan') }}</th>
                <th>{{ __("Keperluan") }}</th>
                <th>{{ __("Kategori Visitor") }}</th>
                <th>{{ __("Jumlah Orang") }}</th>
                <th>{{ __('Tempat Yang Dikunjungi') }}</th>
                <th>{{ __('Masuk') }}</th>
                <th>{{ __('Keluar') }}</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($visitor as $v)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $v->visitor->id_card}}</td>
                    <td>{{ Str::limit(optional($v->visitor)->name, 50)}}</td>
                    <td>{{ $v->visitor->email}}</td>
                    <td>{{ $v->visitor->address}}</td>
                    <td>{{ $v->company_name}}</td>
                    <td>{{ $v->visitor->id_type}}</td>
                    <td>{{ $v->visitor->national_identification_no}}</td>
                    <td>{{ $v->visitor->pekerjaan}}</td>
                    <td>{{ $v->visitor->transport_type}}</td>
                    <td>{{ $v->employee->user->name}}</td>
                    <td>{!! $v->purpose !!}</td>
                    <td>{{ Str::ucfirst($v->visitor->visitor_category) }}</td>
                    <td>{{ $v->visitor->jumlah_orang }} Orang</td>
                    <td>{{ $v->visitor->visitPlace->name}}</td>
                    <td>{{ $v->checkin_at}}</td>
                    <td>{{ $v->checkout_at}}</td>
                </tr>
            @endforeach

        </tbody>
    </table>
</body>

</html>
