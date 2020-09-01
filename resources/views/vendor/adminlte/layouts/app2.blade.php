<!DOCTYPE html>
<html>
@section('htmlheader')
    @include('adminlte::layouts.partials.htmlheader')
@show
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

    @include('adminlte::layouts.partials2.mainheader')
  <!-- Full Width Column -->
  <div class="content-wrapper">
    <div class="container">

        @include('adminlte::layouts.partials2.contentheader')

      <!-- Main content -->
      <section class="content">
        @yield('main-content')
        
      </section>
      <!-- /.content -->
    </div>
    <!-- /.container -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="container">
      <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.0
      </div>
      <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights
      reserved.
    </div>
    <!-- /.container -->
  </footer>
</div>
<!-- ./wrapper -->

@section('scripts')
    @include('adminlte::layouts.partials.scripts')
@show
@yield('all-ref')
</body>
</html>