<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\TrainingTrainees;
use App\AttendanceDetails;
use Illuminate\Validation\Rule;
use Validator, Input, Redirect;
use Tymon\JWTAuth\JWTAuth;
use DB;
use Exception;

class TrainingTraineesController extends Controller
{
    public function store(Request $request){
    	// $v = Validator::make($request->all(), [
    	// 	'trainee_id.*' => 'required|unique_with:training_trainees,training_id',
    	// ]);

    	// if($v->fails()){
    	// 	return response()->json([
     //            'success' => false,
     //            'message' => 'Trainee has been already set with a training. Cannot duplicate record.',
     //        ],422);
    	// }else{
    		
    	// }
        $trainee_ids = $request->trainee_id;
        $training_id = $request->training_id;
        
        foreach($trainee_ids as $trainee_id) {
            $list = TrainingTrainees::create([
                'trainee_id' => $trainee_id,
                'training_id' => $training_id
            ]);
        }
        return response()->json([
            'success' => true,
            'data' => $request->all(),
            'message' => 'Trainee set to training successfully.'
        ], 200);	
        
    }

    public function update(Request $request, $id){
    	$training_trainees = TrainingTrainees::findOrFail($id);
        $v = Validator::make($request->all(), [
            'trainee_id' => 'required|unique_with:training_trainees,training_id,'. $id,
        ]);

        if($v->fails()){
            return response()->json([
                'success' => false, 
                'message' => 'Trainee has been set to training already. Cannot update record.'
            ],422);
        }else{
            $training_trainees->update($request->all());
            return response()->json([
                'success' => true,
                'data' => $training_trainees,
                'message' => 'Trainee updated to training sucessfully'
            ], 200);
        }
    }

    public function delete(Request $request){
        $trainee_id = $request->trainee_id;
        $training_id = $request->training_id;

        $count = DB::select('select id from attendance_details
        where training_trainees_id = (select training_trainees.id as ttid from training_trainees
        where trainee_id = '.$trainee_id.' AND
        training_id = '.$training_id.');');

        if(count($count) === 0){
            $delid = DB::selectOne('select training_trainees.id as ttid from training_trainees
            where trainee_id = '.$trainee_id.' AND
            training_id = '.$training_id.'');
            TrainingTrainees::findOrFail($delid->ttid)->delete();
            return response()->json([
                'success' => true,
                'message' => '[1]Trainee has been removed from training successfully.'
            ], 200);
        }else{
            $delidaa = DB::selectOne('select training_trainees.id as ttid from training_trainees
            where trainee_id = '.$trainee_id.' AND
            training_id = '.$training_id.'');

            DB::delete('delete from attendance_details where training_trainees_id = '.$delidaa->ttid.'');
            TrainingTrainees::findOrFail($delidaa->ttid)->delete();
            return response()->json([
                'success' => true,
                'message' => '[2]Trainee has been removed from training successfully.'
            ], 200);
        }
    }

    public function getTraineesByTraining($id){
    	try{
    		$list = DB::select('
    		select trainee.id as tid, trainee_fname, trainee_mname, trainee_lname
			from trainee, training, training_trainees
			where training_trainees.training_id = training.id AND
			training_trainees.trainee_id = trainee.id AND
			training_trainees.training_id = '.$id.';
    		');
    		return response()->json([
    			'success' => true, 
    			'data' => $list,
    			'message' => 'Trainees extracted successfully.'
    		],200);
    	}catch(Exception $e){
    		return response()->json([
    			'success' => false,
    			'message' => 'There was an error with your request. Please try again later.'
    		],422);
    	}

    }

    public function getNotSetTraineesToTrainings($id){
        //param training id
        try{
            $list = DB::select('
                select t1.id as tid, trainee_fname, trainee_mname, trainee_lname
                from trainee as t1
                where t1.id NOT IN
                (select training_trainees.trainee_id from training_trainees
                where training_trainees.training_id = '.$id.')
                order by trainee_lname;
            ');
            return response()->json([
                'success' => true, 
                'data' => $list,
                'message' => 'Trainees not set to training extracted successfully.'
            ],200);
        }catch(Exception $e){
            return response()->json([
                'success' => false,
                'message' => $e
            ],422);
        }
    }

    
}
