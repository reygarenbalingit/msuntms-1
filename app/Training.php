<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Training extends Model
{
    protected $table = "training";
	public $primarykey = 'id';
	protected $fillable = ['id','title_of_training','location', 'trainer','date_from','date_to','created_at','updated_at','users_id'];
}
