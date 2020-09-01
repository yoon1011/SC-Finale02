@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
	<div class="container-fluid spark-screen">
		<div class="row">
			<div class="col-md-1">
				<img src="{{asset('/img/uc.png')}}" class="" style="width: 100%;">
			</div>
			<div class="col-md-11">
				<h1>College of Hospitality and Tourism Management <small>(CHTM)</small> Department</h1>
			</div>
		</div>
	</div>
@endsection
