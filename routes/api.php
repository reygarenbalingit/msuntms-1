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
	//sample edits
//});

Route::get('school', 'SchoolController@index');
Route::get('school/{id}', 'SchoolController@show');
Route::post('school', 'SchoolController@store');
Route::post('school/{id}', 'SchoolController@update');
Route::delete('school/{id}', 'SchoolController@delete');


Route::get('course', 'CoursesController@index');
Route::get('course/{id}', 'CoursesController@show');
Route::post('course', 'CoursesController@store');
Route::post('course/{id}', 'CoursesController@update');
Route::delete('course/{id}', 'CoursesController@delete');

Route::get('ec', 'EmergencyContactsController@index');
Route::get('ec/{id}', 'EmergencyContactsController@show');
Route::post('ec', 'EmergencyContactsController@store');
Route::post('ec/{id}', 'EmergencyContactsController@update');
Route::delete('ec/{id}', 'EmergencyContactsController@delete');

Route::post('trainee', 'TraineeController@store');
Route::get('trainee', 'TraineeController@index');
Route::get('trainee/{id}', 'TraineeController@getTraineeDataById');
Route::post('trainee/{id}', 'TraineeController@update');
Route::delete('trainee/{id}', 'TraineeController@delete');
Route::get('trainee_all', 'TraineeController@getTraineeData');

Route::post('attendance', 'AttendanceSheetController@store');
Route::get('attendance','AttendanceSheetController@index');
Route::get('attendance/{id}','AttendanceSheetController@show');
Route::delete('attendance/{id}','AttendanceSheetController@delete');
Route::post('attendance/{id}','AttendanceSheetController@update');
Route::get('attendance_event/{id}','AttendanceSheetController@getEventByTraining');

Route::post('attend_add','AttendanceDetailsController@store');
Route::post('attend_batch','AttendanceDetailsController@batchStore');

Route::delete('attend_del/{id}','AttendanceDetailsController@delete');
Route::get('attend_list/{id}','AttendanceDetailsController@attendance_list');
Route::get('unattend_list/{id}','AttendanceDetailsController@notAttendedTrainee');

Route::post('training_trainees','TrainingTraineesController@store');
Route::post('training_trainees/{id}','TrainingTraineesController@update');
Route::post('training_trainees_del','TrainingTraineesController@delete');
Route::get('trainee_training_list/{id}','TrainingTraineesController@getTraineesByTraining');
Route::get('trainee_not_set_trainings/{id}','TrainingTraineesController@getNotSetTraineesToTrainings');

Route::group(['middleware' => 'jwt.auth'], function(){
	Route::post('trainings', 'TrainingController@store');
	Route::get('trainings', 'TrainingController@index');
	Route::get('trainings/{id}', 'TrainingController@show');
	Route::post('trainings/{id}','TrainingController@update');
	Route::delete('trainings/{id}', 'TrainingController@delete');
});


