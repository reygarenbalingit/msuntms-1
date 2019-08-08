<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class School extends Model
{
	protected $table = "schools";
	public $primaryKey = 'id';
	protected $fillable = ['id','school_name', 'updated_at', 'created_at'];
}
