<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,workorder.WorkOrder"%>
<%@page import="java.util.*,employee.Employee"%>
<%@page import="java.util.*,buiding.Building"%>
<%@page import="java.util.*,supplies.Supplies"%>

<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
    <script src="browser_components/datatables/media/js/jquery.dataTables.min.js"></script>
    
    
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/grid.css" rel="stylesheet">
    
    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    
    
    <!-- DataTables Responsive CSS -->
    <link href="bower_components/datatables/media/css/jquery.dataTables.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="css/modern-business.css" rel="stylesheet">
    
    <!--  Date Picker -->
    <link href="css/jquery-ui.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


	<script>
	$(document).ready(function() {
    var table = $('#example').DataTable();
 
    $('#example tbody').on( 'click', 'tr', function () {
        
        $(this).toggleClass('selected')
        clearVals();
       
    } );
   
} );
	</script> 
	<script text="text/javascript">
		function clearVals(){
		document.getElementById("woId").innerHTML = "";
 document.getElementById("woDes").innerHTML = "";
 document.getElementById("woPL").innerHTML = "";
 document.getElementById("woStatus").innerHTML = " ";
		}
	</script>
	<script text="text/javascript">
function getTdValue() {
 var wwwwId = document.getElementById("workId").innerHTML;
 var wwwwDes = document.getElementById("workDes").innerHTML;
 var wwwwPL = document.getElementById("workPL").innerHTML;
 var wwwwStatus = document.getElementById("workStatus").innerHTML;
 
 document.getElementById("woId").innerHTML = wwwwId;
 document.getElementById("woDes").innerHTML = wwwwDes;
 document.getElementById("woPL").innerHTML = wwwwPL;
 document.getElementById("woStatus").innerHTML = wwwwStatus;
 alert(wwwwId);
}
</script>
	
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
                                    <a href="/Construction/viewAllEmployees.jsp">View Employees</a>
                                </li>
                                <li>
								   <a href="/Construction/employee.jsp">Create New Employees</a>
                                </li>
                               
							
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-list-alt fa-fw"></i> Work Orders<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/Construction/admin-viewWorkOrders.jsp">View Work Orders</a>
                                </li>
                                <li>
                                    <a href="/Construction/workorder.jsp">Create New Work Order</a>
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
         								<td><input type = "long" name = "id" value = "${wr.getWorkorderId()}" readonly style="width: 46px; "></td>
         								<td id=workDes name = "description">${wr.getDescription()}</td>
         								<td id=workPL name = "priorityLevel">${wr.getPriorityLevel()}</td>
         								<td id=workStatus name = "status">${wr.getStatus()}</td> 
         								<td><button  name = "submit" value="selectWorker" class="btn btn-outline btn-primary btn-lg">Select</button></td>
         							
         							</tr>
         						</form>
           
        						</c:forEach>
           						</tbody>                 
                   
            			</table>
            
           
                        
                        <!-- <button id="woS" type="button" onclick="getTdValue()" class="btn btn-outline btn-primary btn-lg">Select work order</button>
                        <a href="/Construction/workorder"><button type="button" class="btn btn-outline btn-primary btn-lg">Add new work order</button></a> -->
                        
                        
                        
                        <hr>
                        
                        <div class="well">
                            <div class="bs-example">
                                <ul class="nav nav-tabs">
                                    <li><a data-toggle="tab" href="#sectionA">Work order information</a></li>
                                    <li><a data-toggle="tab" href="#sectionB">Assign employees</a></li>
                                   <!--  <li><a data-toggle="tab" href="#sectionB2">Available employees</a></li> -->
                                    <li><a data-toggle="tab" href="#sectionC">Building information</a></li>
                                    <li><a data-toggle="tab" href="#sectionD">Assigned supplies</a></li>
                                    <li><a data-toggle="tab" href="#sectionE">Point of contact</a></li>
                                    <li><a data-toggle="tab" href="#sectionF">Update status</a></li>
                                </ul>
                               
                                <div class="tab-content">
                                    <div id="sectionA" class="tab-pane fade in active">
                                        <h3>Work order information</h3>
                                        <table id="workOrderInfoGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                         	<form>
                                            <tr>
                                                <td><b>Work Order ID</b></td>
                                                <td id= woId >${workOrderSelected.getWorkorderId()}</td>
                                                
                                            </tr>
                                            <tr>
                                                <td><b>Description</b></td>
                                                <td><input class="form-control" id = woDes style="width: 481px; " type="text" name="woDescription" value = "${workOrderSelected.getDescription()}" placeholder="description"></td>
                                                <%-- <td id= woDes style="width: 481px; ">${workOrderSelected.getDescription()}</td> --%>
                                            </tr>
                                            
                                            <tr>
                                                <td><b>Priority Level</b></td>
                                                <%-- <td id= woPL style="width: 481px; ">${workOrderSelected.getPriorityLevel()}</td> --%>
                                                <td><select id= woPL  class="form-control"  type="text" name="woPriorityLevel" value = "${workOrderSelected.getPriorityLevel()}" placeholder="">
                                            <option value = "${workOrderSelected.getPriorityLevel()}"> ${workOrderSelected.getPriorityLevel()} </option>
                                            <option value = "Low">Low</option>
                                            <option value = "High">High</option>
                                            </select></td>
                                            </tr>
                                            <tr>
                                                <td><b>Status</b></td>
                                                <%-- <td id= woStatus style="width: 481px; ">${workOrderSelected.getStatus()}</td> --%>
                                                 <td>
                                            <select id = woStatus  class="form-control"  type="text"  name="woStatus" value = "${workOrderSelected.getStatus()}" placeholder="">
                                            <option value ="${workOrderSelected.getStatus()}"> ${workOrderSelected.getStatus()}</option>
                                            <option value = "Not Started">Not Started</option>
                                            <option value = "Started">Started</option>
                                            <option value = "Cancelled">Cancelled</option>
                                            <option value = "Finished">Finished</option>
                                            </select>
                                            </td>
                                            </tr>
                                            <tr>
                                            <td><b>Expected Finish</b></td>
                                             <td>
                            				<input id = woExpectedFinish  class="form-control" type="date" id = "dp1" name="woExpectedFinish" value = "${workOrderSelected.getExpectedFinish()}"    placeholder="date">
                       						 </td>
                       						 </tr>
                       						 <tr>
                       						 <td><b>Finish Date</b></td>
                                             <td><input id = woFinishDate  class="form-control" type="date" id = "dp1" name="woFinishDate" value = "${workOrderSelected.getFinishDate()}"    placeholder="date"></td>
                       						 </tr>
                       						 <tr>
                       						 <td> </td>
                       						 <td>
                       						 <button  name = "submit" value = "delete"  class="btn btn-default">Delete</button>     
                       						 <button name="submit" value="updateRow" class="btn btn-default">Update</button>
                       						 </td>
                       						 </tr>
                       						 </form>
                                             <%-- <tr>
                                                <td><b>Status</b></td>
                                                <td id= woStatus style="width: 481px; ">${workOrderSelected.getStatus()}</td>
                                            </tr> --%>
                                            <tr>
                                           
                                            </tr>
                                    </table>
                                    </div>
                                  
                                    <div id="sectionB" class="tab-pane fade">
                                        <h3>Assigned employees</h3>
                 <table id="employeeGrid" class="table table-condensed table-hover table-striped" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th data-column-id="id" data-type="numeric" data-identifier="true" >Employee ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <!-- <th>SSN</th> -->
                                    <th>Position</th>
                                  <!--   <th>Age</th>
                                    <th>isAdmin</th> -->
                                </tr>
                            </thead>
                             <tbody>
                                
                                <c:forEach var="e" items="${inWorkEmployees}">
                                
                                <form method = "POST">
         							<tr>
         							
         								<%-- <td  name ="id" value = "${wr.getWorkorderId()}">${wr.getWorkorderId()}</td> --%>
         								<td><input type = "long" name = "eid" value = "${e.getEmpId()}" readonly style="width: 46px; "></td>
         								<td id=workDes name = "firstName">${e.getEmpFirstName()}</td>
         								<td id=workPL name = "lastName">${e.getEmpLastName()}</td>
         								<td id=workStatus name = "position">${e.getPosition()}</td> 
         								<td><button  name = "submit" value="removeWorker" class="btn btn-outline btn-primary btn-lg">Unassign this Worker</button></td>
         							
         							</tr>
         						</form>
           
        						</c:forEach>
           						</tbody>  
                           
                      
			</table>

                                 
                                        <h3>Available employees</h3>
                 <table id="employeeGrid" class="table table-condensed table-hover table-striped" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th data-column-id="id" data-type="numeric" data-identifier="true" >Employee ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <!-- <th>SSN</th> -->
                                    <th>Position</th>
                                    <th>In-Work</th>
                                    <!-- <th>Age</th>
                                    <th>isAdmin</th> -->
                                </tr>
                            </thead>
                             <tbody>
                                
                                <c:forEach var="ea" items="${availableWorkers}">
                                
                                <form method = "POST">
         							<tr>
         							
         								<%-- <td  name ="id" value = "${wr.getWorkorderId()}">${wr.getWorkorderId()}</td> --%>
         								<td><input type = "long" name = "eid" value = "${ea.getEmpId()}" readonly style="width: 46px; "></td>
         								<td id=workDes name = "firstName">${ea.getEmpFirstName()}</td>
         								<td id=workPL name = "lastName">${ea.getEmpLastName()}</td>
         								<td id=workStatus name = "position">${ea.getPosition()}</td>
         								<td id=workStatus name = "position">${ea.getInWork()}</td>  
         								<td><button  name = "submit" value="assignWorker" class="btn btn-outline btn-primary btn-lg">Assign this worker</button></td>
         							
         							</tr>
         						</form>
           
        						</c:forEach>
           						</tbody>  
                           
                      
			</table>

