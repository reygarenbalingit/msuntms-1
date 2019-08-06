<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EvaluationQuestions extends Model
{
    public $primaryKey = 'id';
	protected $table = "evaluation_question";
	protected $fillable = ['id','question_text', 'participant_training-evaluation_id','updated_at', 'created_at'];
}
