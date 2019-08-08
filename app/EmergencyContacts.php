<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EmergencyContacts extends Model
{
    public $primaryKey = 'id';
    protected $table = "emergency_contact";
	protected $fillable = ['id','fname','mname','lname','contact_number','address', 'updated_at', 'created_at'];
}
