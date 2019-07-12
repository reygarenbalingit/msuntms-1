<?php

namespace App\Http\Controllers\api\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Tymon\JWTAuth\JWTAuth;


class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '';
    protected $auth;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(JWTAuth $auth)
    {
        //$this->middleware('guest')->except('logout');
        $this->auth = $auth;
    }

    /**
     * Handle a login request to the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response|\Illuminate\Http\JsonResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function login(Request $request)
    {
        

        // If the class is using the ThrottlesLogins trait, we can automatically throttle
        // the login attempts for this application. We'll key this by the username and
        // the IP address of the client making these requests into this application.
        if (method_exists($this, 'hasTooManyLoginAttempts') &&
            $this->hasTooManyLoginAttempts($request)) {
            $this->fireLockoutEvent($request);

            return response()->json([
                'success' => false,
                'errors' => [
                    'Ambot sala kay sigeg login'
                ]
            ]);
        }
        $this->incrementLoginAttempts($request);
        try{
            if(!$token = $this->auth->attempt($request->only('username','password'))){
                return response()->json([
                    'success' => false,
                    'errors' => [
                        'username' => [
                            'Invalid username or password'
                        ]
                    ]
                ], 422);
            }
        }catch(JWTException $e){
            return response()->json([
                'success' => false,
                'errors' => [
                    'username' => [
                        'Invalid username or password'
                    ]
                ]
            ], 422);
        }

        // If the login attempt was unsuccessful we will increment the number of attempts
        // to login and redirect the user back to the login form. Of course, when this
        // user surpasses their maximum number of attempts they will get locked out.
        

        //return $this->sendFailedLoginResponse($request);
        return response()->json([
            'success' => true,
            'data' => $request->user(),
            'token' => $token
        ], 200);
    }
}
