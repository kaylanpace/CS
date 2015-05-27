<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,workorder.WorkOrder"%>
<%@page import="java.util.*,employee.Employee"%>
<%@page import="java.util.*,buiding.Building"%>
<%@page import="java.util.*,supplies.Supplies"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ConstructionPal - Buildings</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="css/modern-business.css" rel="stylesheet">
    
    <!-- DataTables CSS -->
    <link href="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="bower_components/datatables/media/css/jquery.dataTables.css" rel="stylesheet">
    
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
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-top-link navbar-left">
				<li>
					<img src="ConstructionPal_Fotor.jpg" height="51">
				</li>            
            </ul>

            <ul class="nav navbar-top-links navbar-right">
            	<li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="admin-dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="workorder"><i class="fa fa-list-alt fa-fw"></i> Work Orders</a>
                        </li>
                        <li>
                            <a href="employee"><i class="fa fa-user fa-fw"></i> Employees</a>
                        </li>
                        <li>
                            <a href="building"><i class="fa fa-building-o fa-fw"></i> Buildings</a>
                        </li>
                        <li>
                            <a href="supplies"><i class="fa fa-wrench fa-fw"></i> Supplies</a>
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
                        <h1 class="page-header">Buildings</h1>
                        
                        
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Select Task Below
                                    </div>
                                    <!-- .panel-heading -->
                                    <div class="panel-body">
                                        <div class="panel-group" id="accordion">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">View Buildings</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseOne" class="panel-collapse collapse in">
                                                    <div class="panel-body">
                                                        <table id="buildingGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                                            <thead>
                                                                <tr>
                                                                    <th>Building ID</th>
                                                                    <th>Building Name</th>
                                                                    <th>Street</th>
                                                                    <th>City</th>
                                                                    <th>State</th>
                                                                    <th>ZIP</th>
                                                                </tr>
                                                            </thead>
                                                                <%
                                                                    @SuppressWarnings("unchecked")
                                                                    List<Building> buildings = (List<Building>)request.getAttribute("buildings");
                                                                     if (buildings != null) {
                                                                      for (Building building : buildings) {
                                                                      %>
                                                                  <tr>
                                                                        <td>
                                                                                <%= building.getId() %>
                                                                        </td>
                                                                        <td>
                                                                                <%= building.getBuildingName() %>
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
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Add Buildings</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <form role="form" method="POST" action="building">
					                                        <div class="form-group">
					                                            <label>Building Name</label>
					                                            <input class="form-control" type="text" name="buildingName">
					                                        </div>
					    								  <div class="form-group">
					                                            <label>Street Address</label>
					                                            <input class="form-control" type="text" name="street">
					                                        </div>
					                                        <div class="form-group">
					                                            <label>City</label>
					                                            <input class="form-control" type="text" name="city">
					                                        </div>
					                                         <div class="form-group">
                                                                <label>State</label>
                                                                <select class="form-control" name="state">
                                                                    <option>AL</option>
                                                                    <option>AK</option>
                                                                    <option>AZ</option>
                                                                    <option>AR</option>
                                                                    <option>CA</option>
                                                                    <option>CO</option>
                                                                    <option>CT</option>
                                                                    <option>DE</option>
                                                                    <option>FL</option>
                                                                    <option>GA</option>
                                                                    <option>HI</option>
                                                                    <option>ID</option>
                                                                    <option>IL</option>
                                                                    <option>IN</option>
                                                                    <option>IA</option>
                                                                    <option>KS</option>
                                                                    <option>KY</option>
                                                                    <option>LA</option>
                                                                    <option>ME</option>
                                                                    <option>MD</option>
                                                                    <option>MA</option>
                                                                    <option>MI</option>
                                                                    <option>MN</option>
                                                                    <option>MS</option>
                                                                    <option>MO</option>
                                                                    <option>MT</option>
                                                                    <option>NE</option>
                                                                    <option>NV</option>
                                                                    <option>NH</option>
                                                                    <option>NJ</option>
                                                                    <option>NM</option>
                                                                    <option>NY</option>
                                                                    <option>NC</option>
                                                                    <option>ND</option>
                                                                    <option>OH</option>
                                                                    <option>OK</option>
                                                                    <option>OR</option>
                                                                    <option>PA</option>
                                                                    <option>RI</option>
                                                                    <option>SC</option>
                                                                    <option>SD</option>
                                                                    <option>TN</option>
                                                                    <option>TX</option>
                                                                    <option>UT</option>
                                                                    <option>VT</option>
                                                                    <option>VA</option>
                                                                    <option>WA</option>
                                                                    <option>WV</option>
                                                                    <option>WI</option>
                                                                    <option>WY</option>
                                                                </select>
                                                            </div>
					                                        <div class="form-group">
					                                            <label>ZIP Code</label>
					                                            <input class="form-control" type="number" name="zip" placeholder="Format: 12345">
					                                        </div>
					                                        <div class="form-group">
					                                            <label for="dp">Check Cycle</label>
					                                            <input class="form-control" type="date" id="dp" name="checkCycle">
					                                        </div> 
					                                        <div class="form-group">
                                                            <fieldset border="">
                                                                <legend>Point of Contact</legend>
                                                                <label for="pocName">Name</label>
                                                                <input class="form-control" type="text" name="pocName">
                                                            </fieldset>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Phone</label>
                                                                <input class="form-control" type="text" name="pocPhone" placeholder="Format: (123) 456-7890">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>E-mail</label>
                                                                <input class="form-control" type="text" name="pocEmail">
                                                            </div> 
					                                        <script src="js/jquery.min.js"></script>
					    									<script src="js/jquery-ui.min.js"></script>
					    									<script src="js/bootstrap.min.js"></script>
					   										<script>
					     									 $( "#dp" ).datepicker({
															changeMonth: true,
															changeYear: true
															 });
					    									</script>
					                                        <button type="submit"name = "submit" value="Add" class="btn btn-default">Submit</button>
					                                        <button type="reset" class="btn btn-default">Reset</button>
					                                    </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- .panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <!-- /.row -->
                        
                        
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

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    
    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>
    
    <!-- DataTables JavaScript -->
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script> 

    <!-- Dynamic Table JavaScript -->
    <script>
    $(document).ready(function() {
        $('#buildingGrid').dataTable();
    } );
    </script>

</body>

</html>