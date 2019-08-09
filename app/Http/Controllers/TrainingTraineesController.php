<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\TrainingTrainees;
use Illuminate\Validation\Rule;
use Validator, Input, Redirect;
use Tymon\JWTAuth\JWTAuth;
use DB;
use Exception;

class TrainingTraineesController extends Controller
{
    public function store(Request $request){
    	$v = Validator::make($request->all(), [
    		'trainee_id' => 'required|unique_with:training_trainees,training_id',
    	]);

    	if($v->fails()){
    		return response()->json([
                'success' => false,
                'message' => 'Trainee has been already set with a training. Cannot duplicate record.',
            ],422);
    	}else{
    		$tt = TrainingTrainees::create($request->all());
            return response()->json([
                'success' => true,
                'data' => $tt,
                'message' => 'Trainee set to training successfully.'
            ], 200);
    	}	
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

    public function delete(Request $request, $id){
        try{
            if(!empty(TrainingTrainees::find($id))){
                TrainingTrainees::findOrFail($id)->delete();
                return response()->json([
                    'success' => true,
                    'message' => 'Trainee training(s) has been deleted successfully.'
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
        try{
            $list = DB::select('
                select trainee.id as id, concat(trainee_lname, ' ',trainee_fname) as name
                from trainee, training_trainees
                where not exists
                        (
                        select  null
                        from    training_trainees
                        where   training_trainees.trainee_id = trainee.id
                        ) and
                training_trainees.training_id = '.$id.'
                GROUP BY trainee.id, trainee_lname, trainee_fname, trainee_mname;
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
