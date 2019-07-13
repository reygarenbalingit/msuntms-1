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
    			'message' => 'Record not found'
    		], 404);
    	}
    }
    //stock 
    public function store(Request $request){
    	$v = Validator::make($request->all(), [
    		'fname' => 'required|unique_with:emergency_contact, mname, lname',
    	]);

    	if($v->fails()){
    	 	return response()->json([
                'success' => false,
                'message' => 'Emergency contact person already exist!'
            ], 422);
    	}else{
    		$newec = EmergencyContacts::create($request->all());
            return response()->json([
                'success' => true,
                'data' => $newec,
                'message' => 'Emergency contact person has been added successfully.'
            ], 200);
    	}
    }

    public function update(Request $request, $id){
    	$ec = EmergencyContacts::findOrFail($id);
        $v = Validator::make($request->all(), [
            'fname' => 'required|unique_with:emergency_contact, mname, lname',
        ]);
        if($v->fails()){
            return response()->json([
                'success' => false,
                'message' => 'Emergency contact person already exist! Cannot update current record.'
            ], 422);
        }else{
            $ec->update($request->all());
            return response()->json([
                'success' => true,
                'data' => $ec,
                'message' => 'Emergency contact person has been updated successfully.'
            ], 200);
        }
    }

    public function delete(Request $request, $id){
        if(!empty(EmergencyContacts::find($id))){
            EmergencyContacts::findOrFail($id)->delete();
            return response()->json([
                'success' => true,
                'message' => 'Emergency contact has been deleted.'
            ], 200);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Record does not exist. Cannot delete.'
            ], 404);
        }
    }
}
