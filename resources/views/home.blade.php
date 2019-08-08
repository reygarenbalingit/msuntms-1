<<<<<<< HEAD
<!-- @extends('layouts.app') -->
=======
@extends('layouts.app')
>>>>>>> 498a9e1149f605ef75ed857f7c0a57d544b2587b

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
<<<<<<< HEAD
                    {{ $name }}
=======
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    You are logged in!
>>>>>>> 498a9e1149f605ef75ed857f7c0a57d544b2587b
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
