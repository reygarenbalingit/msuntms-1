<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Courses;
use App\School;
use App\EmergencyContacts;
use App\TraineeRegistrationForm;
use Validator, Input, Redirect;

class TraineeController extends Controller
{
    public function index(){
    	return TraineeRegistrationForm::all();
    }

    public function show($id){
    	if(!empty(TraineeRegistrationForm::find($id))){
    		return TraineeRegistrationForm::find($id);
    	}else{
    		return response()->json([
                'success' => false,
    			'message' => 'Record not found'
    		], 404);
    	}
    }

    public function store(Request $request){
    	/**
			vars:
			trainee_fname,
			trainee_mname,
			trainee_lname,
			trainee_bdate,
			trainee_home_add,
			trainee_sex,
			trainee_contact_no,
			trainee_no_of_hrs,
			purpose_of_stay,
			c_flag,
			c_course_text,
			s_flag,
			s_school_name,
			ec_flag,
			ec_fname,
			ec_mname,
			ec_lname,
			ec_contact_number,
			ec_address,
	 		

			if false{insert}else{use ids}
    	*/

    	$v = Validator::make($request->all(), [
    		'trainee_fname' => 'required|unique_with:trainee_registration_form, trainee_mname, trainee_lname',
    		'trainee_mname' => 'required',
    		'trainee_lname' => 'required',
    	]);

    	if($v->fails()){
    	 	return response()->json([
                'success' => false,
                'message' => $v->errors(),
            ], 422);
    	}else{
    		$courseID;
    		$schoolID;
    		$ecID;

    		if($request->c_flag == false){
    			$courses = new Courses;
    			$courses->course_text = $request->c_course_text;
    			$courses->save();
    			$courseID = $courses->id;
    		}else{
    			$courseID = $request->course_idcourse;
    		}

    		if($request->s_flag == false){
    			$schools = new School;
    			$schools->school_name = $request->s_school_name;
    			$schools->save();
    			$schoolID = $schools->id;
    		}else{
    			$schoolID = $request->school_idschool;
    		}

    		if($request->ec_flag == false){
    			$ec = new EmergencyContacts;
    			$ec->fname = $request->ec_fname;
    			$ec->mname = $request->ec_mname;
    			$ec->lname = $request->ec_lname;
    			$ec->contact_number = $request->ec_contact_number;
    			$ec->address = $request->ec_address;
    			$ec->save();
    			$ecID = $ec->id;
    		}else{
    			$ecID = $request->emergency_contact;
    		}

    		$trainee = $this->create($request->all(), $courseID, $schoolID, $ecID);
    		return response()->json([
    			'success' => true,
    			'data' => $trainee,
    			'message' => 'Trainee data has been saved successfully!',
    		], 200);
    	}
    }

    public function update(Request $request, $id){
    	$trainee = TraineeRegistrationForm::findOrFail($id);
        $v = Validator::make($request->all(), [
    		'trainee_fname' => 'unique_with:trainee_registration_form, trainee_mname, trainee_lname',
    	]);

        if($v->fails()){
            return response()->json([
                'success' => false, 
                'message' => $v->errors(),
            ],422);
        }else{
            $trainee->update($request->all());
            return response()->json([
                'success' => true,
                'data' => $trainee,
                'message' => 'Trainee data updated sucessfully'
            ], 200);
        }

    }

    public function delete(Request $request, $id){
        if(!empty(TraineeRegistrationForm::find($id))){
            TraineeRegistrationForm::findOrFail($id)->delete();
            return response()->json([
                'success' => true,
                'message' => 'Trainee has been deleted.'
            ], 200);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Record does not exist. Cannot delete.'
            ], 404);
        }
    }

    protected function create(array $data, $courseID, $schoolID, $ecID){
        return TraineeRegistrationForm::create([
            'trainee_fname' => $data['trainee_fname'],
            'trainee_mname' => $data['trainee_mname'],
            'trainee_lname' => $data['trainee_lname'],
			'trainee_bdate' => $data['trainee_bdate'],
			'trainee_home_add' => $data['trainee_home_add'],
			'trainee_sex' => $data['trainee_sex'],
			'trainee_contact_no' => $data['trainee_contact_no'],
			'trainee_no_of_hrs' => $data['trainee_no_of_hrs'],
			'purpose_of_stay' => $data['purpose_of_stay'],
			'course_idcourse' => $courseID,
			'school_idschool' => $schoolID,
			'emergency_contact' => $ecID,
        ]);
    }
}
