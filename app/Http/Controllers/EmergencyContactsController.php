<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\EmergencyContacts;
use Validator, Input, Redirect;
use DB;

class EmergencyContactsController extends Controller
{
    public function index(){
    	return EmergencyContacts::all();
    }

    public function show($id){
    	if(!empty(EmergencyContacts::find($id))){
    		return EmergencyContacts::find($id);
    	}else{
    		return response()->json([
    			'error' => 'Record not found'
    		], 404);
    	}
    }
    //stock 
    public function store(Request $request){
    	//no header types in postman
    	$v = Validator::make($request->all(), [
    		'fname' => 'required|unique_with:emergency_contact, mname, lname',
    		// 'mname' => 'required|unique:emergency_contact',
    		// 'lname' => 'required|unique:emergency_contact',
    	]);

    	if($v->fails()){
    	 	return response()->json(['error' => 'Emergency contact person already exist!']);
    	}else{
    		return EmergencyContacts::firstOrCreate($request->all());
    	}
    	// $fullName = $request->input('fname') .' '. $request->input('lname');
    	// $sample = DB::table('emergency_contact')->select('id')
    	// 					->where('id','=','1')
    	// 					->get();
    	// 					->where(DB::raw('concat('fname'," ",'lname')'),'=',$fullName);
    	// $sample = DB::table('emergency_contact')->get();
    	// return response->json($sample);
    }

    public function update(Request $request, $id){
    	//test in postman using parameters URL
    	$ec = EmergencyContacts::findOrFail($id);
    	$ec->update($request->all());
    	return $ec;
    }

    public function delete(Request $request, $id){
    	$ec = EmergencyContacts::findOrFail($id);
    	$ec->delete();
    	return response()->json(['success' => 'Emergency contact person has been deleted.']);
    }
}
