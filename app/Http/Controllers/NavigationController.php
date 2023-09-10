<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class NavigationController extends Controller
{
    public function dashboard()
    {

        return Inertia::render(
            'Dashboard',
            ['users' => User::latest()->paginate(20)]
        );
    }
}
