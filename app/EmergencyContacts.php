<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

class EmergencyContacts extends Model
{
    use HasApiTokens;
    protected $table = "emergency_contact";
	protected $fillable = ['id','fname','mname','lname','contact_number','address', 'updated_at', 'created_at'];
}
