<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TraineeEvalAns_M extends Model
{
    public $timestamps = true;
    public $primaryKey = "id";
    protected $table = "trainee_evaluation_answer";
    protected $fillable = ['id', 'eval_ans', 'created_at', 'updated_at', 'training_questions_id', 'training_trainees_id'];
}
