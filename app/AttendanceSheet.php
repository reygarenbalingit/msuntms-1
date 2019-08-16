<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AttendanceSheet extends Model
{
    public $primaryKey = 'id';
	protected $table = "attendance_sheet";
	protected $fillable = ['id','attendance_title','date_from', 'date_to', 'training_id', 'updated_at', 'created_at'];
}
