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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
    <script src="browser_components/datatables/media/js/jquery.dataTables.min.js"></script>

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
/* 		function clearVals(){
		document.getElementById("woId").innerHTML = "";
 document.getElementById("woDes").innerHTML = "";
 document.getElementById("woPL").innerHTML = "";
 document.getElementById("woStatus").innerHTML = " "; */
		}
	</script>
	<script text="text/javascript">
/* function getTdValue() {
 var wwwwId = document.getElementById("workId").innerHTML;
 var wwwwDes = document.getElementById("workDes").innerHTML;
 var wwwwPL = document.getElementById("workPL").innerHTML;
 var wwwwStatus = document.getElementById("workStatus").innerHTML;
 
 document.getElementById("woId").innerHTML = wwwwId;
 document.getElementById("woDes").innerHTML = wwwwDes;
 document.getElementById("woPL").innerHTML = wwwwPL;
 document.getElementById("woStatus").innerHTML = wwwwStatus;
 alert(wwwwId);
} */
</script>
    
    
    
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
                <a class="navbar-brand" href="dashboard">ConstructionPal</a>
                
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            	<li><a href="login"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="admin-dashboard"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
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
                    <img src="ConstructionPal.jpg" height="75" width="200">
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
                                                        
                                                        
                                                        <div class="well">
                                                            <div class="bs-example">
                                                                <ul class="nav nav-tabs">
                                                                    <li><a data-toggle="tab" href="#sectionA">Work Order Information</a></li>
                                                                    <li><a data-toggle="tab" href="#sectionB">Assigned Employees</a></li>
                                                                    <li><a data-toggle="tab" href="#sectionC">Assigned Supplies</a></li>
                                                                    <li><a data-toggle="tab" href="#sectionD">Building Information</a></li>
                                                                    <li><a data-toggle="tab" href="#sectionE">Point of Contact</a></li>
                                                                </ul>
                                                                <div class="tab-content">
<div id="sectionA" class="tab-pane fade in active">
                                   <div class = "panel panel-default">
                                     <h3>Work Order Information</h3>
                                       <table id="workOrderInfoGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                         <form method = "POST">
                                            <tr>
                                                <td><b>Work Order ID</b></td>
                                                <td id= woId >${workOrderSelected.getWorkorderId()}</td>
                                                
                                            </tr>
                                            <tr>
                                                <td><b>Description</b></td>
                                                <td><input style="width: 300px;" class="form-control" id = woDes style="width: 481px; " type="text" name="woDescription" value = "${workOrderSelected.getDescription()}" placeholder="description"></td>
                                                <%-- <td id= woDes style="width: 481px; ">${workOrderSelected.getDescription()}</td> --%>
                                            </tr>
                                            
                                            <tr>
                                                <td><b>Priority Level</b></td>
                                                <%-- <td id= woPL style="width: 481px; ">${workOrderSelected.getPriorityLevel()}</td> --%>
                                                <td><select style="width: 300px;" id= woPL  class="form-control"  type="text" name="woPriorityLevel" value = "${workOrderSelected.getPriorityLevel()}" placeholder="">
                                            <option value = "${workOrderSelected.getPriorityLevel()}"> ${workOrderSelected.getPriorityLevel()} </option>
                                            <option value = "Low">Low</option>
                                            <option value = "High">High</option>
                                            </select></td>
                                            </tr>
                                            <tr>
                                                <td><b>Status</b></td>
                                                <%-- <td id= woStatus style="width: 481px; ">${workOrderSelected.getStatus()}</td> --%>
                                                 <td>
                                            <select style="width: 300px;" id = woStatus  class="form-control"  type="text"  name="woStatus" value = "${workOrderSelected.getStatus()}" placeholder="">
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
                            				<input style="width: 300px;" id = woExpectedFinish  class="form-control" type="date" id = "dp" name="woExpectedFinish" value = "${workOrderSelected.getExpectedFinish()}"    placeholder="date">
                       						 </td>
                       						 </tr>
                       						 <tr>
                       						 <td><b>Finish Date</b></td>
                                             <td><input style="width: 300px;" id = woFinishDate  class="form-control" type="date" id = "dp1" name="woFinishDate" value = "${workOrderSelected.getFinishDate()}"    placeholder="date"></td>
                       						 </tr>
                       						 <tr>
                       						 <td> </td>
                       						 <td>
                       						 <button   name = "submit" value = "deleteRow"  class="btn btn-default">Delete</button>     
                       						 <button   name="submit" value="updateRow" class="btn btn-default">Update</button>
                       						 </td>
                       						 </tr>
                       					 </form>
                                            
                                      </table>
                                    </div>
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
         								<td><button  type = "submit" name = "submit"  value="removeWorker" class="btn btn-outline btn-primary btn-lg">Unassign Worker</button></td>
         							
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
                                
                                <form method = "POST" >
         							<tr>
         							
         								<%-- <td  name ="id" value = "${wr.getWorkorderId()}">${wr.getWorkorderId()}</td> --%>
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

