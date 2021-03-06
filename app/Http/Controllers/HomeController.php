<?php

/*
 * Taken from
 * https://github.com/laravel/framework/blob/5.3/src/Illuminate/Auth/Console/stubs/make/controllers/HomeController.stub
 */

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\Subject;
use App\Section;
use App\Clearance;
use App\User;
use App\Assign;
use Auth;

/**
 * Class HomeController
 * @package App\Http\Controllers
 */
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return Response
     */
    public function index()
    {
        if (Auth::User()->role == 'Teacher') {
            return redirect('teachC');
        } elseif (Auth::User()->role == 'Student') {
            return redirect('studC');
        } elseif (Auth::User()->role == 'request') {
            return redirect('logout');
        }
        return view('adminlte::home');
    }
    public function section($id)
    {   
        if (Auth::User()->role != 'Admin') {
            return back();
        }

        $subject = Subject::where('id', $id)
            ->first();
        $sections = Section::where('sub_id', $id)
            ->get();
        $students = Clearance::where('sub_id', $id)
            ->get();
        $users = User::where('role', 'Student')
            ->orderBy('name', 'asc')
            ->get();
        return view('subject.section', compact(
            'users',
            'subject',
            'sections',
            'students'
        ));
    }
    public function addsection(Request $request)
    {
        $sec = new Section;
        $sec->sub_id = $request->get('sub_id');
        $sec->section = $request->get('section');
        $sec->sem = $request->get('sem');
        $sec->sy = $request->get('sy');
        $sec->save();
        return back();
    }
    public function remremak(Request $request, $id)
    {
        $section = Section::where('id', $request->get('section'))
            ->delete();
        $clearance = Clearance::where('sec_id', $request->get('section'))
            ->delete();
        return back();
    }
    public function addclearance(Request $request)
    {
        $Clearance = new Clearance;
        $Clearance->sub_id = $request->get('sub_id');
        $Clearance->sec_id = $request->get('sec_id');
        $Clearance->stud_id = $request->get('stud_id');
        $Clearance->stat = 'ok';
        $Clearance->remark = 'none';
        $Clearance->save();
        return back();
    }
    public function remclearance($id)
    {
        Clearance::destroy($id);
        return back();
    }
    public function updataremak(Request $request, $id)
    {
        if (is_null($request->get('remark'))) {
            $rem = 'none';
        } else {
            $rem = $request->get('remark');
        }

        
        Clearance::where('id', $id)
            ->update([
                'stat' => $request->get('stat'),
                'remark' => $rem
            ]);
        return back();
    }
    public function assignsub()
    {
        if (Auth::User()->role != 'Admin') {
            return back();
        }
        $subjects = Assign::all();
        $users = User::where('role', 'Teacher')
            ->get();
        $sublists = Subject::all();
        return view('teacher.teacher',compact(
            'subjects',
            'users',
            'sublists'
        ));
    }
    public function insertsub(Request $request)
    {
        $sub = new Assign;
        $sub->tec_id = $request->get('tec_id');
        $sub->sub_id = $request->get('sub_id');
        $sub->sem = $request->get('sem');
        $sub->sy = $request->get('sy');
        $sub->save();
        return back();
    }
    public function removesub($id)
    {
        Assign::destroy($id);
        return back();
    }
    public function teacherclearance()
    {
        if (Auth::User()->role == 'Student') {
            return back();
        }
        $subjects = Assign::where('tec_id', Auth::User()->id)
            ->orderBy('sy', 'desc')
            ->get();
        $students = Clearance::all();
        return view('clearance.clearance', compact(
            'subjects',
            'students'
        ));
    }
    public function editclearancestat(Request $request, $id)
    {
        if (is_null($request->get('remark'))) {
            $rem = 'none';
        } else {
            $rem = $request->get('remark');
        }
        Clearance::where('id', $id)
            ->update([
                'stat' => $request->get('stat'),
                'remark' => $rem
            ]);
        return back();
    }
    public function student()
    {
        if (Auth::User()->role == 'Teacher') {
            return back();
        }
        $subjects = Clearance::where('stud_id', Auth::User()->id)
            ->get();
        return view('student.student', compact(
            'subjects'
        ));

    }
}