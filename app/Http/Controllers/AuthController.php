<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Validator, Input, Redirect;
use App\User;

class AuthController extends Controller
{
    public function signup(Request $request)
    {
        $v = Validator::make($request->all(), [   
            'username' => 'required|string|unique:users', 
        ]);

        $user = new User([
            'email' => $request->email,
            'username' => $request->username,
            'password' => $request->password,
            'account_type' => $request->account_type,
            'firstname' => $request->firstname,
            'middlename' => $request->middlename,
            'lastname' => $request->lastname,
        ]);

        if($v->fails()){
    		return response()->json(['error' => 'Username already exist! Plese try another one.']);
    	}else{
    		//return Courses::create($request->all());
    		$user->save();
	        return response()->json([
	            'message' => 'User successfully created!'
	        ], 201);
    	}	

        
    }

    public function login(Request $request)
    {
        $user = User::where('username',$request->username)->first();
        if($user){
        	if($request->password == $user->password){
        		$tokenResult = $user->createToken('Personal Access Token')->accessToken;
        		$response = ['token' => $tokenResult];
        		return response($response, 200);
        	}else{
        		$response = 'Username and password are incorrect';
        		return response($response, 422);
        	}
        }else{
        	$response = 'User not found';
        	return response($response, 422);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json([
            'message' => 'Successfully logged out'
        ]);
    }

    public function user(Request $request)
    {
        return response()->json(User::all());
    }
}
