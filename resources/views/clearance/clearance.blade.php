@extends('adminlte::layouts.app2')



@section('main-content')

<div class="row">
	<div class="col-md-4">
		<div class="box">
			<div class="box-header">
				<h2>Subjects</h2>
			</div>
			<div class="box-body">
				<input class="form-control" style="margin: 5px;" id="myInput" type="text" placeholder="Search..">
				<div class="tab myDIV">
					@if(count($subjects) > 0)
					@foreach($subjects as $sub)
					<button class="tablinks" onclick="openCity(event, '{{$sub->id}}')" id="defaultOpen">{{DB::table('subjects')->where('id', $sub->sub_id)->first()->subject}}</button>
			  		@endforeach
			  		@else
			  		<p>no subject assigned yet.</p>
			  		@endif
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-8">
		@foreach($subjects as $sub)
		<div id="{{$sub->id}}" class="tabcontent">
			<div class="box">
				<div class="box-header">
					<h2>Subject: {{DB::table('subjects')->where('id', $sub->sub_id)->first()->subject}} - @if ($sub->sem == '1') 1st @elseif ($sub->sem == '2') 2nd @elseif ($sub->sem == '3') 3rd @endif Term/{{$sub->sy}}</h2>
				</div>
				<div class="box-body">
					<table id="example{{$sub->id}}" class="table table-striped table-bordered" style="width:100%">
						<thead>
						    <tr>
						        <th>Name</th>
						        <th>Status</th>
		            			<th>Remark</th>
						        <th>...</th>
						    </tr>
						</thead>
						<tbody>
							@foreach($students->where('sub_id', $sub->sub_id) as $stud)
						    <tr>
						        <td>{{DB::table('users')->where('id', $stud->stud_id)->first()->name}}</td>
						        <td>{{$stud->stat}}</td>
					            <td>{{$stud->remark}}</td>
						        <td>
						        	<a href="#" data-toggle="modal" data-target="#edit{{$stud->id}}">Custom</a>
						        </td>
						    </tr>
						    @endforeach
						</tbody>
						<tfoot>
						    <tr>
						      	<th>Name</th>
						        <th>Status</th>
		            			<th>Remark</th>
						        <th>...</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		@endforeach

	</div>
</div>
@foreach($subjects as $sub)

	@foreach($students->where('sub_id', $sub->sub_id) as $stud)
	<div class="modal fade" id="edit{{$stud->id}}">
	  <div class="modal-dialog">
	    <form method="post" action="{{action('HomeController@editclearancestat', $stud->id)}}">
	      {{csrf_field()}}
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span></button>
	          <h4 class="modal-title">{{DB::table('users')->where('id', $stud->id)->first()->name}}</h4>
	        </div>
	        <div class="modal-body">
	        	<div class="form-group">
		      		<label>Status: </label>
		      		<p>
		      		@if ($stud->stat == 'ok')
				  	<label style="font-size: 26px;padding: 15px;"><input type="radio" id="f1" name="stat" value="ok" checked> Ok</label>
				  	<label style="font-size: 26px;padding: 15px;"><input type="radio" id="f1" name="stat" value="not ok"> not Ok</label>
				  	<label style="font-size: 26px;padding: 15px;"><input type="radio" id="f1" name="stat" value="drop"> Drop</label>
				  	@elseif ($stud->stat == 'not ok')
				  	<label style="font-size: 26px;padding: 15px;"><input type="radio" id="f1" name="stat" value="ok"> Ok</label>
				  	<label style="font-size: 26px;padding: 15px;"><input type="radio" id="f1" name="stat" value="not ok" checked> not Ok</label>
				  	<label style="font-size: 26px;padding: 15px;"><input type="radio" id="f1" name="stat" value="drop"> Drop</label>
				  	@elseif ($stud->stat == 'drop')
				  	<label style="font-size: 26px;padding: 15px;"><input type="radio" id="f1" name="stat" value="ok"> Ok</label>
				  	<label style="font-size: 26px;padding: 15px;"><input type="radio" id="f1" name="stat" value="not ok"> not Ok</label>
				  	<label style="font-size: 26px;padding: 15px;"><input type="radio" id="f1" name="stat" value="drop" checked> Drop</label>
				  	@endif
				  	</p>
	        	</div>
	          <div class="form-group">
	                <label>Remark</label>
	                <textarea class="form-control" name="remark" placeholder="none"></textarea>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-sm btn-default pull-left" data-dismiss="modal">Close</button>
	          <button type="submit" class="btn btn-sm btn-primary">Save changes</button>
	        </div>
	      </div>  
	    </form>
	  </div>
	</div>
	@endforeach

@endforeach
@endsection

@section('all-ref')

<style type="text/css">
	.tab button {
		display: block;
		  background-color: inherit;
		  color: black;
		  padding: 2px 8px;
		  width: 100%;
		  border: none;
		  outline: none;
		  text-align: left;
		  cursor: pointer;
		  transition: 0.3s;
		  font-size: 17px;
	}
	.tab button.active {
	  background-color: #ccc;
	}
</style>
<link rel="stylesheet" type="text/css" href="{{asset('css/jquery.dataTables.css')}}">
<!-- Select2 -->
<link rel="stylesheet" href="{{asset('/css/select2.min.css')}}">  
<script type="text/javascript" charset="utf8" src="{{asset('js/jquery.dataTables.js')}}"></script>
<!-- Select2 -->
<script src="{{asset('/js/select2.full.min.js')}}"></script>
<script>
$(document).ready(function() {
	@foreach($subjects as $sub)
    $('#example{{$sub->id}}').DataTable();
  @endforeach
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myDIV *").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
function openCity(evt, tabid) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabid).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
$(function () {
	$('.select2').select2()
})
</script>	
@endsection