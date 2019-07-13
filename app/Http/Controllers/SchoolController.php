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
    			'message' => 'Record not found'
    		], 404);
    	}
    }

    public function store(Request $request){
    	//no header types in postman
    	$v = Validator::make($request->all(), [
    		'school_name' => 'required|unique:schools',
    	]);

    	if($v->fails()){
    		return response()->json([
                'success' => false,
                'message' => 'School already exist!'
            ], 422);
    	}else{
    		$newschool = School::create($request->all());
            return response()->json([
                'success' => true, 
                'data' => $newschool,
                'message' => 'School has been added successfully'
            ], 200);
    	}	
    }

    public function update(Request $request, $id){
    	//test in postman using parameters URL
    	$school = School::findOrFail($id);
        $v = Validator::make($request->all(), [
            'school_name' => 'required|unique:schools',
        ]);

        if($v->fails()){
            return response()->json([
                'success' => false,
                'message' => 'School already exist! Cannot update current record.'
            ], 422);
        }else{
            $school->update($request->all());
            return response()->json([
                'success' => true,
                'data' => $school,
                'message' => 'School has been updated successfully!'
            ], 200);
        }
    	
    }

    public function delete(Request $request, $id){
        if(!empty(School::find($id))){
            School::findOrFail($id)->delete();
            return response()->json([
                'success' => true,
                'message' => 'School has been deleted successfully.'
            ], 200);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Record does not exist. Cannot delete.'
            ], 404);
        }
    }
}
                