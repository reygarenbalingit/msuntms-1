<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Courses;
use App\School;
use App\EmergencyContacts;
use App\TraineeRegistrationForm;
use Validator, Input, Redirect;

class AddTraineeController extends Controller
{
    public function addTrainee(Request $request){
    	$v = Validator::make($request->all(), [
    		'trainee_fname' => 'required|unique_with:trainee_registration_form, trainee_mname, trainee_lname',
    		'trainee_mname' => 'required',
    		'trainee_lname' => 'required',
    		// 'school_name' => 'unique:schools',
    		// 'courses_text' => 'unique:courses',
    		// 'fname' => 'required|unique_with:emergency_contact, mname, lname',
    	]);

    	if($v->fails()){
    	 	return response()->json([
                'success' => false,
                'message' => $v->errors(),
            ], 422);
    	}else{
    		$newTrainee = TraineeRegistrationForm::create($request->all());
	    	return response()->json([
	                'success' => true,
	                'data' => $newTrainee,
	                'message' => 'Trainee information has been saved sucessfully!'
	        ], 200);
    	}
    	
    }
}
