### A Training Management System for MSUN Research and Extension

### Prerequisites:

1. XAMPP must be installed. Get it here (https://www.apachefriends.org/)
    
2. A composer must be installed. Get it here (https://getcomposer.org/)

(Optional installation)

3. NodeJS (https://nodejs.org/en/download/)

4. Postman (https://www.getpostman.com/)

### Instructions:

1. Clone this repository to your local machine after installing the needed softwares above.
2. Go to the path where the application has beed saved and run the command
    
        composer install
    
    This command will install all the needed dependencies of the Laravel application to be used.
3. Make sure to create the database and named "msuntms".

4. Run the command below to generate the application key. 

        php artisan key:generate 

5. Run the command below to generate the JWT keys for authentication.

        php artisan jwt:secret

6. Edit the .env file of the application and supply all the needed information on these fields:

        APP_NAME=Laravel
        APP_ENV=local
        APP_DEBUG=true
        APP_URL=http://127.0.0.1:8000/msuntms

        DB_CONNECTION=mysql
        DB_HOST=127.0.0.1
        DB_PORT=3306
        DB_DATABASE=msuntms
        DB_USERNAME=root
        DB_PASSWORD=

### Launching the application:

By navigating to the source file via CLI, you can use the 

    php artisan serve 
    
or
    
    php artisan serve --host <IP address> --port <port_number>
    
### Database Schema Model
See ERD here (https://prnt.sc/opwvds)

### API Routes

    Route::group(['prefix' => '/auth', ['middleware' => 'throttle:20,5']], function(){
    Route::post('/register', 'api\Auth\RegisterController@register');
    Route::post('/login', 'api\Auth\LoginController@login');
    });

    Route::group(['middleware' => 'jwt.auth'], function(){
        Route::get('/user_me', 'api\MineController@index');
        Route::get('/auth/user_logout', 'api\MineController@logout');
    });

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

    Route::post('trainee', 'TraineeController@store');
    Route::get('trainee', 'TraineeController@index');
    Route::get('trainee/{id}', 'TraineeController@show');
    Route::put('trainee/{id}', 'TraineeController@update');
    Route::delete('trainee/{id}', 'TraineeController@delete');
    Route::get('trainee_all', 'TraineeController@getTraineeData');

    Route::post('attendance', 'AttendanceSheetController@store');
    Route::get('attendance','AttendanceSheetController@index');
    Route::get('attendance/{id}','AttendanceSheetController@show');
    Route::delete('attendance/{id}','AttendanceSheetController@delete');
    Route::post('attendance/{id}','AttendanceSheetController@update');

    Route::post('attend_add','AttendanceDetailsController@store');
    Route::delete('attend_del/{id}','AttendanceDetailsController@delete');
    Route::get('attend_list/{id}','AttendanceDetailsController@attendance_list');

    Route::group(['middleware' => 'jwt.auth'], function(){
        Route::post('trainings', 'TrainingController@store');
        Route::get('trainings', 'TrainingController@index');
        Route::get('trainings/{id}', 'TrainingController@show');
        Route::put('trainings/{id}','TrainingController@update');
        Route::delete('trainings/{id}', 'TrainingController@delete');
    });




