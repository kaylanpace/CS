<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,equipment.Equipment"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ConstructionPal - Add Equipment</title>

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
                <h1 class="page-header">Add Equipment</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->        
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Equipment information
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">

                                    <form role="form" method="POST" action="equipment">
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input class="form-control" type="text" name="equipName" placeholder="Equipment name">
                                        </div>
                                        <div class="form-group">
                                            <label>Type</label>
                                            <input class="form-control" type="text" name="equipType" placeholder="Equipment type">
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <input class="form-control" type="text" name="description" placeholder="Equipment description">
                                        </div>
                                        <div class="form-group">
                                            <label>Vendor Point of Contact</label>
                                            <input class="form-control" type="text" name="vendorPOC" placeholder="Point of contact">
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
            

            <table id="equipmentGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Vendor POC</th>
                        <th>Check Cycle</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Description</th>
                        <th>Vendor POC</th>
                        <th>Check Cycle</th>
                    </tr>
                </tfoot>
                    <%
                          @SuppressWarnings("unchecked")
                          List<Equipment> equipments = (List<Equipment>)request.getAttribute("equipments");
                           if (equipments != null) {
                            for (Equipment equipment : equipments) {
                          %>
                      <tr>
                            <td>
                                    <%= equipment.getEquipName() %>
                            </td>
                            <td>
                                    <%= equipment.getEquipType() %>
                            </td>
                            <td>
                                    <%= equipment.getDescription() %>
                            </td>
                           
                            <td>
                                    <%= equipment.getCheckCycle() %>
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
        $('#equipmentGrid').dataTable();
    } );
    </script>
        
    </body>
 </html>
