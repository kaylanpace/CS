<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,supplies.Supplies"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>
   
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ConstructionPal - Add Supplies</title>

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
<a href="/Construction/admin-viewWorkOrders" > Back to Dashboard</a>
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add Supplies</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->     
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Supply information
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" method="POST" action="supplies" style="width: 630px; ">
                                        <div class="form-group">
                                            <label>Supply Name</label>
                                            <input class="form-control" type="text" name="supplyName" placeholder="Supply name">
                                        </div>
                                        <div class="form-group">
                                            <label>Quantity</label>
                                            <input class="form-control" type="text" name="quantity" placeholder="Format: 30">
                                        </div>
                                       
                                        <div class="form-group">
                                            <label>Description</label>
                                            <TextArea class="form-control" type="text" name="description" placeholder="Description"></TextArea>
                                        </div>
                                        <div class="form-group">
                                            <label for = "dp">Expiration Date</label>
                                            <input class="form-control" type="date" id = "dp" name="expirationDate" placeholder="Format: MM-dd-yyyy">
                                        </div>
                                      
                                        <div class="form-group">
                                            <label for = "dp2">Check Cycle</label>
                                            <input class="form-control" type="date" id = "dp2" name="checkCycle" placeholder="Format: MM-dd-yyyy">
                                        </div>
                                        <div class="form-group">
                                            <label>Vendor Name</label>
                                            <input class="form-control" type="text" name="pocName" placeholder="Vendor Name">
                                        </div>
                                        <div class="form-group">
                                            <label>Vendor Phone</label>
                                            <input class="form-control" type="text" name="pocPhone" placeholder="Vendor Phone">
                                        </div>
                                        <div class="form-group">
                                            <label>Vendor Email</label>
                                            <input class="form-control" type="text" name="pocEmail" placeholder="Vendor E-mail">
                                        </div>
                                       
                                       
                                        <script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
      $( "#dp" ).datepicker({
changeMonth: true,

dateFormat: 'mm-dd-yy'
});
    </script>
    <script>
      $( "#dp2" ).datepicker({
changeMonth: true,

dateFormat: 'mm-dd-yy'
});
    </script>
                                        <button type="submit"name = "submit" value="Add" class="btn btn-default">Submit</button>
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
        
           
           
            

        <hr>

    </div>
    <!-- /.container -->
    
    
    
    
    
    
    
    
    
    <div class="container">
		
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Edit Supplies</h1>
            </div>
        </div>
        <!-- /.row -->


        <!-- Content Row -->       
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Edit Supply Information
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                
                                  <table id="itemsGrid" name = "grid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                    	<th>Supply Id</th>
                    	<th>Building Name</th>
			            <th>Point of Contact</th>
			            <th>Description</th>
			            <th>Quantity</th>
                        
                    </tr>
                </thead>
               
                    <%
                      @SuppressWarnings("unchecked")
                      List<Supplies> s = (List<Supplies>)request.getAttribute("supplies");
                       if (s != null) {
                        for (Supplies sp : s) {
                      
                      %>
                      
                      <tr>
                      <form method="POST">
                        <td>
                             <input class="form-control" type="long" name="supplyId" value = <%= sp.getId() %> readonly>
                        </td>
                        <td>
                        	<input class="form-control" type="text" name="supplyName" value = "<%=sp.getSupplyName()%>" placeholder="Supply Name">
                        </td>
                        <td>
                        	<input class="form-control" type="text" name="supplyPoc" value = "<%=sp.getPocName()%>" placeholder="Point of Contact: Name">
                        </td>
                          <td>
                        	<input class="form-control" type="text" name="supplyDescription" value = "<%=sp.getDescription()%>" placeholder="Supply description">
                        </td>
                        <td>
                        	<input class="form-control" type="int" name="supplyQty" value = "<%=sp.getQuantity()%>" placeholder="0">
                        </td>
                        
						  
                        <td>
                              <button   name = "submit" value = "updateRow"  class="btn btn-default">Update</button> 
                        </td>
                        <td>
                             <button   name = "submit" value = "deleteRow"  class="btn btn-default">Delete</button>
                        </td>
                        </form>
                      </tr>
                      
                     
                      <%
                       }
                      %>
                      
                      <%
                       }
                      %>
            </table> 
                                
                              
                                
                                
                                
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
        $('#suppliesGrid').dataTable();
    } );
    </script>
       
    </body>
 </html>