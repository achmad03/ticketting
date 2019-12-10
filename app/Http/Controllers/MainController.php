<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MainController extends Controller
{
    public function index(){
        $obj_pack = DB::table('objek')
        ->leftJoin('galeri', 'galeri.galeri_id', '=', 'objek.objek_galeri_id')
        ->leftJoin('rincPaket', 'rincPaket.rincPaket_objek_id', '=', 'objek.objek_id')
        ->leftJoin('paket', 'paket.paket_id', '=', 'rincPaket.rincPaket_paket_id')
        ->get();
        return view('app.beranda.beranda', ['obj_pack' => $obj_pack]);
    }
}
