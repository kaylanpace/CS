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

    <title>ConstructionPal - Work Orders</title>

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
                        <h1 class="page-header">Work Orders</h1>
                        
                        
                        
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
			                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">View Work Orders</a>
			                                        </h4>
			                                    </div>
			                                    <div id="collapseOne" class="panel-collapse collapse in">
			                                        <div class="panel-body">
			                                        	
			                                        	
			                                        	
                                  						<table id="example" class="display" cellspacing="0" width="100%">
										                     <thead>    
							                                <tr>
							                                    <th>Work Order ID</th>
							                                    <th>Description</th>
							                                    <th>Priority Level</th>
							                                    <th>Status</th>
							                                </tr>
							                                </thead>
							                                <tbody>
							                                
							                                <c:forEach var="wr" items="${workorders}">
							                                
							                                <form method = "POST">
							         							<tr>
							         							
							         								<%-- <td  name ="id" value = "${wr.getWorkorderId()}">${wr.getWorkorderId()}</td> --%>
							         								<td><input type = "long" name ="id" value = "${wr.getWorkorderId()}" readonly style="width: 46px; "></td>
							         								<td id=workDes name = "description">${wr.getDescription()}</td>
							         								<td id=workPL name = "priorityLevel">${wr.getPriorityLevel()}</td>
							         								<td id=workStatus name = "status">${wr.getStatus()}</td> 
							         								<td><button   name = "submit" value="selectWorkOrder" class="btn btn-outline btn-primary btn-lg">Select</button></td>
							         							
							         							</tr>
							         						</form>
							           
							        						</c:forEach>
							           						</tbody>                 
							                   
							            				</table>
			                                        	
			                                        	
			                                        	
			                                        	
			                                        	
			                                        	<hr>
			                                        	
			                                        	
			                                        	
			                                        	
			                                        	
			                                        	<!-- <div class="col-lg-6">
										                    <div class="panel panel-default">
										                        <div class="panel-heading">
										                            Pill Tabs
										                        </div> -->
										                        <!-- /.panel-heading -->
										                        <div class="panel-body">
										                            <!-- Nav tabs -->
										                            <ul class="nav nav-pills">
										                                <li><a href="#workOrderInfo" data-toggle="tab">Work Order Information</a>
										                                </li>
										                                <li><a href="#employeeInfo" data-toggle="tab">Employee Information</a>
										                                </li>
										                                <li><a href="#buildingInfo" data-toggle="tab">Building Information</a>
										                                </li>
										                                <li><a href="#supplyInfo" data-toggle="tab">Supply Information</a>
										                                </li>
										                            </ul>
										
										                            <!-- Tab panes -->
										                            <div class="tab-content">
										                                <div class="tab-pane fade in active" id="workOrderInfo">
										                                    <table id="workOrderInfoGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
										                                         <form method = "POST">
										                                            <tr>
										                                                <td><b>Work Order ID</b></td>
										                                                <td id= woId >${workOrderSelected.getWorkorderId()}</td>
										                                            </tr>
										                                            <tr>
										                                                <td><b>Description</b></td>
										                                                <td><input style="width: 300px;" class="form-control" id = woDes style="width: 481px; " type="text" name="woDescription" value = "${workOrderSelected.getDescription()}" placeholder="description"></td>
										                                            </tr>
										                                            <tr>
										                                                <td><b>Priority Level</b></td>
										                                                <td><select style="width: 300px;" id= woPL  class="form-control"  type="text" name="woPriorityLevel" value = "${workOrderSelected.getPriorityLevel()}" placeholder="">
												                                            <option value = "${workOrderSelected.getPriorityLevel()}"> ${workOrderSelected.getPriorityLevel()} </option>
												                                            <option value = "Low">Low</option>
												                                            <option value = "High">High</option>
										                                            	</select></td>
										                                            </tr>
										                                            <tr>
										                                                <td><b>Status</b></td>
										                                                <td>
												                                            <select style="width: 300px;" id = woStatus  class="form-control"  type="text"  name="woStatus" value = "${workOrderSelected.getStatus()}" placeholder="">
													                                            <option value ="${workOrderSelected.getStatus()}"> ${workOrderSelected.getStatus()}</option>
													                                            <option value = "Started">Started</option>
													                                            <option value = "Cancelled">Cancelled</option>
													                                            <option value = "Finished">Finished</option>
												                                            </select>
											                                            </td>
										                                            </tr>
										                                            <tr>
											                                            <td><b>Expected Finish</b></td>
											                                            <td>
											                            					<input style="width: 300px;"   class="form-control" type="date" id = "efDP" name="woExpectedFinish" value = "${workOrderSelected.getExpectedFinish()}">
											                       						</td>
										                       						 </tr>
										                       						 <tr>
											                       						 <td><b>Finish Date</b></td>
											                                             <td><input style="width: 300px;"   class="form-control" type="date" id = "fdDP" name="woFinishDate" value = "${workOrderSelected.getFinishDate()}"></td>
										                       						 </tr>
										                       						 <tr>
										                       						 	<td> </td>
											                       						 <td>
												                       						 <button   name = "submit" value = "deleteRow"  class="btn btn-default">Delete</button>     
												                       						 <button   name="submit" value="updateRow" class="btn btn-default">Update</button>
											                       						 </td>
										                       						 </tr>
										                       						
										                       						<!-- DatePicker JavaScript -->
																				    <script src="js/jquery.min.js"></script>
																				    <script src="js/jquery-ui.min.js"></script>
																				    <script src="js/bootstrap.min.js"></script>
						
						                                                            <script>
						                                                                    $( "#efDP" ).datepicker({
						                                                                    changeMonth: true,
						                                                                    changeYear: true
						                                                                     });
						                                                            </script>
						                                                            
						                                                            <script>
						                                                                    $( "#fdDP" ).datepicker({
						                                                                    changeMonth: true,
						                                                                    changeYear: true
						                                                                     });
						                                                            </script>
										                       					 </form>
										                                      </table> 
										                                </div>
										                                <div class="tab-pane fade" id="employeeInfo">
										                                	<h3>Assigned employees</h3>
														                		 <table id="assignedEmployeesGrid" class="table table-condensed table-hover table-striped" cellspacing="0" width="100%">
														                            <thead>
														                                <tr>
														                                    <th data-column-id="id" data-type="numeric" data-identifier="true" >Employee ID</th>
														                                    <th>First Name</th>
														                                    <th>Last Name</th>
														                                    <th>Position</th>
														                                </tr>
														                            </thead>
														                             <tbody>
														                                <c:forEach var="e" items="${inWorkEmployees}">
														                                <form method = "POST">
														         							<tr>
														         								<td><input type = "long" name = "eid" value = "${e.getEmpId()}" readonly style="width: 46px; "></td>
														         								<td id=workDes name = "firstName">${e.getEmpFirstName()}</td>
														         								<td id=workPL name = "lastName">${e.getEmpLastName()}</td>
														         								<td id=workStatus name = "position">${e.getPosition()}</td> 
														         								<td><button  type = "submit" name = "submit"  value="removeWorker" class="btn btn-outline btn-primary btn-lg">Unassign Worker</button></td>
														         							</tr>
														         						</form>
														        						</c:forEach>
														           						</tbody>  
																				</table>
																				
										                                	<h3>Available employees</h3>
														                 		<table id="availableEmployeesGrid" class="table table-condensed table-hover table-striped" cellspacing="0" width="100%">
														                            <thead>
														                                <tr>
														                                    <th data-column-id="id" data-type="numeric" data-identifier="true" >Employee ID</th>
														                                    <th>First Name</th>
														                                    <th>Last Name</th>
														                                    <th>Position</th>
														                                    <th>In-Work</th>
														                                </tr>
														                            </thead>
														                             <tbody>
														                                <c:forEach var="ea" items="${availableWorkers}">
														                                <form method = "POST" >
														         							<tr>
														         								<td><input type = "long" name = "eid" value = "${ea.getEmpId()}" readonly style="width: 46px; "></td>
														         								<td id=workDes name = "firstName">${ea.getEmpFirstName()}</td>
														         								<td id=workPL name = "lastName">${ea.getEmpLastName()}</td>
														         								<td id=workStatus name = "position">${ea.getPosition()}</td>
														         								<td id=workStatus name = "position">${ea.getInWork()}</td>  
														         								<td><button  name = "submit"  value="assignWorker" class="btn btn-outline btn-primary btn-lg">Assign Worker</button></td>
														         							</tr>
														         						</form>
														        						</c:forEach>
														           						</tbody>  
																				</table>
										                                </div>
										                                <div class="tab-pane fade" id="buildingInfo">
										                                    
										                                    <h4>Assigned Building</h4>
		                                                                        <table id="assignedBuildingGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
		                                                                            <thead>
		                                                                                <tr>
			                                                                                <th>Building ID</th>
		                                                                                    <th>Building Name</th>
					           																<th>Point of Contact</th>
					           																<th>Street</th>
					          																<th>City</th>
					           																<th>State</th>
					            															<th>Zip</th>
		                                                                                </tr>
		                                                                            </thead>
		                                                                            <tbody>
	                               														<form method = "POST">
		         																			<tr>
				         																		<td><input type = "long" name = "bid" value = "${buildingAssigned.getId()}" readonly style="width: 46px; "></td>
				         																		<td id=workDes name = "buildingName">${buildingAssigned.getBuildingName()}</td>
				         																		<td id=workPL name = "poc">${buildingAssigned.getPocName()}</td>
				         																		<td id=workStatus name = "street">${buildingAssigned.getStreet()}</td> 
				         																		<td id=workPL name = "city">${buildingAssigned.getCity()}</td>
				         																		<td id=workStatus name = "state">${buildingAssigned.getState()}</td> 
				         																		<td id=workStatus name = "zip">${buildingAssigned.getZip()}</td> 
				         																		<td><button  name = "submit" value="unassignBuilding" class="btn btn-outline btn-primary btn-lg">Unassign</button></td>
														         							</tr>
												         								</form>
	                                                                        		</tbody>
		                                                                        </table>
		                                                                        
                                                                        	<h4>All Buildings</h4>
		                                                                        <table id="allBuidingsGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
		                                                                            <thead>
		                                                                                <tr>
		                                                                                	<th>Building ID</th>
		                                                                                    <th>Building Name</th>
					           																<th>Point of Contact</th>
					           																<th>Street</th>
					          																<th>City</th>
					           																<th>State</th>
					            															<th>Zip</th>
		                                                                                </tr>
		                                                                            </thead>
		                                                                            <tbody>
		                                                                                <c:forEach var="b" items="${buildings}">
		                               														<form method = "POST">
		         																				<tr>
					         																		<td><input type = "long" name = "bid" value = "${b.getId()}" readonly style="width: 46px; "></td>
					         																		<td id=workDes name = "buildingName">${b.getBuildingName()}</td>
					         																		<td id=workPL name = "poc">${b.getPocName()}</td>
					         																		<td id=workStatus name = "street">${b.getStreet()}</td> 
					         																		<td id=workPL name = "city">${b.getCity()}</td>
					         																		<td id=workStatus name = "state">${b.getState()}</td> 
					         																		<td id=workStatus name = "zip">${b.getZip()}</td> 
					         																		<td><button  name = "submit" value="assignBuilding" class="btn btn-outline btn-primary btn-lg">Assign</button></td>
													         									</tr>
														         							</form>
														        						</c:forEach>
                                                                              		</tbody>
		                                                                        </table>
										                                    
										                                    
										                                    
										                                    
										                                </div>
										                                <div class="tab-pane fade" id="supplyInfo">
										                                    <h4>Settings Tab</h4>
										                                    
										                                    
										                                    
										                                    
										                                    
										                                    
										                                    
										                                </div>
										                            </div>
										                        </div>
										                        <!-- /.panel-body -->
										                    <!-- </div>
										                    /.panel
										                </div>
										                /.col-lg-6 -->
			                                        </div>
			                                    </div>
			                                </div>
			                                <div class="panel panel-default">
			                                    <div class="panel-heading">
			                                        <h4 class="panel-title">
			                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Add New Work Order</a>
			                                        </h4>
			                                    </div>
			                                    <div id="collapseTwo" class="panel-collapse collapse">
			                                        <div class="panel-body">
			                                        	<form role="form" method="POST" action="workorder">
                                                            <div class="form-group">
                                                                <label>Priority Level</label>
                                                                <select class="form-control" name="priorityLevel">
                                                                <option>Low</option>
                                                                <option>High</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Status</label>
                                                                <select class="form-control" name="status">
                                                                <option>Not Started</option>
                                                                <option>Started</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="dp">Expected Finish</label>
                                                                <input class="form-control" type="date" id = "dp" name="expectedFinish">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Description</label>
                                                                <TextArea class="form-control" type="text" name="description" placeholder="" style="height: 93px; "></TextArea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Comments</label>
                                                                <TextArea class="form-control" type="text" name="comments"></TextArea>
                                                            </div>
                                                            <button type="submit" name = "submit" value="Add" class="btn btn-default">Submit</button>
                                                            <button type="reset" class="btn btn-default">Reset</button>
                                                            
                                                            <script>
                                                                    $( "#dp" ).datepicker({
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

    <!-- Dynamic Table JavaScript -->
    <!-- <script>
    $(document).ready(function() {
        $('#workOrderGrid').dataTable();
    } );
    </script> -->
    
    
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
    
    <script>
 	//Javascript to enable link to tab
    var url = document.location.toString();
    if (url.match('#')) {
        $('.nav-tabs a[href=#'+url.split('#')[1]+']').tab('show') ;
    } 

    // With HTML5 history API, we can easily prevent scrolling!
    $('.nav-tabs a').on('shown', function (e) {
        if(history.pushState) {
            history.pushState(null, null, e.target.hash); 
        } else {
            window.location.hash = e.target.hash; //Polyfill for old browsers
        }
    })
    </script>

</body>

</html>