<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('members', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->unique()->constrained()->nullOnDelete()->cascadeOnUpdate();
            $table->string('nik')->unique();
            $table->string('legal_name');
            $table->string('phone')->nullable();
            $table->string('email')->nullable();
            $table->string('display_name')->nullable();
            $table->string('initial')->nullable();
            $table->enum('gender', ['Pria', 'Wanita'])->nullable();
            $table->enum('marital_status', ['Belum Menikah', 'Menikah', 'Cerai Hidup', 'Cerai Mati'])->nullable();
            $table->enum('education', ['Tidak Sekolah','RA', 'TK', 'MI', 'SD', 'SLTP', 'SLTA', 'D1', 'D2', 'D3', 'D4', 'S1', 'S2', 'S3'])->nullable();
            $table->enum('blood_group', ['A', 'B', 'AB', 'O'])->nullable();
            $table->string('pob')->nullable();
            $table->date('dob')->nullable();
            $table->string('job')->nullable();
            $table->double('income')->default(0);
            $table->json('postal')->nullable();
            $table->json('address');
            $table->enum('status', ['submitted', 'active', 'inactive', 'deceased', 'suspended', 'dismissed', 'transferred'])->default('submitted');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('members');
    }
};
