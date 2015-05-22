<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,workorder.WorkOrder"%>
<%@page import="java.util.*,employee.Employee"%>
 
<%--  <%@page import="javax.ejb.EJB" %>
<%@page import ="javax.servlet.*"%>
<%@page import ="javax.servlet.annotation.WebServlet"%>
<%@page import ="javax.servlet.http.HttpServlet"%>
<%@page import ="javax.servlet.http.HttpServletRequest"%>
<%@page import ="javax.servlet.http.HttpServletResponse"%>
<%
String servletParam = "workorder" ;
request.setParameter("servletParam",servletParam);
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>
   
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ConstructionPal - Add Work Order</title>

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

        <!-- Page Heading/Breadcrumbs -->
        <a href="/Construction/admin-viewWorkOrders.jsp" > Back to Dashboard</a><br>
       <!-- <a href="/Construction/viewAllWorkorders.jsp" > Back to all Work-Orders</a> -->
                       
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add Work Order</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->       
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Work order information
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
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
                                            <label for = "dp">Expected Finish</label>
                                            <input class="form-control" type="date" id = "dp" name="expectedFinish" placeholder="Format: MM-dd-yyyy">
                                        </div>
                                        <div class="form-group">
                                            <label>Description</label>
                                            <TextArea class="form-control" type="text" name="description" placeholder="" style="height: 93px; "></TextArea>
                                        </div>
                        
                                        <div class="form-group">
                                            <label>Comments</label>
                                            <TextArea class="form-control" type="text" name="comments" placeholder=""></TextArea>
                                        </div>
                                        
                                         
                        	
                        </td>
                                        </div>
                                        <button type="submit" name = "submit" value="Add" class="btn btn-default">Submit</button>
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
           
<script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
      $( "#dp" ).datepicker({
changeMonth: true,

dateFormat: 'mm-dd-yy'
});
    </script>
            <table id="workorderGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                    <!-- 
                        <th>Work Order ID</th>
                        <th>Building ID</th>
                        -->
                        <th>Description</th>
                        <th>Priority Level</th>
                        <th>Status</th>
                        <th>Comments</th>
                        <th>Expected Finish</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <!-- 
                        <th>Work Order ID</th>
                        <th>Building ID</th>
                        -->
                     
                    </tr>
                </tfoot>

                      <%
                          @SuppressWarnings("unchecked")
                          List<WorkOrder> workorders =   (List<WorkOrder>)request.getAttribute("workorders") ; 
                           if (workorders != null) {
                            for (WorkOrder workorder : workorders) {
                          %>
                      
                      <tr>
                      <form method="POST">
                        <td>
                             <input class="form-control" type="long" name="woId" value = <%= workorder.getWorkorderId() %> readonly>
                        </td>
                        <td>
                        	<input class="form-control" type="text" name="woDescription" value = "<%=workorder.getDescription()%>" placeholder="description">
                        </td>
                        <td>
                        <select class="form-control"  type="text"  name="woStatus" value = "<%=workorder.getStatus()%>" placeholder="">
                                            <option value ="<%=workorder.getStatus()%>"> <%=workorder.getStatus()%> </option>
                                            <option value = "Not Started">Not Started</option>
                                            <option value = "Started">Started</option>
                                            <option value = "Cancelled">Cancelled</option>
                                            <option value = "Finished">Finished</option>
                                            </select>
                        </td>
                        <td>
                        <select class="form-control"  type="text" name="woPriorityLevel" value = "<%=workorder.getPriorityLevel()%>" placeholder="">
                                            <option value = "<%=workorder.getPriorityLevel()%>"> <%=workorder.getPriorityLevel()%> </option>
                                            <option value = "Low">Low</option>
                                            <option value = "High">High</option>
                                            </select>
                        </td>                   
                        <td>
                            <input class="form-control" type="date" id = "dp" name="woExpectedFinish" value = "<%=workorder.getExpectedFinish()%>"placeholder= "date"  >
                        </td>
                        <td>
                            <input class="form-control" type="date" id = "dp1" name="woFinishDate" value = <%= workorder.getFinishDate() %>   placeholder="date">
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
        $('#workorderGrid').dataTable();
    } );
    </script>
     
    </body>
 </html>