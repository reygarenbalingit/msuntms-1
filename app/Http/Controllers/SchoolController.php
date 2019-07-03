<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\School;
use Validator, Input, Redirect;

class SchoolController extends Controller
{
    public function index(){
    	return School::all();
    }

    public function show($id){
    	if(!empty(School::find($id))){
    		return School::find($id);
    	}else{
    		return response()->json([
    			'error' => 'Record not found'
    		], 404);
    	}
    }

    public function store(Request $request){
    	//no header types in postman
    	$v = Validator::make($request->all(), [
    		'school_name' => 'required|unique:schools',
    	]);

    	if($v->fails()){
    		return response()->json(['error' => 'School already exist!']);
    	}else{
    		return School::create($request->all());
    	}	
    }

    public function update(Request $request, $id){
    	//test in postman using parameters URL
    	$school = School::findOrFail($id);
    	$school->update($request->all());
    	return $school;
    }

    public function delete(Request $request, $id){
    	$school = School::findOrFail($id);
    	$school->delete();
    	return response()->json(['success' => 'School has been deleted.']);
    }
}
