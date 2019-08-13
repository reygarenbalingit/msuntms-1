<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\EvaluationQuestions;
use Illuminate\Validation\Rule;
use Validator, Input, Redirect;
use Tymon\JWTAuth\JWTAuth;
use DB;
use Exception;

class EvaluationQuestionsController extends Controller
{
    public function store(Request $request){
    	$v = Validator::make($request->all(), [
    		'question_text' => 'required|unique:evaluation_question',
    	]);

    	if($v->fails()){
    		return response()->json([
                'success' => false,
                'message' => 'Question already exist.'
            ],422);
    	}else{
    		$q = EvaluationQuestions::create($request->all());
            return response()->json([
                'success' => true,
                'data' => $q,
                'message' => 'Question created sucessfully.'
            ], 200);
    	}	
    }
}
