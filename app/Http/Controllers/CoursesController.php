<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Courses;
use Validator, Input, Redirect;

class CoursesController extends Controller
{
    public function index(){
    	return Courses::all();
    }

    public function show($id){
    	if(!empty(Courses::find($id))){
    		return Courses::find($id);
    	}else{
    		return response()->json([
                'success' => false,
    			'message' => 'Record not found'
    		], 404);
    	}
    }

    public function store(Request $request){
    	//no header types in postman
    	$v = Validator::make($request->all(), [
    		'course_text' => 'required|unique:courses',
    	]);

    	if($v->fails()){
    		return response()->json([
                'success' => false,
                'message' => ['courseError' => 'Course already exist!']
            ],422);
    	}else{
    		$courses = Courses::create($request->all());
            return response()->json([
                'success' => true,
                'data' => $courses,
                'message' => 'Course created sucessfully.'
            ], 200);
    	}	
    }

    public function update(Request $request, $id){
    	$courses = Courses::findOrFail($id);
        $v = Validator::make($request->all(), [
            'course_text' => 'required|unique:courses',
        ]);

        if($v->fails()){
            return response()->json([
                'success' => false, 
                'message' => ['courseError' => 'Course already exist! Cannot update current record.']
            ],422);
        }else{
            $courses->update($request->all());
            return response()->json([
                'success' => true,
                'data' => $courses,
                'message' => 'Course updated sucessfully'
            ], 200);
        }

    }

    public function delete(Request $request, $id){
        if(!empty(Courses::find($id))){
            Courses::findOrFail($id)->delete();
            return response()->json([
                'success' => true,
                'message' => 'School has been deleted.'
            ], 200);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Record does not exist. Cannot delete.'
            ], 404);
        }
    }
}
