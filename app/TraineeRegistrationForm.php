<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TraineeRegistrationForm extends Model
{
    protected $table = "trainee";
	protected $fillable = ['id','trainee_fname', 'trainee_mname', 'trainee_lname', 'trainee_bdate', 'trainee_home_add', 'trainee_sex', 'trainee_contact_no', 'required_no_of_hrs', 'purpose_of_stay', 'date_submitted', 'courses_id', 'schools_id', 'emergency_contact_id', 'updated_at', 'created_at'];
}
