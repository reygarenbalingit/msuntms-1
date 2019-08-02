<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Training;
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
    }

    protected function createTraining(array $data){
    	return Training::create([
    		'title_of_training' => $data['title_of_training'],
            'location' => $data['location'],
            'date_from' => $data['date_from'],
			'date_to' => $data['date_to'],
			'user_id' => auth()->user()->id,
    	]);
    }

    public function update(Request $request, $id){
    	$training = Training::findOrFail($id);
        $v = Validator::make($request->all(), [
            //'title_of_training' => 'required|unique:training,'.$id.'',
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
}
