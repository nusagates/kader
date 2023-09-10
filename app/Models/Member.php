<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Member extends Model
{
    use HasFactory;
    protected $guarded = [];

    protected $casts = [
        'address' => 'array',
        'postal' => 'array',
    ];

    public function children()
    {
        return $this->hasMany(Children::class);
    }
    public function organizations()
    {
        return $this->hasMany(Organization::class);
    }
}
