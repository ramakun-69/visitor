<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Services\Visitor\VisitorService;
use Barryvdh\DomPDF\Facade\Pdf;

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
        $pdf = Pdf::loadView('admin.report.print', compact('visitor'));
        return $pdf->setPaper('a4', 'potrait')->stream();
    }
}
