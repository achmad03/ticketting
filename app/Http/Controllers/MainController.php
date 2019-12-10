<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MainController extends Controller
{
    public function index(){
        
        $obj_pack = DB::table('objek')
            ->select('objek_nama','objek_biaya','galeri_letak')
            ->leftJoin('galeri', 'galeri.galeri_id', '=', 'objek.objek_galeri_id')
            ->paginate(3);
        $resp = DB::table('respon')
            ->leftJoin('galeri', 'galeri.galeri_id', '=', 'respon.respon_galeri_id')
            ->get();
        $pak_rinc = DB::table('paket')
            ->select('paket_nama','rincPaket_biaya','objek_nama')
            ->leftJoin('rincPaket', 'rincPaket.rincPaket_paket_id', '=', 'paket.paket_id')
            ->leftJoin('objek', 'rincPaket.rincPaket_objek_id', '=', 'objek.objek_id')
            ->get();
        return view('app.beranda.beranda', ['obj_pack' => $obj_pack], ['pak_rinc' => $pak_rinc], ['resp' => $resp]);
    }
}
