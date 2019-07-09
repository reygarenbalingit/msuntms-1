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
    			'error' => 'Record not found'
    		], 404);
    	}
    }

    public function store(Request $request){
    	//no header types in postman
    	$v = Validator::make($request->all(), [
    		'course_text' => 'required|unique:courses',
    	]);

    	if($v->fails()){
    		return response()->json(['error' => 'Course already exist!']);
    	}else{
    		return Courses::create($request->all());
    	}	
    }

    public function update(Request $request, $id){
    	//test in postman using parameters URL
    	$courses = Courses::findOrFail($id);
    	$courses->update($request->all());
    	return $courses;
    }

    public function delete(Request $request, $id){
    	$courses = Courses::findOrFail($id);
    	$courses->delete();
    	return response()->json(['success' => 'School has been deleted.']);
    }
}
