<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class School extends Model
{
	protected $table = "schools";
	protected $fillable = ['id','school_name', 'address', 'updated_at', 'created_at'];
}