<!--                                        <button type="button" class="btn btn-outline btn-primary btn-lg">Assign employees</button></a>
 -->                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
                                     <div id="sectionC" class="tab-pane fade">
                                        <h3>Building information</h3>
                                        <table id="buildingInfoGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>Building ID</th>
                                                    <th>Building Name</th>
                                                </tr>
                                            </thead>
                                           
                                                
                                        </table>
                                    </div>
                                    <div id="sectionD" class="tab-pane fade">
                                        <h3>Assigned supplies</h3>
                 <table id="suppliesGrid" class="table table-condensed table-hover table-striped" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th data-column-id="id" data-type="numeric" data-identifier="true" >Supply ID</th>
                                    <th>Supply Name</th>
                                    <th>Description</th>
                                    <!-- <th>SSN</th> -->
                                    <th>Quantity Assigned</th>
                                  <!--   <th>Age</th>
                                    <th>isAdmin</th> -->
                                </tr>
                            </thead>
                             <tbody>
                                
                                <c:forEach var="e" items="${assignedSupplies}">
                                
                                <form method = "POST">
         							<tr>
         							
         								<%-- <td  name ="id" value = "${wr.getWorkorderId()}">${wr.getWorkorderId()}</td> --%>
         								<td><input type = "long" name = "sid" value = "${e.getId()}" readonly style="width: 46px; "></td>
         								<td id=workDes name = "supplyName">${e.getSupplyName()}</td>
         								<td id=workPL name = "supplyDescription">${e.getDescription()}</td>
         								<td id=workStatus name = "supplyQuantity">${e.getQuantity()}</td> 
         								<td><button  name = "submit" value="removeSupply" class="btn btn-outline btn-primary btn-lg">Unassign this Supply</button></td>
         							
         							</tr>
         						</form>
           
        						</c:forEach>
           						</tbody>  
                           
                      
			</table>

                                 
                                        <h3>Supplies Inventory</h3>
                 <table id="suppliesGrid" class="table table-condensed table-hover table-striped" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th data-column-id="id" data-type="numeric" data-identifier="true" >Supply ID</th>
                                    <th>Supply Name</th>
                                    <th>Description</th>
                                    <!-- <th>SSN</th> -->
                                    <th>Quantity Assigned</th>
                                    <!-- <th>Age</th>
                                    <th>isAdmin</th> -->
                                </tr>
                            </thead>
                             <tbody>
                                
                                <c:forEach var="ea" items="${supplies}">
                                
                                 <form method = "POST">
         							<tr>
         							
         								<%-- <td  name ="id" value = "${wr.getWorkorderId()}">${wr.getWorkorderId()}</td> --%>
         								<td><input type = "long" name = "sid" value = "${ea.getId()}" readonly style="width: 46px; "></td>
         								<td id=workDes name = "supplyName">${ea.getSupplyName()}</td>
         								<td id=workPL name = "supplyDescription">${ea.getDescription()}</td>
         								<td id=workStatus name = "supplyQuantity">${ea.getQuantity()}</td> 
         								<td><button  name = "submit" value="assignSupplies" class="btn btn-outline btn-primary btn-lg">Assign this Supply</button></td>
         							
         							</tr>
         						</form>
           
        						</c:forEach>
           						</tbody>  
                           
                      
			</table>

<!--                                        <button type="button" class="btn btn-outline btn-primary btn-lg">Assign employees</button></a>
 -->                                    </div>
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
    /* $('#workorderGrid tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            var row = $('#workorderGrid').datagrid('getSelected');
    if (row){
     return row.index[0];
    }
     }
     }); */
 
} );
    </script>
    
    <script>
    var row = $('#tt').datagrid('getSelected');
    if (row){
    alert('Item ID:'+row.itemid+"\nPrice:"+row.listprice);
}</script>
    <script type="text/javascript">
    function getWorkId(){
        var id = document.getElementById('getWorkId').value;
        alert(id);
    }
</script>
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
${workorders} ${workOrderSelected} ${employees} 
</body>

</html>