<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TrainingTrainees extends Model
{
    protected $table = "training_trainees";
	public $primarykey = 'id';
	protected $fillable = ['id','comment_text','trainee_id', 'training_id','created_at','updated_at'];
}
