<?php

namespace Database\Factories;

use App\Models\Member;
use App\Models\Postal;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Member>
 */
class Memberfactory extends Factory
{
    protected $model = Member::class;
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = $this->faker->name;
        $postal = Postal::inRandomOrder()->first();
        $time = $this->faker->dateTimeBetween('-60 years', '-17 years');
        return [
            'nik' => $this->faker->unique()->numberBetween(100000000,199999999),
            'legal_name' => $name,
            'initial' => strtok($name, " "),
            'phone' => $this->faker->e164PhoneNumber,
            'email' => $this->faker->email,
            'gender' => $this->faker->randomElement(['Wanita', "Pria"]),
            'marital_status' => $this->faker->randomElement(['Belum Menikah', "Menikah"]),
            'pob' => $this->faker->city,
            'dob' => $time->format('Y-m-d'),
            'job' => $this->faker->jobTitle,
            'education' => $this->faker->randomElement(['Tidak Sekolah', 'RA', 'TK', 'MI', 'SD', 'SLTP', 'SLTA', 'D1', 'D2', 'D3', 'D4', 'S1', 'S2', 'S3']),
            'income' => $this->faker->numberBetween(500000,50000000),
            'blood_group' => $this->faker->randomElement(['A', "B", "AB", "O"]),
            'postal' => $postal->toArray(),
            'address' => [
                'rt'=>$this->faker->numberBetween(1,10),
                'rw'=>$this->faker->numberBetween(1,10),
                'street'=>$this->faker->address
            ],
            'status' => 'active'
        ];
    }
}
