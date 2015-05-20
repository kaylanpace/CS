<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,employee.Employee, employee.EmployeeDao"%>
<%@page import="java.util.*,workorder.WorkOrder"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<html>
    <head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ConstructionPal - View All Employees</title>

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
 
    <body>    

    <!-- Page Content -->
    <div class="container">
		<a href="/Construction/admin-dashboard.jsp" > Back to Dashboard</a><br>
		<a href="/Construction/employee.jsp" > Add a new Employee</a>
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">View All Employees</h1>
            </div>
        </div>
        <!-- /.row -->


        <!-- Content Row -->       
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Edit Employee Information
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                
                                  <table id="itemsGrid" name = "grid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                    	<th>Employee Id</th>
                        <th style="width: 155px; ">Employee First Name</th>
                        <th style="width: 155px; ">Employee Last Name</th>
                        <th style="width: 155px; ">Position</th>
                        <th style="width: 155px; ">Age</th>
                    </tr>
                </thead>
               
                    <%
                      @SuppressWarnings("unchecked")
                      List<Employee> employees = (List<Employee>)request.getAttribute("employees");
                       if (employees != null) {
                        for (Employee emps : employees) {
                      
                      %>
                      
                      <tr>
                      <form method="POST">
                        <td>
                             <input class="form-control" type="long" name="employeeId" value = <%= emps.getEmpId() %> readonly>
                        </td>
                        <td>
                        	<input class="form-control" type="text" name="employeeFirstName" value = "<%=emps.getEmpFirstName()%>" placeholder="First Name">
                        </td>
                        <td>
                        	<input class="form-control" type="text" name="employeeLastName" value = "<%=emps.getEmpLastName()%>" placeholder="Last Name">
                        </td>
                        <td>
                        <select class= "form-control" name = "employeePosition" type = "text" value = "<%=emps.getPosition()%>">
                        					<option value = "<%=emps.getPosition()%>"><%=emps.getPosition()%></option>
											<option value ="Worker">Worker</option>
											<option value ="Supervisor">Supervisor</option>
											<option value ="Administrator">Administrator</option>
 <!-- ? -->				</select>
						 </td>
                        <td>
                            <input class="form-control" type="integer" name="employeeAge" value = <%= emps.getAge() %>   placeholder="">
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
        $('#employeeGrid').dataTable();
    } );
    </script>
        
    </body>
 </html>