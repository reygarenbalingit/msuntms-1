<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\EvalQuestions_M as EQ;
use Illuminate\Validation\Rule;
use Validator, Input, Redirect;
use Tymon\JWTAuth\JWTAuth;
use DB;
use Exception;

class EvalQuestions_C extends Controller
{
    public function index()
    {
        return EQ::all();
    }
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
    		$q = EQ::create($request->all());
            return response()->json([
                'success' => true,
                'data' => $q,
                'message' => 'Question created sucessfully.'
            ], 200);
    	}	
    }
    public function update(Request $request, $id)
    {
        $eq = EQ::findOrFail($id);
        $v = Validator::make($request->all(), [
            'question_text' => ['required', Rule::unique('evaluation_question')->ignore($id)],
        ]);
        if($v->fails()){
            return response()->json([
                'success' => false,
                'message' => 'Question already exist.'
            ], 422);
        }else{
            $eq->update($request->all());
            return response()->json([
                'success' => true,
                'data' => $eq,
                'message' => 'Question has been updated successfully.'
            ], 200);
        }
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return EQ::where('id', $id)->first();
    }
     /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        try{
            $q = EQ::findOrFail($id);

            if(!empty($q)){
                $q->delete();
                return response()->json([
                    'success' => true,
                    'message' => 'Question has been deleted successfully.'
                ], 200);
            }
            else{
                return response()->json([
                    'success' => false,
                    'message' => 'Record does not exist. Cannot delete.'
                ], 404);
            }
        }
        catch(Exception $e){
            return response()->json([
                'success' => false,
                'message' => 'Cannot delete record. This occurs because other users are using this record.'
            ],422);
        }
    }
}