<!--                                        <button type="button" class="btn btn-outline btn-primary btn-lg">Assign employees</button></a>
 -->                                    </div>
                                    
                                    
                                    
                                    
                                    
                                    
<div id="sectionC" class="tab-pane fade">
                           <h3>Assigned Supplies</h3>
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
           <div id="sectionD" class="tab-pane fade">
                                                                        <h3>Building Information</h3>
                                                                        <table id="workOrderInfoGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                                                            <thead>
                                                                                <tr>
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
         																		<td><button  name = "submit" value="assignBuilding" class="btn btn-outline btn-primary btn-lg">Assign to Building</button></td>
         							
         							</tr>
         						</form>
           
        						</c:forEach>
                                                                              </tbody>
                                                                        </table>

                                                                    </div>
                                                                    <div id="sectionE" class="tab-pane fade">
                                                                        <h3>Point of Contact</h3>
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

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>    
                                                    </div>                                                  
                                                </div>
                                            </div>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Add Work Orders</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="panel-body">
                                                        <form role="form" method="POST" action="workorder">
                                                            <div class="form-group">
                                                                <label>Priority Level</label>
                                                                <select class="form-control" id = "theinput" type="text" onChange = "combo(this,'theinput’)" name="priorityLevel" placeholder="">
                                                                <option> </option>
                                                                <option>Low</option>
                                                                <option>High</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Status</label>
                                                                <select class="form-control" id = "theinput" type="text" onChange ="combo(this,'theinput’)"  name="status" placeholder="">
                                                                <option></option>
                                                                <option>Not Started</option>
                                                                <option>Started</option>
                                                                <option>Cancelled</option>
                                                                <option>Finished</option>
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
                                                                <TextArea class="form-control" type="text" name="comments" placeholder="optional text here"></TextArea>
                                                            </div>
                                                            <button type="submit" name = "submit" value="Add" class="btn btn-default">Submit</button>
                                                            <button type="reset" class="btn btn-default">Reset</button>
                                                            
                                                            <!-- DatePicker JavaScript -->
                                                            <script src="js/jquery.min.js"></script>
                                                            <script src="js/jquery-ui.min.js"></script>
                                                            <script src="js/bootstrap.min.js"></script>

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
    
    <!-- DataTables JavaScript -->
    <script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script> 

    <!-- Dynamic Table JavaScript -->
    <script>
    $(document).ready(function() {
        $('#workOrderGrid').dataTable();
    } );
    </script>
     <script>
      $( "#dp" ).datepicker({
	changeMonth: true,

	dateFormat: 'mm-dd-yy'
	});
    </script>
    <script>
      $( "#dp1" ).datepicker({
	changeMonth: true,

	dateFormat: 'mm-dd-yy'
	});
    </script>
    
    <script>
    var row = $('#tt').datagrid('getSelected');
    if (row){
        alert('Item ID:'+row.itemid+"\nPrice:"+row.listprice);
    }
    </script>
    
<!--     <script type="text/javascript">
    function getWorkId(){
        var id = document.getElementById('getWorkId').value;
        alert(id);
    }
    </script>
     -->

	<!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>