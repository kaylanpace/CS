<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome to ConstructionPal</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


</head>

<body>

<br><br>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="home.jsp">ConstructionPal</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
              
                   <li>
                        <a href="login.jsp">LogIn</a>
                    </li>

                    
                
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('http://i59.tinypic.com/fkwizr.jpg');"></div>
                <div class="carousel-caption">
                   <!-- <h2>We are here for You</h2> -->
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://upwordstranslation.com/wp-content/uploads/2013/11/construction-work.jpg');"></div>
                <div class="carousel-caption">
                    <!-- <h2>We are here for You</h2> -->
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://canons.sog.unc.edu/wp-content/uploads/2014/01/construction-plans-and-hat.jpg');"></div>
                <div class="carousel-caption">
                    <!-- <h2>We are here for You</h2> -->
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>


    <!-- Page Content -->
    <div class="container">

      
        <!-- Features Section -->
        <div class="row">
              <div class="col-lg-12">
                <h1 class="page-header">
                    Welcome to ConstructionPal
                </h1>
            </div>
      
            <div class="col-md-6">
                <p>ConstructionPal features:</p>
                <ul>
                    <li><strong>Mobile and Tablet friendly settings</strong>
                    </li>
                    <li>Add Employees with corresponding priviledges</li>
                    <li>View Current and Completed Workorders</li>
                    <li>Change status of Workorders instantly</li>
                    <li>Use supplies in inventory</li>
                <br><br>
                </ul>
               
            </div>

        </div> 
        <!-- /.row -->
        
        <!-- Marketing Icons Section -->
        <div class="row">
      
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-mobile"></i> Mobile and Tablet Friendly</h4>
                    </div>
                    <div class="panel-body">
                        <p>ConstructionPal is mobile and tablet friendly, saving you time and resources as you can check the progress of a work order on the field.</p> <br>

                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-file-pdf-o"></i> Paperless Records and Billing</h4>
                    </div>
                    <div class="panel-body">
                        <p>All forms, including list of employees, current and completed orders will be saved in your account. There is an option to download forms to .pdf to print or email as needed.</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                      
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i> Easy to Use</h4>
                    </div>
                    <div class="panel-body">
                        <p>Navigating ConstructionPal is very easy. You can Contact Us anytime with questions visiting our Contact Page</p> <br>
                        <a href="contact.html" class="btn btn-default">Contact Us</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

 


        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; AlphaTech 2015</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>