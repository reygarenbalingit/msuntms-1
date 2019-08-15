<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\TraineeEvalAns_M as TEA;
use Input, Redirect;
use DB;

class TraineeEvalAns_C extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return TEA::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $training_id = $request->training_id;
        $evaluation_question_id = $request->evaluation_question_id;
        $trainee_id = $request->trainee_id;
        $eval_ans = $request->eval_ans;

        $tq_id;
        $temp = "";

        $tq_v = Validator::make($request->all(), [
            'evaluation_question_id' => 'required|unique_with:training_questions, training_id',
        ]);

        if($tq_v->fails()){
            $tq_id = DB::select('select training_questions.id from training_questions where evaluation_question_id = '.$evaluation_question_id.'
            and training_id = '.$training_id.'');
        }
        else{
            $tq_data = array(
                'evaluation_question_id' => $evaluation_question_id,
                'training_id' => $training_id
            );
            $tq_id = DB::table('training_questions')->insertGetID($tq_data);
        }

        $tt_id = DB::select('select training_trainees.id from training_trainees where trainee_id = '.$trainee_id.'
        and training_id = '.$training_id.'');

        $teadata = array(
            'eval_ans' => $eval_ans,
            'training_questions_id' => $tq_id,
            'training_trainees_id' => $tt_id
        );
        
        $training = DB::table('trainee_evaluation_answer')->insert($teadata);
        dd($training);
        // $t = new TEA;
        // $t->eval_ans = $eval_ans;
        // $t->training_questions_id = $tq_id;
        // $t->training_trainees_id = $tt_id;
        // $t->save();   

        return response()->json([
            'success' => true,
            'data' => $t,
            'message' => 'Trainee evaluation answer has been added successfully.'
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return TEA::findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
            $answer = TEA::findOrFail($id);

            if(!empty($answer)){
                $answer->delete();
                return response()->json([
                    'success' => true,
                    'message' => 'Trainee answer has been deleted successfully.'
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
