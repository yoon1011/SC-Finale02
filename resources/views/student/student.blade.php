@extends('adminlte::layouts.app2')



@section('main-content')

<div class="box">
	<div class="box-header">
		<h2>Subjects</h2>
	</div>
	<div class="box-body">
		<table id="example" class="table table-striped table-bordered" style="width:100%">
			<thead>
			    <tr>
			        <th>Subject</th>
			        <th>Term</th>
        			<th>School year</th>
			        <th>Status</th>
			        <th>Remark</th>
			    </tr>
			</thead>
			<tbody>
				@foreach($subjects as $sub)
				<tr>
					<td>{{DB::table('subjects')->where('id', $sub->sub_id)->first()->subject}} - {{DB::table('subjects')->where('id', $sub->sub_id)->first()->code}}</td>
					<td>@if(DB::table('sections')->where('id', $sub->sec_id)->first()->sem == '1') 1st @elseif(DB::table('sections')->where('id', $sub->sec_id)->first()->sem == '2') 2nd @elseif(DB::table('sections')->where('id', $sub->sec_id)->first()->sem == '3') 3rd @endif</td>
					<td>{{DB::table('sections')->where('id', $sub->sec_id)->first()->sy}}</td>
					<td><label style="color: @if($sub->stat == 'ok') green @elseif($sub->stat == 'not ok') yellow @elseif($sub->stat == 'drop') red @endif;font-weight: bold;">{{$sub->stat}}</label></td>
					<td>{{$sub->remark}}</td>
				</tr>
				@endforeach
			</tbody>
			<tfoot>
			    <tr>
			      	<th>Subject</th>
			        <th>Term</th>
        			<th>School year</th>
			        <th>Status</th>
			        <th>Remark</th>
				</tr>
			</tfoot>
		</table>
	</div>
</div>

@endsection

@section('all-ref')
<link rel="stylesheet" type="text/css" href="{{asset('css/jquery.dataTables.css')}}">
<!-- Select2 -->
<link rel="stylesheet" href="{{asset('/css/select2.min.css')}}">  
<script type="text/javascript" charset="utf8" src="{{asset('js/jquery.dataTables.js')}}"></script>
<script>
$(document).ready(function() {
    $('#example').DataTable();
});

</script>	
@endsection