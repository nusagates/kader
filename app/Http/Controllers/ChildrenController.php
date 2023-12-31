<?php

namespace App\Http\Controllers;

use App\Models\Children;
use App\Models\Member;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ChildrenController extends Controller
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
        return Inertia::render('Children/Create', ['member' => $member]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request, Member $member)
    {
        $request->validate([
            'name' => 'required'
        ]);
        $member->children()->firstOrCreate(['name'=>$request->name],['dob'=>$request->dob,'education'=>$request->education]);
        return redirect('/member/'.$member->id);
    }

    /**
     * Display the specified resource.
     */
    public function show(Children $children)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Children $children)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Children $children)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Children $children)
    {
        //
    }
}
