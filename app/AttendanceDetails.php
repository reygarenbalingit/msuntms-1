<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AttendanceDetails extends Model
{
    public $primaryKey = 'id';
	protected $table = "attendance_details";
	protected $fillable = ['id','date', 'trainee_Id', 'attend_id', 'updated_at', 'created_at'];
}
