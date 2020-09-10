<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FogotPassword.aspx.cs" Inherits="FogotPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
        name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/square/blue.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
    <div>
        <div class="login-box">
            <div class="login-logo">
                <a href="">Mumbai Metro One Ad-Track</a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">
                    Fogot Password</p>
                <form action="../../index2.html" method="post">
                <div class="form-group has-feedback">
                    <asp:TextBox ID="txtUserName" type="text"  class="form-control" placeholder="Enter Login Id" runat="server"></asp:TextBox>
                    
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
               
                <div class="row" align="left">
                <div class="col-xs-4" >
                <asp:Button ID="btnLogin" runat="server" Text="Send Password" 
                        class="btn btn-primary btn-flat" onclick="btnLogin_Click"/>  
                  
                </div>
                    
                </div>
                </form>
                <!-- /.social-auth-links -->
                
            </div>
            <!-- /.login-box-body -->
        </div>
        <!-- /.login-box -->
        <!-- jQuery 2.2.3 -->
        <script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="../../bootstrap/js/bootstrap.min.js"></script>
        <!-- iCheck -->
        <script src="../../plugins/iCheck/icheck.min.js"></script>
    </div>
    </form>
</body>
</html>
