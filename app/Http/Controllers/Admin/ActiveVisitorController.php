<?php

namespace App\Http\Controllers\Admin;

use App\Enums\Status;
use App\Http\Controllers\Controller;
use App\Http\Requests\VisitorRequest;
use App\Models\Employee;
use App\Models\VisitingDetails;
use App\Http\Services\Visitor\VisitorService;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Str;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Validator;

class ActiveVisitorController extends Controller
{
    protected $visitorService;

    public function __construct(VisitorService $visitorService)
    {
        $this->visitorService = $visitorService;

        $this->middleware('auth');
        $this->data['sitetitle'] = 'Visitors';

        $this->middleware(['permission:visitors'])->only('index');
        $this->middleware(['permission:visitors_create'])->only('create', 'store');
        $this->middleware(['permission:visitors_edit'])->only('edit', 'update');
        $this->middleware(['permission:visitors_delete'])->only('destroy');
        $this->middleware(['permission:visitors_show'])->only('show');
    }
    public function index(Request $request)
    {
        return view('admin.active-visitor.index');
    }

    public function getVisitor(Request $request)
    {
        $visitingDetails = $this->visitorService->notCheckout();
        $i = 1;
        $visitingDetailArray = [];

        if (!blank($visitingDetails)) {
            foreach ($visitingDetails as $visitingDetail) {
                $visitingDetailArray[$i] = $visitingDetail;
                $visitingDetailArray[$i]['setID'] = $i;
                $i++;
            }
        }

        return Datatables::of($visitingDetailArray)
            ->addColumn('action', function ($visitingDetail) {
                $retAction = '';

                if ((auth()->user()->can('visitors_show')) && (!$visitingDetail->checkout_at)) {
                    $retAction .= '<a href="' . route('admin.visitors.checkout', $visitingDetail) . '" class="btn btn-sm btn-icon mr-1 float-left btn-success" data-toggle="tooltip" data-placement="top" title="Check-Out"><i class="fas fa-sign-out-alt"></i></a>';
                }
                return $retAction;
            })
            ->editColumn('name', function ($visitingDetail) {
                return Str::limit(optional($visitingDetail->visitor)->name, 50);
            })
            ->addColumn('image', function ($visitingDetail) {
                return '<figure class="avatar mr-2"><img src="' . $visitingDetail->images . '" alt=""></figure>';
            })
            ->editColumn('visitor_id', function ($visitingDetail) {
                return $visitingDetail->reg_no;
            })
            ->editColumn('email', function ($visitingDetail) {
                return Str::limit(optional($visitingDetail->visitor)->email, 50);
            })
            ->editColumn('phone', function ($visitingDetail) {
                return Str::limit(optional($visitingDetail->visitor)->phone, 50);
            })
            ->editColumn('employee_id', function ($visitingDetail) {
                return optional($visitingDetail->employee->user)->name;
            })
            ->editColumn('date', function ($visitingDetail) {
                return date('d-m-Y h:i A', strtotime($visitingDetail->checkin_at));
            })
            ->editColumn('checkout', function ($visitingDetail) {
                if ($visitingDetail->checkout_at) {
                    return date('d-m-Y h:i A', strtotime($visitingDetail->checkout_at));
                } else {
                    return 'N/A';
                }
            })
            ->editColumn('id', function ($visitingDetail) {
                return $visitingDetail->setID;
            })
            ->addColumn('status', function ($visitingDetail) {
                $checkinTime = new \DateTime($visitingDetail->checkin_at);
                $currentTime = new \DateTime();
                $interval = $currentTime->diff($checkinTime);
                $hours = ($interval->days * 24) + $interval->h;
                if ($visitingDetail->checkout_at == Null) {
                    if ($hours > 8) {
                        return '<span class="badge badge-warning">Warning</span>';
                    } else {
                        return '<span class="badge badge-success">On Time</span>';
                    }
                }else{
                    return '<span class="badge badge-success">Check Out</span>';
                }
            })
            ->rawColumns(['name', 'action', 'status'])
            ->escapeColumns([])
            ->make(true);
    }
}
