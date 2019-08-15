<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EvalQuestions_M extends Model
{
    public $primaryKey = 'id';
	protected $table = "evaluation_question";
	protected $fillable = ['id','question_number', 'question_text','updated_at', 'created_at'];
}
