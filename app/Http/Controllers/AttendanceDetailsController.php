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

    public function delete(Request $request, $id){
        try{
            if(!empty(AttendanceDetails::find($id))){
                AttendanceDetails::findOrFail($id)->delete();
                return response()->json([
                    'success' => true,
                    'message' => 'A trainee attendance has been deleted successfully.'
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

    public function attendance_list($id){
        try{
            $list = DB::select('
                select trainee_mname, trainee_lname,trainee_fname, title_of_training, trainer, location,
                training.date_from as training_date_from, training.date_to as 
                training_date_to,attendance_sheet.date_from as training_attendance_date_from
                , attendance_sheet.date_to as training_attendance_date_to,attendance_details.date as 
                attend_logged_date
                from trainee, attendance_details, training, attendance_sheet
                where attendance_details.trainee_Id = trainee.id AND
                attendance_details.attend_id = attendance_sheet.id AND
                attendance_sheet.pte_id = training.id AND
                attendance_sheet.id = '.$id.'
                order by trainee_lname;
            ');
            return response()->json([
                'success' => true,
                'data' => $list,
                'message' => 'Attendance list extracted successfully.'
            ], 200);
        }catch(Exception $e){
            return response()->json([
                'success' => $e,
                'message' => 'There was an error in your request. Please try again later.'
            ],422);
        }
    }
}
