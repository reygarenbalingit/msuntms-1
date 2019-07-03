<?php

use Illuminate\Http\Request;
use App\School;
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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('school', 'SchoolController@index');
Route::get('school/{id}', 'SchoolController@show');
Route::post('school', 'SchoolController@store');
Route::put('school/{id}', 'SchoolController@update');
Route::delete('school/{id}', 'SchoolController@delete');