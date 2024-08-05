<?php

namespace App\Exports;



use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class Report implements FromView,ShouldAutoSize
{
    /**
    * @return \Illuminate\Support\Collection
    */
    protected $visitor;
    public function __construct($visitor) {
        $this->visitor = $visitor;
    }
    public function view() : View
    {
        $visitor = $this->visitor;
        return view("admin.report.print", compact('visitor'));
    }
}
