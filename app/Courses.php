<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

class Courses extends Model
{
	use HasApiTokens;
	protected $table = "courses";
	protected $fillable = ['id','course_text', 'updated_at', 'created_at'];
}
