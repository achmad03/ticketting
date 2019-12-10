<?php

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

Route::get('/','MainController@index');

Route::get('/agenda', function () {
    return view('app.agenda.agenda');
});
Route::get('/galeri', function () {
    return view('app.galeri.galeri');
});
Route::get('/kontak', function () {
    return view('app.kontak.kontak');
});
Route::get('/paket', function () {
    return view('app.paket_wisata.paket_wisata');
});

Route::get('/clear-cache', function() {Artisan::call('cache:clear');    return "Cache is cleared";});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/admin/dashboard', function(){
    return 'Wellcome Admin!';
})->name('admin.dashboard');