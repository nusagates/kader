<?php

namespace App\Http\Controllers;

use App\Models\Joblist;
use App\Models\Member;
use App\Models\Postal;
use Illuminate\Http\Request;
use Inertia\Inertia;

class MemberController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $members = Member::latest();
        if ($request->filled('search')) {
            $members->where(function ($q) use ($request) {
                $q->where('legal_name', 'like', '%' . $request->search . '%');
                $q->orWhere('nik', 'like', '%' . $request->search . '%');
                $q->orWhere('phone', 'like', '%' . $request->search . '%');
                $q->orWhere('email', 'like', '%' . $request->search . '%');
            });
        }
        if ($request->filled('filter') && $request->filled('value')) {
            if($request->filter=='village'){
                $members->where('postal->village', $request->value);
            }else{
                $members->where($request->filter, $request->value);
            }
        }
        return Inertia::render('Members/Index', [
            'members' => $members->paginate(20),
            'search' => $request->search,
            'req' => [
                'filter' => $this->filter($request->filter),
                'value' => $request->value,
            ]
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $jobs = Joblist::all();
        $postal = Postal::all();
        return Inertia::render('Members/Create', [
            'jobs' => $jobs,
            'postal' => $postal
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nik' => 'required|unique:' . Member::class,
            'legal_name' => 'required',
            'phone' => 'required',
            'email' => 'nullable|email',
            'pob' => 'required',
            'dob' => 'required:format_date:Y-m-d',
            'postal' => 'required',
        ]);
        Member::create($request->only([
            'nik', 'legal_name', 'initial', 'phone', 'email', 'gender', 'marital_status',
            'pob', 'dob', 'job', 'education', 'income', 'blood_group', 'postal', 'address', 'status'
        ]));

        return redirect('/member');
    }

    /**
     * Display the specified resource.
     */
    public function show(Member $member)
    {
        return Inertia::render('Members/Show',['member'=>$member]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Member $member)
    {
        $jobs = Joblist::all();
        $postal = Postal::all();
        return Inertia::render('Members/Create', [
            'jobs' => $jobs,
            'postal' => $postal,
            'member' => $member
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Member $member)
    {
        $request->validate([
            'nik' => 'required|unique:members,nik,' . $member->id,
            'legal_name' => 'required',
            'phone' => 'required',
            'email' => 'nullable|email',
            'pob' => 'required',
            'dob' => 'required:format_date:Y-m-d',
            'postal' => 'required',
        ]);
        $member->update($request->only([
            'nik', 'legal_name', 'initial', 'phone', 'email', 'gender', 'marital_status',
            'pob', 'dob', 'job', 'education', 'income', 'blood_group', 'postal', 'address', 'status'
        ]));
        return redirect('/member');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Member $member)
    {
        //
    }

    private function filter($string)
    {
        switch ($string) {
            case 'education': return 'Pendidikan';
            case 'job': return 'Pekerjaan';
            case 'village': return 'Kelurahan';
        }
    }
}
