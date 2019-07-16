<?php

use Illuminate\Http\Request;
use App\School;
use App\Courses;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

// //login routes
// Route::post('/login', 'LoginController@login')->name('login');
// Route::post('login', 'AuthController@login');
// Route::post('register', 'AuthController@signup');


//logout private
// Route::middleware('auth:api')->group(function (){
// 	Route::get('logout','AuthController@logout');
// 	Route::get('user', 'AuthController@user');
// });

Route::group(['prefix' => '/auth', ['middleware' => 'throttle:20,5']], function(){
	Route::post('/register', 'api\Auth\RegisterController@register');
	Route::post('/login', 'api\Auth\LoginController@login');
});

Route::group(['middleware' => 'jwt.auth'], function(){
	Route::get('/user_me', 'api\MineController@index');
	Route::get('/auth/user_logout', 'api\MineController@logout');
});


//Route::group(['middleware' => 'jwt.auth'], function(){
	//ROUTES THAT NEED AUTHENTICATION HERE
//});

Route::get('school', 'SchoolController@index');
Route::get('school/{id}', 'SchoolController@show');
Route::post('school', 'SchoolController@store');
Route::put('school/{id}', 'SchoolController@update');
Route::delete('school/{id}', 'SchoolController@delete');


Route::get('course', 'CoursesController@index');
Route::get('course/{id}', 'CoursesController@show');
Route::post('course', 'CoursesController@store');
Route::put('course/{id}', 'CoursesController@update');
Route::delete('course/{id}', 'CoursesController@delete');

Route::get('ec', 'EmergencyContactsController@index');
Route::get('ec/{id}', 'EmergencyContactsController@show');
Route::post('ec', 'EmergencyContactsController@store');
Route::put('ec/{id}', 'EmergencyContactsController@update');
Route::delete('ec/{id}', 'EmergencyContactsController@delete');

Route::post('addtrainee', 'AddTraineeController@addTrainee');