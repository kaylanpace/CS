<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,buiding.Building"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>  

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ConstructionPal - Add Building</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
   
    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="bower_components/datatables/media/css/jquery.dataTables.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!--  Date Picker -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/jquery-ui.min.css" rel="stylesheet">
 
    <body>    

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add Building</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->       
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Building information
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" method="POST" action="building">
                                        <!--  
                                        <div class="form-group">
                                            <label>Building ID</label>
                                            <input class="form-control" type="number" name="Id" placeholder="Format: 12345">
                                        </div>
                                        -->
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input class="form-control" type="text" name="buildingName" placeholder="Building name">
                                        </div>
                                        <div class="form-group">
                                            <label>Point of Contact</label>
                                            <input class="form-control" type="text" name="POC" placeholder="Point of contact">
                                        </div>
                                        <div class="form-group">
                                            <label for="dp">Check Cycle</label>
                                            <input class="form-control" type="date" id="dp" name="checkCycle" placeholder="Format: MM/DD/YYYY ">
                                        </div> 
                                        
                                        <script src="js/jquery.min.js"></script>
    									<script src="js/jquery-ui.min.js"></script>
    									<script src="js/bootstrap.min.js"></script>
   										<script>
     									 $( "#dp" ).datepicker({
										//changeMonth: true,
										//changeYear: true
										 });
    									</script>

                                        
                                        <div class="form-group">
                                            <label>Street</label>
                                            <input class="form-control" type="text" name="street" placeholder="Street address">
                                        </div>
                                        <div class="form-group">
                                            <label>City</label>
                                            <input class="form-control" type="text" name="city" placeholder="City">
                                        </div>
                                        <div class="form-group">
                                            <label>State</label>
                                            <input class="form-control" type="text" name="state" placeholder="State">
                                        </div>
                                        <div class="form-group">
                                            <label>ZIP Code</label>
                                            <input class="form-control" type="number" name="zip" placeholder="Format: 12345">
                                        </div>
                                        <button type="submit" value="Add" class="btn btn-default">Submit</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                    <!-- <input type="submit" value="Add" /> -->
                                    </form>
                                </div>
                                
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <table id="buildingGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
			    <thead>
			        <tr>
			            <th>Building Name</th>
			            <th>Check Cycle</th>
			            <th>Point of Contact</th>
			            <th>Street</th>
			            <th>City</th>
			            <th>State</th>
			            <th>Zip</th>
			        </tr>
			    </thead>
			    <tfoot>
			        <tr>
			            <th>Building Name</th>
			            <th>Check Cycle</th>
			            <th>Point of Contact</th>
			            <th>Street</th>
			            <th>City</th>
			            <th>State</th>
			            <th>Zip</th>
			        </tr>
			    </tfoot>
			        <%
				      @SuppressWarnings("unchecked")
				      List<Building> buildings = (List<Building>)request.getAttribute("buildings");
				       if (buildings != null) {
				        for (Building building : buildings) {
				      %>
			          <tr>
			          	<td>
			          		<%= building.getBuildingName() %>
			          	</td>
			          	<td>
			          		<%= building.getCheckCycle() %>
			          	</td>
			          	
			          	<td>
			          		<%= building.getStreet() %>
			          	</td>
			          	<td>
			          		<%= building.getCity() %>
			          	</td>
			          	<td>
			          		<%= building.getState() %>
			          	</td>
			          	<td>
			          		<%= building.getZip() %>
			          	</td>
			          </tr>
			          <%
				       }
				      %>
				      <%
				       }
				      %>
			</table>

        <hr>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>       
        
    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

    <!-- Dynamic Table JavaScript -->
    <script>
    $(document).ready(function() {
        $('#buildingGrid').dataTable();
    } );
    </script>
        
    </body>
 </html>