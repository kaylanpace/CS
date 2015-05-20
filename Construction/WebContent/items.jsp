<%@page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,items.Items,employee.Employee"%>
<%@page import="java.util.*,supplies.Supplies"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
    <head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ConstructionPal - Add Workorder Item</title>

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
<a href="/Construction/admin-viewWorkOrders" > Back to all Workorders</a>
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Add Items</h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->       
        <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Item information
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" method="POST" action="items" style="width: 630px; ">
                                   
                                    <label>Supply Name</label>
									<select class="form-control"  name = "combobox" value = "${databaseValue}" style="width: 347px;">
										<c:forEach 
										items="${sName}" var="databaseValue">
										<option  selected = 'selected'> </option>
											<option name = "selected" value= "${databaseValue}"> ${databaseValue} </option> 
                      					</c:forEach>
                      					<%-- <c:forEach 
										items="${supplies}" var="databaseValue">
											<option value= ${databaseValue.supplyName}> ${databaseValue} </option> 
                      					</c:forEach> --%>
                       </select>
                       <button  name = "submit" value="delete" class="btn btn-default">Delete</button>
                       <button  name = "submit" value="select" class="btn btn-default">Select</button>
                       
                       
                      
									<div class="form-group">
                                            <label>Supply Id</label>
                                            <input class="form-control" type="integer" name="SupplyId" value = "${supplyId}"placeholder="Supply Id">
                                        </div>
                                        <div class="form-group">
                                            <label>Item Name</label>
                                            <input class="form-control" type="text" name="itemName" value = '${supplyName}' placeholder="Item Name">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Assigned Qty</label>
                                            <input class="form-control" type="number" value = '0' name="assignedQty" placeholder="">
                                        </div>
                                       
                                        <div class="form-group">
                                            <label for="dp">Remaining Qty</label>
                                            <input class="form-control" type="number" value = '0' name="remainingQty" placeholder="">
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
         
            
            
            <table id="itemsGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                    	<th>Item Id</th>
                        <th>Item Name</th>
                        <th>Assigned Quantity</th>
                        <th>Remaining Quantity</th>
                    </tr>
                </thead>
               
                    <%
                      @SuppressWarnings("unchecked")
                      List<Items> items = (List<Items>)request.getAttribute("items");
                       if (items != null) {
                        for (Items item : items) {
                      
                      %>
                      <tr>
                        <td>
                            <%= item.getId() %> 
                        </td>
                        <td>
                        	<%= item.getItemName() %>
                        </td>
                        <td>
                            <%= item.getAssignedQty() %>
                        </td>
                        
                        <td>
                            <%= item.getRemainingQty() %>
                        </td>
                        <td>
                              ${selected} 
                        </td>
                        <td>
                              ${id} 
                        </td>
                        <td>
                              ${name} 
                        </td>
                      </tr>
                      <%
                       }
                      %>
                      
                      <%
                       }
                      %>
            </table>
            
            <table id="suppliesGrid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>Supply Name</th>
                        <th>Quantity</th>
                        <th>Description</th>
                        <th>Expiration Date</th>
                        <th>Check Cycle</th>
                    </tr>
                </thead>
               
                    <%
                      @SuppressWarnings("unchecked")
                      List<Supplies> sup = (List<Supplies>)request.getAttribute("supplies");
                       if (sup != null) {
                        for (Supplies supplies : sup) {
                      
                      %>
                      <tr>
                        <td>
                            <%= supplies.getSupplyName() %>
                        </td>
                        <td>
                            <%= supplies.getQuantity() %>
                        </td>
                       
                        <td>
                            <%= supplies.getDescription() %>
                        </td>
                        <td>
                            <%= supplies.getExpirationDate() %>
                        </td>
                        
                        <td>
                            <%= supplies.getCheckCycle() %>
                        </td>
                      </tr>
                      <%
                       }
                      %>
                      <%
                       }
                      %>
            </table>
            
            


            <table id="itemsGrid" name = "grid" class="table table-striped table-bordered" cellspacing="0" width="100%">
                <thead>
                    <tr>
                    	<th>Item Id</th>
                        <th>Item Name</th>
                        <th>Assigned Quantity</th>
                        <th>Remaining Quantity</th>
                    </tr>
                </thead>
               
                    <%
                      @SuppressWarnings("unchecked")
                      List<Items> tems = (List<Items>)request.getAttribute("tems");
                       if (items != null) {
                        for (Items item : items) {
                      
                      %>
                      
                      <tr>
                      
                        <td>
                             <input class="form-control" type="number" name="gridItemId" value = <%= item.getId() %> readonly>
                        </td>
                        <td>
                        	<input class="form-control" type="text" name="gridItemName" value = "<%= item.getItemName() %>  " placeholder="Item Name">
                        </td>
                        <td>
                            <input class="form-control" type="int" value = "<%=item.getAssignedQty()%>  " name="assignedQ" placeholder="">
                        </td>
                        
                        <td>
                            <input class="form-control" type="int" value = "<%=item.getRemainingQty()%>  " name="remainingQ" placeholder="">
                        </td>
                        <td>
                              update 
                        </td>
                        <td>
                             <button   name = "submit" value = 'deleteRow'  class="btn btn-default">delete</button>
                        </td>
                        
                      </tr>
                     
                      <%
                       }
                      %>
                      
                      <%
                       }
                      %>
            </table>
		<hr><ol> <%
            @SuppressWarnings("unchecked") 
            List<Employee> employees = (List<Employee>)request.getAttribute("employees");
            if (employees != null) {
                for (Employee employee : employees) { %>
                    <li> <%= employee %> </li> <%
                }
            } %>
        </ol><hr>
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
        $('#itemsGrid').dataTable();
    } );
    </script>
        
    </body>
 </html>
