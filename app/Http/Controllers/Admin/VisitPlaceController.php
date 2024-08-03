<?php

namespace App\Http\Controllers\Admin;

use App\VisitsPlace;
use App\Enums\Status;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\Http\Controllers\Controller;
use App\Http\Requests\VisitPlaceRequest;
use App\Http\Requests\DesignationsRequest;

class VisitPlaceController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
        $this->data['sitetitle'] = 'Visits Place';

        $this->middleware(['permission:visitPlace']);
    }

    public function index()
    {
        return view('admin.visit-place.index', $this->data);
    }

    public function getVisitPlace(Request $request)
    {

        $visitPlace = VisitsPlace::orderBy('id', 'desc')->get();

        $i         = 1;
        $vpArray = [];
        if (!blank($visitPlace)) {
            foreach ($visitPlace as $vp) {
                $vpArray[$i]          = $vp;
                $vpArray[$i]['name']  = Str::limit($vp->name, 100);
                $vpArray[$i]['setID'] = $i;
                $i++;
            }
        }
        return Datatables::of($vpArray)
            ->addColumn('action', function ($vp) {
                $retAction = '';

                $retAction .= '<a href="' . route('admin.visitPlace.edit', $vp) . '" class="btn btn-sm btn-icon float-left btn-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="far fa-edit"></i></a>';

                $retAction .= '<form class="float-left pl-2" action="' . route('admin.visitPlace.destroy', $vp) . '" method="POST">' . method_field('DELETE') . csrf_field() . '<button class="btn btn-sm btn-icon btn-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash"></i></button></form>';

                return $retAction;
            })

            ->editColumn('status', function ($vp) {
                return ($vp->status == 5 ? trans('statuses.' . Status::ACTIVE) : trans('statuses.' . Status::INACTIVE));
            })
            ->editColumn('id', function ($vp) {
                return $vp->setID;
            })
            ->make(true);
    }

    public function create()
    {
        return view('admin.visit-place.create', $this->data);
    }

    public function store(VisitPlaceRequest $request)
    {
        $input = $request->all();
        VisitsPlace::create($input);
        return redirect()->route('admin.visitPlace.index')->with('success', 'Visits Place created successfully');
    }

    public function edit($id)
    {
        $this->data['visitPlace']  = VisitsPlace::findOrFail($id);
        return view('admin.visit-place.edit', $this->data);

    }

    public function update(Request $request, $id)
    {

        $this->validate($request, ['name' => 'required|string|max:255|unique:visits_places,name,' . $id]);
        $input = $request->all();
        $visitPlace = VisitsPlace::findOrFail($id);
        $visitPlace->update($input);
        return redirect(route('admin.visitPlace.index'))->withSuccess('The Data Updated Successfully');
    }

    public function destroy($id)
    {
        VisitsPlace::findOrFail($id)->delete();
        return redirect(route('admin.visitPlace.index'))->withSuccess('The Data Deleted Successfully');
    }
}
