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
    	
        try{
            $attend_pass = $request->attend_id;
            $training_trainees_id = $request->trainee_id;

            $ttid = DB::selectOne('
                select training_trainees.id as ttid_sub
                from training_trainees, trainee
                where training_trainees.trainee_id = trainee.id AND
                trainee.id = '.$training_trainees_id.' AND
                training_id = (select training_id as asid from attendance_sheet WHERE id = '.$attend_pass.');
                ');
            $tocheck = $ttid->ttid_sub;
            $v = Validator::make($request->all() + ['check' => $tocheck], [
            'attendance_sheet_id' => 'unique_with:attendance_details,check = training_trainees_id',
            ]);

            if($v->fails()){
                return response()->json([
                    'success' => false,
                    'message' => 'You already singed the attendance.'
                ],422);
            }else{
                AttendanceDetails::create([
                    'attendance_sheet_id' => $attend_pass,
                    'training_trainees_id' => $tocheck
                ]);

                $ret = DB::select('select trainee.id as tid, trainee_lname,trainee_fname,trainee_mname,attendance_details.date as attend_logged_date
                from trainee, training_trainees, attendance_details, training, attendance_sheet
                where
                   attendance_details.attendance_sheet_id = attendance_sheet.id AND
                   attendance_details.training_trainees_id = training_trainees.id AND
                   attendance_sheet.training_id = training.id AND
                   training_trainees.training_id = training.id AND
                   training_trainees.trainee_id = trainee.id AND
                   attendance_sheet.id = '.$attend_pass.' AND
                   trainee.id = '.$training_trainees_id.'
                   order by trainee_lname;
                   ');
                return response()->json([
                    'success' => true,
                    'data' => $ret,
                    'message' => 'Attendance added sucessfully.'
                ], 200);
            }
        }catch(Exception $e){
            return response()->json([
                'success' => false,
                'message' => 'You are not allowed to sign this attendance.'
            ], 422);
        }   
    }

    public function batchStore(Request $request){
        $attend_pass = $request->attend_id;
        $training_trainees_id = $request->trainee_id;

        foreach($training_trainees_id as $trainee_id) {
            $ttid = DB::selectOne('
            select training_trainees.id as ttid_sub
            from training_trainees, trainee
            where training_trainees.trainee_id = trainee.id AND
            trainee.id = '. $trainee_id .' AND
            training_id = (SELECT training_id as asid FROM attendance_sheet WHERE id = '.$attend_pass.');
            ');

            AttendanceDetails::create([
                'attend_id' => $attend_pass,
                'training_trainees_id' => $ttid->ttid_sub
            ]);
        }
        return response()->json([
            'success' => true,
            'data' => $request->all(),
            'message' => 'Batch attendance added successfully.'
        ], 200);
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

    //list sa naka attendance na
    public function attendance_list($id){
        //params = id of attendance sheet/event
        try{
            $list = DB::select('
                select trainee.id as tid, trainee_lname,trainee_fname,trainee_mname,  title_of_training, trainer, location,
                training.date_from as training_date_from, training.date_to as training_date_to,attendance_sheet.date_from as training_attendance_date_from
                , attendance_sheet.date_to as training_attendance_date_to,attendance_details.date as
                attend_logged_date
                from trainee, training_trainees, attendance_details, training, attendance_sheet
                where
                attendance_details.attendance_sheet_id = attendance_sheet.id AND
                attendance_details.training_trainees_id = training_trainees.id AND
                attendance_sheet.training_id = training.id AND
                training_trainees.training_id = training.id AND
                training_trainees.trainee_id = trainee.id AND
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

    //working pero tanan ang iya i return
    // public function notAttendedTrainee($id){
    //     //params attendance_sheet id
    //     //params training_id
    //     try{
    //         $list_unattended = DB::select('
    //             select t1.id as tid, t1.trainee_lname,t1.trainee_fname, t1.trainee_mname
    //             from trainee as t1
    //             where t1.trainee_lname NOT IN
    //             (select t2.trainee_lname
    //             from trainee as t2, training_trainees, attendance_details, training, attendance_sheet
    //             where attendance_details.attend_id = attendance_sheet.id AND
    //                 attendance_details.training_trainees_id = training_trainees.id AND
    //                 attendance_sheet.pte_id = training.id AND
    //                 training_trainees.training_id = training.id AND
    //                 training_trainees.trainee_id = t2.id AND
    //                 attendance_sheet.id = '.$id.')
    //             ORDER BY trainee_lname;
    //             ');
    //         return response()->json([
    //             'success' => true,
    //             'data' => $list_unattended,
    //             'message' => 'Unattended trainee list extracted successfully.'
    //         ], 200);
    //     }catch(Exception $e){
    //         return response()->json([
    //             'success' => $e,
    //             'message' => 'There was an error in your request. Please try again later.'
    //         ],422);
    //     }
    // }

    public function notAttendedTrainee($sid){
        //params attendance_sheet id
        try{
            $list_unattended = DB::select('
                select t1.id as tid, t1.trainee_fname, t1.trainee_mname, t1.trainee_lname
                from trainee as t1, training_trainees
                where training_trainees.trainee_id = t1.id AND
                training_trainees.training_id = (select training_id from attendance_sheet where id = '.$sid.') AND
                t1.trainee_lname NOT IN
                        (select t2.trainee_lname
                        from trainee as t2, training_trainees, attendance_details, training, attendance_sheet
                        where
                        attendance_details.attendance_sheet_id = attendance_sheet.id AND
                        attendance_details.training_trainees_id = training_trainees.id AND
                        attendance_sheet.training_id = training.id AND
                        training_trainees.training_id = training.id AND
                        training_trainees.trainee_id = t2.id AND
                        attendance_sheet.id = '.$sid.'
                )
                ORDER BY t1.trainee_lname;
                ');
            return response()->json([
                'success' => true,
                'data' => $list_unattended,
                'message' => 'Unattended trainee list extracted successfully.'
            ], 200);
        }catch(Exception $e){
            return response()->json([
                'success' => $e,
                'message' => 'There was an error in your request. Please try again later.'
            ],422);
        }
    }
}
