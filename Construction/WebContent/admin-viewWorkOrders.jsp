<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,workorder.WorkOrder"%>
<%@page import="java.util.*,employee.Employee"%>
<%@page import="java.util.*,buiding.Building"%>
<%@page import="java.util.*,supplies.Supplies"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ConstructionPal - Work Orders</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    
    <!-- DataTables CSS -->
    <link href="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="bower_components/datatables/media/css/jquery.dataTables.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="css/modern-business.css" rel="stylesheet">
    
    <!--  Date Picker -->
    <link href="css/jquery-ui.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="dashboard.html">ConstructionPal</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="admin-dashboard.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-user fa-fw"></i> Employees<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="employee.html">View Employees</a>
                                </li>
                                <li>
								   <a href="/Construction/employee">Create New Employees</a>
                                </li>
                               
							
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-list-alt fa-fw"></i> Work Orders<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/Construction/admin-viewWorkOrders">View Work Orders</a>
                                </li>
                                <li>
                                    <a href="/Construction/workorder">Create New Work Order</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-building-o fa-fw"></i> Buildings<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.html">View Buildings</a>
                                </li>
                                <li>
                                    <a href="/Construction/building">Add Buildings </a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Supplies<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.html">View Supplies</a>
                                </li>
                                <li>
                                    <a href="supplies.jsp">Add Supplies</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-gears fa-fw"></i> Equipment<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.html">View Equipment</a>
                                </li>
                                <li>
                                    <a href="equipment.jsp">Add Equipment</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Work Orders</h1>
                        
                        <table id="workorderGrid" class="table table-condensed table-hover table-striped" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th data-column-id="id" data-type="numeric" data-identifier="true" >Work Order ID</th>
                                    <th>Description</th>
                                    <th>Priority Level</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                           
                               <%
                          @SuppressWarnings("unchecked")
                          List<WorkOrder> workorders = (List<WorkOrder>)request.getAttribute("workorders");
                           if (workorders != null) {
                            for (WorkOrder workorder : workorders) {
                          %>
                          <tbody>
                       <tr>
                      		<td>
                                    <%= workorder.getWorkorderId() %>
                            </td>
                            
                            <td>
                                    <%= workorder.getDescription() %>
                            </td>
                            
                            <td>
                                    <%= workorder.getPriorityLevel() %>
                            </td>
                            <td>
                                    <%= workorder.getStatus() %>
                            </td>
                      </tr> 
                      </tbody>
                      <%
                           }
                          %>
                          <%
                           }
                          %>
            </table>
                        
                        <button id="woS" type="button" class="btn btn-outline btn-primary btn-lg">Select work order</button>
                        <a href="/Construction/workorder"><button type="button" class="btn btn-outline btn-primary btn-lg">Add new work order</button></a>
                        
                        <hr>
                        
                        <div class="well">
                            <div class="bs-example">
                                <ul class="nav nav-tabs">
                                    <li><a data-toggle="tab" href="#sectionA">Work order information</a></li>
                                    <li><a data-toggle="tab" href="#sectionB">Assigned employees</a></li>
                                    <li><a data-toggle="tab" href="#sectionC">Building information</a></li>
                                    <li><a data-toggle="tab" href="#sectionD">Assigned supplies</a></li>
                                    <li><a data-toggle="tab" href="#sectionE">Point of contact</a></li>
                                    <li><a data-toggle="tab" href="#sectionF">Update status</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="sectionA" class="tab-pane fade in active">
                                        <h3>Work order information</h3>
                                        <table id="workOrderInfoGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <tr>
                                                <td><b>Work Order ID</b></td>
                                                <td id= woId></td>
                                            </tr>
                                            <tr>
                                                <td><b>Description</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Building ID</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Point of Contact</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Priority Level</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Status</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Start Date</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Finish Date</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Expected Finish Date</b></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>
                                   
                                    <div id="sectionB" class="tab-pane fade">
                                        <h3>Assigned employees</h3>
                <table id="employeeGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
			    <thead>
			        <tr>
			            <th>First Name</th>
			            <th>Last Name</th>
			            <th>Social Security Number</th>
			            <th>Position</th>
			            <th>Age</th>
			            <th>Administrator</th>
			        </tr>
			    </thead>
			   
                                                 <%
				      @SuppressWarnings("unchecked")
				      List<Employee> employees = (List<Employee>)request.getAttribute("employees");
				       if (employees != null) {
				        for (Employee employee : employees) {
				      %>
			          <tr>
			          	<td>
			          		<%= employee.getEmpFirstName() %>
			          	</td>
			          	<td>
			          		<%= employee.getEmpLastName() %>
			          	</td>
			          	<td>
			          		<%= employee.getSsn() %>
			          	</td>
			          	<td>
			          		<%= employee.getPosition() %>
			          	</td>
			          	<td>
			          		<%= employee.getAge() %>
			          	</td>
			          	<td>
			          		<%= employee.isAdmin() %>
			          	</td>
			          </tr>
			          <%
				       }
				      %>
				      <%
				       }
				      %>
			</table>

                                       <button type="button" class="btn btn-outline btn-primary btn-lg">Assign employees</button></a>
                                    </div>
                                    
                                     <div id="sectionC" class="tab-pane fade">
                                        <h3>Building information</h3>
                                        <table id="buildingInfoGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Building ID</th>
                                                    <th>Building Name</th>
                                                </tr>
                                            </thead>
                                           
                                                <!-- <%
                                                      @SuppressWarnings("unchecked")
                                                      List<Building> buildings = (List<Building>)request.getAttribute("buildings");
                                                       if (buildings != null) {
                                                        for (Building building : buildings) {
                                                      %> -->
                                                  <tr>
                                                        <td>
                                                                <!-- <%= building.getId() %> -->
                                                        </td>
                                                        <td>
                                                                <!-- <%= building.getBuildingName() %> -->
                                                        </td>
                                                  </tr>
                                                  <!-- <%
                                                       }
                                                      %>
                                                      <%
                                                       }
                                                      %> -->
                                        </table>
                                    </div>
                                    <div id="sectionD" class="tab-pane fade">
                                        <h3>Assigned supplies</h3>
                                        <table id="suppliesGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Supply ID</th>
                                                    <th>Supply Name</th>
                                                    
                                                </tr>
                                            </thead>
                                          
                                                <!-- <%
                                                      @SuppressWarnings("unchecked")
                                                      List<Supplies> suppliesList = (List<Supplies>)request.getAttribute("suppliesList");
                                                       if (suppliesList != null) {
                                                        for (Supplies supplies : suppliesList) {
                                                      %> -->
                                                  <tr>
                                                        <td>
                                                                <!-- <%= supplies.getId() %> -->
                                                        </td>
                                                        <td>
                                                                <!--  <%= supplies.getSupplyName() %> -->
                                                        </td>
                                                       
                                                  </tr>
                                                  <%
                                                       }
                                                      %>
                                                      <%
                                                       }
                                                      %> 
                                        </table>
                                    </div> --%>
                                    <div id="sectionE" class="tab-pane fade">
                                        <h3>Point of contact</h3>
                                        <table id="pocGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>POC ID</th>
                                                    <th>Name</th>
                                                    <th>Phone</th>
                                                    <th>E-mail</th>
                                                    <th>Vendor</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>POC ID</th>
                                                    <th>Name</th>
                                                    <th>Phone</th>
                                                    <th>E-mail</th>
                                                    <th>Vendor</th>
                                                </tr>
                                            </tfoot>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div id="sectionF" class="tab-pane fade">
                                        <h3>Work order status</h3>
                                        <form role="form" method="POST" action="workorder">
                                        <div class="form-group">
                                            <label>Status</label>
                                            <select class="form-control" name="status">
                                                <option>Incomplete</option>
                                                <option>Complete</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="dp">Finish Date</label>
                                            <input class="form-control" type="text" id="fd" name="finishDate" placeholder="">
                                        </div>
                                        <button type="submit" value="Add" class="btn btn-default">Submit</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                    <!-- <input type="submit" value="Add" /> -->
                                    </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
                <hr>
                <!-- Footer -->
                <footer>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>Copyright &copy; AlphaTech 2015</p>
                        </div>
                    </div>
                </footer>
                
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
        
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    
    <!-- DataTables JavaScript -->
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

    <!-- Dynamic Table JavaScript -->
   <script>
$(document).ready(
		function() {
    var table = $('#workorderGrid').DataTable();
    $('#workorderGrid tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            var row = $('#workorderGrid').datagrid('getSelected');
    if (row){
    alert('Item ID:'+row.id);
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    } });
 
} );
    </script>
    
    <script>
    var row = $('#tt').datagrid('getSelected');
    if (row){
    alert('Item ID:'+row.itemid+"\nPrice:"+row.listprice);
}</script>
    
    <!-- <script>
    $(document).ready(function() {
        $('#employeeGrid').dataTable();
    } );
    </script>
    
    <script>
    $(document).ready(function() {
        $('#buildingInfoGrid').dataTable();
    } );
    </script>
    
    <script>
    $(document).ready(function() {
        $('#suppliesGrid').dataTable();
    } );
    </script>
    
    <script>
    $(document).ready(function() {
        $('#pocGrid').dataTable();
    } );
    </script> -->
    
    <!-- Date Picker JavaScript -->
    <script src="js/jquery-ui.min.js"></script>
    <script>
     $( "#fd" ).datepicker({
            changeMonth: true,
            changeYear: true
             });
    </script>

</body>

</html>