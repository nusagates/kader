<?php

namespace App\Http\Controllers;

use App\Models\Member;
use App\Models\Organization;
use Illuminate\Http\Request;
use Inertia\Inertia;

class OrganizationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Member $member)
    {
        return Inertia::render('Organizations/Create', ['member' => $member]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, Member $member)
    {
        $request->validate([
            'name' => 'required',
            'title' => 'required',
        ]);
        $member->organizations()->firstOrCreate(
            ['name' => $request->name],
            [
                'level' => $request->level,
                'title' => $request->title,
                'started_at'=>$request->started_at,
                'finished_at'=>$request->finished_at
            ]
        );
        return redirect('/member/' . $member->id);
    }

    /**
     * Display the specified resource.
     */
    public function show(Organization $organization)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Organization $organization)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Organization $organization)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Organization $organization)
    {
        //
    }
}
