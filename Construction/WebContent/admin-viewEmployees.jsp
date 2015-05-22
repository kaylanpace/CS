<!DOCTYPE html>
<html lang="en">
<%@page import="java.util.*,workorder.WorkOrder"%>
<%@page import="java.util.*,employee.Employee"%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ConstructionPal - Employees</title>

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
                <a class="navbar-brand" href="dashboard.jsp">ConstructionPal</a>
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
                        <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <a href="admin-dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-user fa-fw"></i> Employees<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="admin-viewEmployees.jsp">View Employees</a>
                                </li>
                                <li>
                                    <a href="admin-addEmployees.jsp">Create New Employees</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-list-alt fa-fw"></i> Work Orders<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="admin-viewWorkOrders.jsp">View Work Orders</a>
                                </li>
                                <li>
                                    <a href="admin-addWorkOrders.jsp">Create New Work Order</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-building-o fa-fw"></i> Buildings<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.jsp">View Buildings</a>
                                </li>
                                <li>
                                    <a href="index.jsp">Add Buildings </a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> Supplies<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.jsp">View Supplies</a>
                                </li>
                                <li>
                                    <a href="index.jsp">Order Supplies</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-gears fa-fw"></i> Equipment<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.jsp">View Equipment</a>
                                </li>
                                <li>
                                    <a href="index.jsp">Order Equipment</a>
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
                        <h1 class="page-header">Employees</h1>
                        
                        <table id="employeeGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
			    <thead>
			        <tr>
			            <th>First Name</th>
			            <th>Last Name</th>
			            <th>Position</th>
			        </tr>
			    </thead>
			    <tfoot>
			        <tr>
			            <th>First Name</th>
			            <th>Last Name</th>
			            <th>Position</th>
			        </tr>
			    </tfoot>
			        <!-- <%
				      @SuppressWarnings("unchecked")
				      List<Employee> employees = (List<Employee>)request.getAttribute("employees");
				       if (employees != null) {
				        for (Employee employee : employees) {
				      %> -->
			          <tr>
			          	<td>
			          		<!-- <%= employee.getEmpFirstName() %> -->
			          	</td>
			          	<td>
			          		<!-- <%= employee.getEmpLastName() %> -->
			          	</td>
                                        <td>
                                                <!-- <%= employee.getPosition() %> -->
                                        </td>
			          </tr>
			          <!-- <%
				       }
				      %>
				      <%
				       }
				      %> -->
			</table>
                        
                        <button type="button" class="btn btn-outline btn-primary btn-lg">Select employee</button>
                        <a href="admin-addEmployees.jsp"><button type="button" class="btn btn-outline btn-primary btn-lg">Add new employee</button></a>
                        
                        <hr>
                        
                        <div class="well">
                            <div class="bs-example">
                                <ul class="nav nav-tabs">
                                    <li><a data-toggle="tab" href="#sectionA">Employee information</a></li>
                                    <li><a data-toggle="tab" href="#sectionB">Work order information</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div id="sectionA" class="tab-pane fade in active">
                                        <h3>Employee information</h3>
                                        <table id="employeeInfoGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <tr>
                                                <td><b>First Name</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Last Name</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Social security number</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Position</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Age</b></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td><b>Administrator</b></td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div id="sectionB" class="tab-pane fade">
                                        <h3>Work order information</h3>
                                        <table id="workOrderInfoGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        Work Order ID
                                                    </th>
                                                    <th>
                                                        Description
                                                    </th>
                                                </tr>
                                            </thead>
                                                <tr>
                                                    <td>
                                                        
                                                    </td>
                                                    <td>
                                                         
                                                    </td>
                                                </tr>
                                        </table>
                                        
                                        <a href="admin-viewWorkOrder.jsp"><button type="button" class="btn btn-outline btn-primary btn-lg">View work order</button></a>
                                        <a href="admin-assignWorkOrder.jsp"><button type="button" class="btn btn-outline btn-primary btn-lg">Assign work order</button></a>

                                        
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
    $(document).ready(function() {
        $('#employeeGrid').dataTable();
    } );
    </script>

</body>

</html>