<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TraineeRegistrationForm extends Model
{
    protected $table = "trainee_registration_form";
	protected $fillable = ['id','trainee_fname', 'trainee_mname', 'trainee_lname', 'trainee_bdate', 'trainee_home_add', 'trainee_sex', 'trainee_contact_no', 'required_no_of_hrs', 'purpose_of_stay', 'date_submitted', 'course_idcourse', 'school_idschool', 'emergency_contact', 'updated_at', 'created_at'];

	public function School(){
		return $this->belongsTo('App\School');
	}

	public function Courses(){
		return $this->belongsTo('App\Courses');
	}
}
