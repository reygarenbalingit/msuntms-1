<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

class School extends Model
{
	use HasApiTokens;
	protected $table = "schools";
	protected $fillable = ['id','school_name', 'address', 'updated_at', 'created_at'];
}
