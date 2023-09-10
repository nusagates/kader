<?php

namespace Database\Seeders;

use App\Models\Joblist;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AppSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $jobslists = [
            "Tidak bekerja (Di rumah saja)",
            "Pensiunan",
            "PNS Kementerian/Lembaga/Pemda",
            "TNI/Polisi",
            "Guru/Dosen",
            "Pegawai Swasta",
            "Pengusaha/Wiraswasta",
            "Pengacara/Hakim/Jaksa/Notaris",
            "Seniman/Pelukis/Artis/Sejenis",
            "Dokter/Bidan/Perawat",
            "Pilot/Pramugari",
            "Pedagang",
            "Petani/Peternak",
            "Nelayan",
            "Buruh (Tani/Pabrik/Bangunan)",
            "Sopir/Masinis/Kondektur",
            "Politikus",
            "Lainnya"
        ];

        foreach($jobslists as $name){
            Joblist::firstOrCreate(['name'=>$name]);
        }
    }
}
