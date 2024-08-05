<?php

namespace App\Http\Controllers\Admin;

use App\Exports\Report;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Services\Visitor\VisitorService;

class ReportController extends Controller
{
    protected $visitorService;

    public function __construct(VisitorService $visitorService)
    {
        $this->visitorService = $visitorService;
        $this->middleware('auth');
        $this->data['sitetitle'] = 'Report';

        $this->middleware(['permission:report']);
    }
    public function index()
    {
        return view('admin.report.index', $this->data);
    }
    public function store(Request $request)
    {
        $data = $request->validate([
            'start_date' => 'required|date',
            'end_date' => 'required|date',
        ]);
        $visitor  = $this->visitorService->report($data['start_date'], $data['end_date']);
        return Excel::download(new Report($visitor), 'Report.xlsx');
        
    }
}
