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

    <title>ConstructionPal - Supplies</title>
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
                                                        <table id="example" class="display" cellspacing="0" width="100%">
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
         							
         								<%-- <td  name ="id" value = "${wr.getWorkorderId()}">${wr.getWorkorderId()}</td> --%>
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
                                                        
                                                        
                                                        <div class="well">
                                                            <div class="bs-example">
                                                                <ul class="nav nav-tabs">
                                                                    <li><a data-toggle="tab" href="#sectionA">Supply Information</a></li>
                                                                    
                                                                </ul>
                                                                <div class="tab-content">
<div id="sectionA" class="tab-pane fade in active">
                                   <div class = "panel panel-default">
                                     <h3>Supply Information</h3>
                                       <table style="width: 300px;" id="supplyInfoGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                                         <form method = "POST">
                                            <tr>
                                                <td><b>Supply ID</b></td>
                                                <td id= sId >${supplySelected.getId()}</td>
                                                
                                            </tr>
                                            <tr>
                                                <td><b>Description</b></td>
                                                <td><input style="width: 300px;" class="form-control" id = woDes style="width: 481px; " type="text" name="sDescription" value = "${supplySelected.getDescription()}" placeholder="description"></td>
                                                <%-- <td id= woDes style="width: 481px; ">${workOrderSelected.getDescription()}</td> --%>
                                            </tr>
                                            
                                            <tr>
                                                <td><b>Supply Name</b></td>
                                                <%-- <td id= woPL style="width: 481px; ">${workOrderSelected.getPriorityLevel()}</td> --%>
                                                <td><input style="width: 300px;" id= woPL  class="form-control"  type="text" name="sSupplyName" value = "${supplySelected.getSupplyName()}" placeholder="">
                                            
                                            </tr>
                                            <tr>
                                                <td><b>Point of Contact</b></td>
                                                <%-- <td id= woPL style="width: 481px; ">${workOrderSelected.getPriorityLevel()}</td> --%>
                                                <td><input style="width: 300px;" id= woPL  class="form-control"  type="text" name="sPoc" value = "${supplySelected.getPocName()}" placeholder="">
                                            
                                            </tr>
                                            <tr>
                                                <td><b>Quantity</b></td>
                                                <%-- <td id= woStatus style="width: 481px; ">${workOrderSelected.getStatus()}</td> --%>
                                                 <td>
                                            <input style="width: 300px;" id = woStatus  class="form-control"  type="integer"  name="sQuantity" value = "${workOrderSelected.getQuantity()}" placeholder="">
                                            
                                            </td>
                                            </tr>
                                            <tr>
                                            <td></td>
                       						 <td><button  name = "submit" value = "deleteRow"  class="btn btn-default">Delete</button>     
                       						 <button  name="submit" value="updateRow" class="btn btn-default">Update</button></td>
                       						 </td>
                       						 </tr>
                       					 </form>
                                            
                                      </table>
                                    </div>
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
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Add Supplies</a>
                                                    </h4>
                                                </div>
                                                <div id="collapseTwo" class="panel-collapse collapse">
                                                    <div class="panel-body">
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
        $('#workOrderGrid').dataTable();
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