<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AttendanceSheet;
use Illuminate\Validation\Rule;
use Validator, Input, Redirect;
use Tymon\JWTAuth\JWTAuth;
use DB;
use Exception;

class AttendanceSheetController extends Controller
{
    public function index(){
    	$as = AttendanceSheet::orderBy('id', 'DESC')->get();
        return response()->json([
            'success' => true,
            'data' => $as,
            'message' => 'Attendance sheet(s) extracted successfully'
        ],200);
    }

    public function store(Request $request){
    	
    	$v = Validator::make($request->all(), [
    		'date_from' => 'required|unique_with:attendance_sheet,date_to, pte_id',
    	]);

    	if($v->fails()){
    		return response()->json([
                'success' => false,
                'message' => 'Attendace range already exist!',
            ],422);
    	}else{
    		$attendace = AttendanceSheet::create($request->all());
            return response()->json([
                'success' => true,
                'data' => $attendace,
                'message' => 'Attendance created sucessfully.'
            ], 200);
    	}	
    }

    public function show($id){
    	if(!empty(AttendanceSheet::find($id))){
    		$as = AttendanceSheet::find($id);
            return response()->json([
                'success' => true,
                'data' => $as,
                'message' => 'Attendance sheet extracted successfully'
            ],200);
    	}else{
    		return response()->json([
                'success' => false,
    			'message' => 'Record not found'
    		], 404);
    	}
    }

    public function update(Request $request, $id){
    	$as = AttendanceSheet::findOrFail($id);
        $v = Validator::make($request->all(), [
            'date_from' => 'required|unique_with:attendance_sheet, date_to,'. $id,
        ]);

        if($v->fails()){
            return response()->json([
                'success' => false, 
                'message' => 'Attendance range already exist.'
            ],422);
        }else{
            $as->update($request->all());
            return response()->json([
                'success' => true,
                'data' => $as,
                'message' => 'Attendance sheet updated sucessfully'
            ], 200);
        }
    }

    public function delete(Request $request, $id){
        try{
            if(!empty(AttendanceSheet::find($id))){
                AttendanceSheet::findOrFail($id)->delete();
                return response()->json([
                    'success' => true,
                    'message' => 'Attendance sheet has been deleted successfully.'
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

    public function getEventByTraining(Request $request, $id){
        try{
            $list = DB::select('
            select attendance_sheet.id as id, attendance_sheet.attendance_title as title,attendance_sheet.date_from as start,
            attendance_sheet.date_to as end
            from attendance_sheet, training
            where attendance_sheet.training_id = training.id AND
            training.id = '.$id.';
            ');
            return response()->json([
                'success' => true,
                'data' => $list,
                'message' => 'Event list extracted successfully.'
            ],200);
        }catch(Exception $e){
            return response()->json([
                'success' => $e,
                'message' => 'There was an error in your request. Please try again later.'
            ],422);
        }
    }


}
