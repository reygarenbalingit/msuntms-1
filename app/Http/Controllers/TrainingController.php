<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Training;
use App\EvaluationQuestions;
use Illuminate\Validation\Rule;
use Validator, Input, Redirect;
use Tymon\JWTAuth\JWTAuth;

class TrainingController extends Controller
{
    public function index(){
    	//$trainings_all = Training::all();
        $trainings_all = Training::orderBy('id', 'DESC')->get();
        return response()->json([
            'success' => true,
            'data' => $trainings_all,
            'message' => 'Trainings has been sucessfully extracted.'
        ],200);
    	//return auth()->user()->id;
    }

    public function show($id){
    	if(!empty(Training::find($id))){
    		$trainings_show = Training::find($id);
            return response()->json([
                'success' => true,
                'data' => $trainings_show,
                'message' => 'Training data extracted successfully.'
            ],200);
    	}else{
    		return response()->json([
                'success' => false,
    			'message' => 'Record not found'
    		], 404);
    	}
    }

    public function store(Request $request){
    	//no header types in postman
    	$v = Validator::make($request->all(), [
    		'title_of_training' => 'required|unique:training',
    	]);

    	if($v->fails()){
    		return response()->json([
                'success' => false,
                'message' => 'Training already exist!',
            ],422);
    	}else{
    		$training = $this->createTraining($request->all());
            return response()->json([
                'success' => true,
                'data' => $training,
                'message' => 'Training created sucessfully.'
            ], 200);
    	}

        //insert questions here
    }

    protected function storeQuestions($id){
        EvaluationQuestions::create([
            'question_text' => '1. Ang mga gihisgutan nga mga hilisgutan adunay kalabutan kanako. (The topics covered were relevant to me.)',
            'participant_training-evaluation_id' => $id,
        ]);
        EvaluationQuestions::create([
            'question_text' => '2. Kini nga training experience mapuslan sa akong trabaho. (This training experience will be useful in my work.)',
            'participant_training-evaluation_id' => $id,
        ]);
        EvaluationQuestions::create([
            'question_text' => '3. Ang trainer adunay kahibalo mahitungod sa mga hilisgutan sa training. (The trainer was knowledgeable about the training topics.)',
            'participant_training-evaluation_id' => $id,
        ]);
        EvaluationQuestions::create([
            'question_text' => '4. Ang trainer adunay kahibalo mahitungod sa mga hilisgutan sa training. (The trainer was knowledgeable about the training topics.)',
            'participant_training-evaluation_id' => $id,
        ]);
        EvaluationQuestions::create([
            'question_text' => '5. Ang mga tumong sa training kay natuman. (The training objectives were met.)',
            'participant_training-evaluation_id' => $id,
        ]);
        EvaluationQuestions::create([
            'question_text' => '6. Ang mga panahon nga gigahin alang sa training kay igo na. (The time alloted for the training was sufficient.)',
            'participant_training-evaluation_id' => $id,
        ]);
        EvaluationQuestions::create([
            'question_text' => '7. Ang meeting room ug mga pasilidad igo ug komportable. (The meeting room and facilities were adequate and comfortable.)',
            'participant_training-evaluation_id' => $id,
        ]);
        EvaluationQuestions::create([
            'question_text' => '8. Ang mga estilo ug pama-agi sa mga lecturer sa pagtudlo kay maayo ba. (The teaching styles and directions of the lecturers are good.)',
            'participant_training-evaluation_id' => $id,
        ]);
        EvaluationQuestions::create([
            'question_text' => '9. Nalingaw ka ba sa training nga gihatag kanimo (Did you enjoy the training that was given to you.)',
            'participant_training-evaluation_id' => $id,
        ]);
        EvaluationQuestions::create([
            'question_text' => '10. Natuman ba ang imong expectation. (Did your expectation was fulfilled.)',
            'participant_training-evaluation_id' => $id,
        ]);
    }

    protected function createTraining(array $data){
    	return Training::create([
    		'title_of_training' => $data['title_of_training'],
            'location' => $data['location'],
            'trainer' => $data['trainer'],
            'date_from' => $data['date_from'],
			'date_to' => $data['date_to'],
			'user_id' => auth()->user()->id,
    	]);
    }

    public function update(Request $request, $id){
    	$training = Training::findOrFail($id);
        $v = Validator::make($request->all(), [
            'title_of_training' => ['required',
            Rule::unique('training')->ignore($id),
            ]
        ]);

        if($v->fails()){
            return response()->json([
                'success' => false, 
                'message' => 'Training already exist! Cannot update current record.',
            ],422);
        }else{
            $training->update($request->all());
            return response()->json([
                'success' => true,
                'data' => $training,
                'message' => 'Training updated sucessfully'
            ], 200);
        }

    }

    public function delete(Request $request, $id){
        if(!empty(Training::find($id))){
            Training::findOrFail($id)->delete();
            return response()->json([
                'success' => true,
                'message' => 'Training has been deleted.'
            ], 200);
        }else{
            return response()->json([
                'success' => false,
                'message' => 'Record does not exist. Cannot delete.'
            ], 404);
        }
    }

    public function getListOfTrainees($id){
        $list = DB::select('
            select trainee_lname, trainee_fname, trainee_mname
            from trainee, training, training_trainees
            where training_trainees.trainee_id = trainee.id AND
            training_trainees.training_id = training.id AND
            training.id = '.$id.';
        ');
        return response()->json([
            'success' => true,
            'data' => $list,
            'message' => 'Trainees for the training extracted sucessfully.'
        ],200);
    }
}
