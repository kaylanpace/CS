<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,workorder.WorkOrder"%>
<%@page import="java.util.*,employee.Employee"%>
<%@page import="java.util.*,buiding.BuildingServlet, buiding.Building"%>
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

    <title>ConstructionPal - Supplies</title>

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
                        <h1 class="page-header">Supplies</h1>
                        
                        
                        
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
			                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">View Supplies</a>
			                                        </h4>
			                                    </div>
			                                    <div id="collapseOne" class="panel-collapse collapse in">
			                                        <div class="panel-body">
			                                        	
			                                        	<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
									                    	<thead>    
								                                <tr>
								                                    <th>Supply ID</th>
								                                    <th>Supply Name</th>
								                                    <th>Quantity</th>
								                                    <th>Description</th>
								                                </tr>
						                                	</thead>
							                                <tbody>
							                                <c:forEach var="wr" items="${supplies}">
								                                <form method = "POST">
								         							<tr>
								         								<td><input type = "long" name ="id" value = "${wr.getId()}" readonly style="width: 46px; "></td>
								         								<td id=workDes name = "description">${wr.getSupplyName()}</td>
								         								<td id=workPL name = "priorityLevel">${wr.getQuantity()}</td>
								         								<td id=workStatus name = "status">${wr.getDescription()}</td> 
								         								<td><button  name = "submit" value="selectSupply" class="btn btn-outline btn-primary btn-lg">Select</button></td>
								         							</tr>
								         						</form>
							        						</c:forEach>
							           						</tbody>
							            				</table>
							            				
			                                        	<hr>
			                                        	
			                                        	<div class="panel-body">
								                            <!-- Nav tabs -->
								                            <ul class="nav nav-pills">
								                                <li class="active"><a href="#supplyInfo" data-toggle="tab">Supply Information</a>
								                                </li>
								                            </ul>
								
								                            <!-- Tab panes -->
								                            <div class="tab-content">
								                                <div class="tab-pane fade in active" id="supplyInfo">
								                                	
								                                	<table id="supplyInfoGrid" class="table table-condensed table-hover table-striped" cellspacing="0" width="100%">
								                                         <form method = "POST">
								                                            <tr>
								                                                <td><b>Supply ID</b></td>
								                                                <td id= sId >${supplySelected.getId()}</td>
								                                            </tr>
								                                            <tr>
								                                                <td><b>Description</b></td>
								                                                <td><input style="width: 300px;" class="form-control" id = woDes style="width: 481px; " type="text" name="sDescription" value = "${supplySelected.getDescription()}" placeholder="description"></td>
								                                            </tr>
								                                            <tr>
								                                                <td><b>Supply Name</b></td>
								                                                <td><input style="width: 300px;" id= woPL  class="form-control"  type="text" name="sSupplyName" value = "${supplySelected.getSupplyName()}" placeholder="">
								                                            </tr>
								                                            <tr>
								                                                <td><b>Point of Contact</b></td>
								                                                <td><input style="width: 300px;" id= woPL  class="form-control"  type="text" name="sPoc" value = "${supplySelected.getPocName()}" placeholder="">
								                                            </tr>
								                                            <tr>
								                                                <td><b>Quantity</b></td>
								                                                <td>
									                                            	<input style="width: 300px;" id = woStatus  class="form-control"  type="integer"  name="sQuantity" value = "${workOrderSelected.getQuantity()}" placeholder="">
									                                            </td>
								                                            </tr>
								                                            <tr>
								                                            	<td></td>
								                       						 	<td>
								                       						 		<button  name = "submit" value = "deleteRow"  class="btn btn-default">Delete</button>     
								                       						 		<button  name="submit" value="updateRow" class="btn btn-default">Update</button></td>
								                       						 	</td>
								                       						 </tr>
								                       					 </form>
								                                      </table>
								                                	
								                                	
								                                </div>
								                            </div>
								                        </div>
								                        <!-- /.panel-body -->
			                                        	
			                                        	
			                                        	
			                                        	
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="panel panel-default">
			                                    <div class="panel-heading">
			                                        <h4 class="panel-title">
			                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Add New Supplies</a>
			                                        </h4>
			                                    </div>
			                                    <div id="collapseTwo" class="panel-collapse collapse">
			                                        <div class="panel-body">
			                                        	<form role="form" method="POST" action="supplies">
					                                        <div class="form-group">
					                                            <label>Supply Name</label>
					                                            <input class="form-control" type="text" name="supplyName">
					                                        </div>
					                                        <div class="form-group">
					                                            <label>Quantity</label>
					                                            <input class="form-control" type="text" name="quantity" placeholder="Format: 30">
					                                        </div>
					                                        <div class="form-group">
					                                            <label>Description</label>
					                                            <TextArea class="form-control" type="text" name="description"></TextArea>
					                                        </div>
					                                        <div class="form-group">
					                                            <label for = "edDP">Expiration Date</label>
					                                            <input class="form-control" type="date" id = "edDP" name="expirationDate">
					                                        </div>
					                                        <div class="form-group">
					                                            <label for = "ccDP">Check Cycle</label>
					                                            <input class="form-control" type="date" id = "ccDP" name="checkCycle">
					                                        </div>
					                                        <div class="form-group">
					                                            <label>Vendor Name</label>
					                                            <input class="form-control" type="text" name="pocName">
					                                        </div>
					                                        <div class="form-group">
					                                            <label>Vendor Phone</label>
					                                            <input class="form-control" type="text" name="pocPhone" placeholder="Format: (123) 456-7890">
					                                        </div>
					                                        <div class="form-group">
					                                            <label>Vendor Email</label>
					                                            <input class="form-control" type="text" name="pocEmail">
					                                        </div>
					                                        
					                                        <button type="submit"name = "submit" value="Add" class="btn btn-default">Submit</button>
					                                        <button type="reset" class="btn btn-default">Reset</button>
					                                        
					                                        <script src="js/jquery.min.js"></script>
														    <script src="js/jquery-ui.min.js"></script>
														    <script src="js/bootstrap.min.js"></script>
														    <script>
                                                                    $( "#edDP" ).datepicker({
                                                                    changeMonth: true,
                                                                    changeYear: true
                                                                     });
                                                            </script>
														    <script>
                                                                    $( "#ccDP" ).datepicker({
                                                                    changeMonth: true,
                                                                    changeYear: true
                                                                     });
                                                            </script>
					                                        
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

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>
    
    <!-- DataTables JavaScript -->
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script> 

    <script>
	$(document).ready(function() {
    var table = $('#example').DataTable();
    $('#example tbody').on( 'click', 'tr', function () {
        $(this).toggleClass('selected')
        clearVals();
    	} );
	} );
	</script>
	
	<script>
    var row = $('#tt').datagrid('getSelected');
    if (row){
        alert('Item ID:'+row.itemid+"\nPrice:"+row.listprice);
    }
    </script>
    
    <script type="text/javascript">
    function getWorkId(){
        var id = document.getElementById('getWorkId').value;
        alert(id);
    }
    </script>

</body>

</html>