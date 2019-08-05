<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AttendanceDetails;
use Illuminate\Validation\Rule;
use Validator, Input, Redirect;
use Tymon\JWTAuth\JWTAuth;
use DB;
use Exception;

class AttendanceDetailsController extends Controller
{
    public function store(Request $request){
    	
    	$v = Validator::make($request->all(), [
    		'attend_id' => 'required|unique_with:attendance_details,trainee_Id',
    	]);

    	if($v->fails()){
    		return response()->json([
                'success' => false,
                'message' => 'You already signed the attendance for this event.',
            ],422);
    	}else{
    		$attendace = AttendanceDetails::create($request->all());
            return response()->json([
                'success' => true,
                'data' => $attendace,
                'message' => 'Attendance added sucessfully.'
            ], 200);
    	}	
    }
}
