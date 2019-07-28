<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Courses;
use App\School;
use App\EmergencyContacts;
use App\TraineeRegistrationForm;
use Validator, Input, Redirect;
use DB;
use Exception;

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
			course_idcourse,
			school_idschool
			emergency_contact
			if true{insert}else{use ids}
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
    		$courseID = 0;
    		$schoolID = 0;
    		$ecID = 0;

    		if($request->c_flag){
    			$courseID = $request->course_idcourse;
    		}else{
    			$courses = new Courses;
    			$courses->course_text = $request->c_course_text;
    			$courses->save();
    			$courseID = $courses->id;
    		}

    		if($request->s_flag){
    			$schoolID = $request->school_idschool;
    		}else{	
    			$schools = new School;
    			$schools->school_name = $request->s_school_name;
    			$schools->save();
    			$schoolID = $schools->id;
    		}

    		if($request->ec_flag){
    			$ecID = $request->emergency_contact;
    		}else{
    			$ec = new EmergencyContacts;
    			$ec->fname = $request->ec_fname;
    			$ec->mname = $request->ec_mname;
    			$ec->lname = $request->ec_lname;
    			$ec->contact_number = $request->ec_contact_number;
    			$ec->address = $request->ec_address;
    			$ec->save();
    			$ecID = $ec->id;
    		}

    		$trainee = $this->create($request->all(), $courseID, $schoolID, $ecID);
            $trainee->course_text = DB::table('Courses')->where('id', '=', $courseID)->select('course_text')->get();
            $trainee->school_name = DB::table('Schools')->where('id', '=', $schoolID)->select('school_name')->get();
            $trainee->e_c = DB::table('emergency_contact')->where('id','=', $ecID)->select('fname as FirstName','mname as MiddleName','lname as LastName')->get();

    		return response()->json([
    			'success' => true,
    			'data' => $trainee,
    			'message' => 'Trainee data has been saved successfully!',

    		], 200);
    	}
    }

    public function update(Request $request, $id){
    	$trainee = TraineeRegistrationForm::findOrFail($id)->first();
        $v = Validator::make($request->all(), [
    		'trainee_fname' => 'unique_with:trainee_registration_form, trainee_mname, trainee_lname',
    	]);

        if($v->fails()){
            return response()->json([
                'success' => false, 
                'message' => $v->errors(),
            ],422);
        }else{
            

            if($request->c_flag){
                $trainee->course_idcourse = $request->course_idcourse;
            }else{
                $courses = Courses::create([
                    'course_text' => $request->c_course_text,
                ]);
                // $courses->course_text = $request->c_course_text;
                // $courses->save();
                $trainee->course_idcourse = $courses->id;
            }

            // if($request->s_flag){
            //     $schoolID = $request->school_idschool;
            // }else{  
            //     $schools = new School;
            //     $schools->school_name = $request->s_school_name;
            //     $schools->save();
            //     $schoolID = $schools->id;
            // }

            // if($request->ec_flag){
            //     $ecID = $request->emergency_contact;
            // }else{
            //     $ec = new EmergencyContacts;
            //     $ec->fname = $request->ec_fname;
            //     $ec->mname = $request->ec_mname;
            //     $ec->lname = $request->ec_lname;
            //     $ec->contact_number = $request->ec_contact_number;
            //     $ec->address = $request->ec_address;
            //     $ec->save();
            //     $ecID = $ec->id;
            // }

            // $trainee->trainee_fname = $request->trainee_fname;
            // $trainee->trainee_mname = $request->trainee_mname;
            // $trainee->trainee_lname = $request->trainee_lname;
            // $trainee->trainee_bdate = $request->trainee_bdate;
            // $trainee->trainee_home_add = $request->trainee_home_add;
            // $trainee->trainee_sex = $request->trainee_sex;
            // $trainee->trainee_contact_no = $request->trainee_contact_no;
            // $trainee->required_no_of_hrs = $request->required_no_of_hrs;
            // $trainee->purpose_of_stay = $request->purpose_of_stay;
            // $trainee->course_idcourse = $courseID;
            // $trainee->school_idschool = $schoolID;
            // $trainee->emergency_contact = $ecID;
            // $trainee->save();
            
            // return response()->json([
            //     'success' => true,
            //     'data' => $trainee,
            //     'message' => 'Trainee data has been updated successfully!',
            // ], 200);
            return response()->json([
                'flag' => $request->c_flag,
                'id' => $trainee->course_idcourse,
                'text' => $request->c_course_text,
            ],200);
        }

    }

    public function delete(Request $request, $id){
        try{
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
        }catch(Exception $e){
            return response()->json([
                'success' => false,
                'message' => 'There was an error with your request.'
            ],422);
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
			'required_no_of_hrs' => $data['required_no_of_hrs'],
			'purpose_of_stay' => $data['purpose_of_stay'],
			'course_idcourse' => $courseID,
			'school_idschool' => $schoolID,
			'emergency_contact' => $ecID,
        ]);
    }

    protected function update_trainee(array $data, $courseID, $schoolID, $ecID){
        $trainee->trainee_fname = $data['trainee_fname'];
        $trainee->trainee_mname = $data['trainee_mname'];
        $trainee->trainee_lname = $data['trainee_lname'];
        $trainee->trainee_bdate = $data['trainee_bdate'];
        $trainee->trainee_home_add = $data['trainee_home_add'];
        $trainee->trainee_sex = $data['trainee_sex'];
        $trainee->trainee_contact_no = $data['trainee_contact_no'];
        $trainee->required_no_of_hrs = $data['required_no_of_hrs'];
        $trainee->purpose_of_stay = $data['purpose_of_stay'];
        $trainee->course_idcourse = $courseID;
        $trainee->school_idschool = $schoolID;
        $trainee->emergency_contact = $ecID;
        $trainee->update();
    }

    public function getTraineeData(){
    	try{
            $trainee = DB::table('trainee_registration_form')
            ->join('schools', 'trainee_registration_form.school_idschool', '=', 'schools.id')
            ->join('courses', 'trainee_registration_form.course_idcourse', '=', 'courses.id')
            ->join('emergency_contact', 'trainee_registration_form.emergency_contact', '=', 'emergency_contact.id')
            ->select('trainee_registration_form.id as TraineeID','courses.id as CourseID','schools.id as SchoolID','emergency_contact.id as EID','trainee_fname','trainee_mname','trainee_lname','trainee_bdate','trainee_home_add','trainee_sex','trainee_contact_no','required_no_of_hrs','purpose_of_stay','date_submitted','courses.course_text','schools.school_name','emergency_contact.fname as ECFName','emergency_contact.mname as ECMName','emergency_contact.lname as ECLName','emergency_contact.contact_number as ECContactNumber','emergency_contact.address as ECAddress')
            ->orderBy('trainee_registration_form.id','DESC')
            ->get();
            return response()->json([
                'success' => true,
                'data' => $trainee,
                'message' => 'Data extracted successfully.'
            ], 200);
        }catch(Exception $e){
            return response()->json([
                'success' => false,
                'message' => 'Cannot delete record. This occurs because other users are using this record.'
            ],422);
        }
    }
}
