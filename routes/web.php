<?php

use App\Http\Controllers\MemberController;
use App\Http\Controllers\NavigationController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\UserController;
use App\Models\Member;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware' => ['auth', 'verified']], function () {
    Route::get('/dashboard', [NavigationController::class, 'dashboard'])->name('dashboard');
    Route::resource('user', UserController::class);
    Route::resource('member', MemberController::class);
});


Route::middleware('auth')->group(function () {
Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
        'members'=>Member::latest()->paginate(20)
    ]);
});
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';
