<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Courses;
use Validator, Input, Redirect;
use Illuminate\Validation\Rule;
use Exception;

class CoursesController extends Controller
{
    public function index(){
    	$c = Courses::orderBy('id', 'DESC')->get();
        return response()->json([
            'success' => true,
            'data' => $c,
            'message' => 'Courses extracted successfully'
        ],200);
    }

    public function show($id){
    	if(!empty(Courses::find($id))){
    		$c = Courses::find($id);
            return response()->json([
                'success' => true,
                'data' => $c,
                'message' => 'Course extracted successfully'
            ],200);
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
            'course_text' => ['required',
            Rule::unique('courses')->ignore($id),
            ]
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
        try{
            if(!empty(Courses::find($id))){
                Courses::findOrFail($id)->delete();
                return response()->json([
                    'success' => true,
                    'message' => 'Course has been deleted successfully.'
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
                'message' => 'Cannot delete record. This occurs because other users are using this record.'
            ],422);
        }
    }
}
