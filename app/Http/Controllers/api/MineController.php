<?php

namespace App\Http\Controllers\api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Tymon\JWTAuth\JWTAuth;

class MineController extends Controller
{
    protected $auth;

    public function __construct(JWTAuth $auth){
    	$this->auth = $auth;
    }

    public function index(Request $request){
    	return response()->json([
    		'success' => true,
    		'data' => $request->user()
    	]);
    }

    public function logout(){
    	$this->auth->invalidate();
    	return response()->json([
    		'success' => true,
    		'message' => 'Logged out successfully'
    	]);
    }
}
