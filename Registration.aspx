<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
                    <asp:Label runat="server" ID="lblErrormessage" Text="" ForeColor="Red"></asp:Label>
                    <div class="form-group has-feedback">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidat" runat="server" ErrorMessage="User name is required." ControlToValidate="txtUserName" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>

                        <asp:TextBox ID="txtUserName" type="text" class="form-control" placeholder="User Name" runat="server"></asp:TextBox>

                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="First Name is required." ControlToValidate="txtFName" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtFName" type="text" class="form-control" placeholder="First Name" runat="server"></asp:TextBox>

                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Last Name is required." ControlToValidate="txtLName" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtLName" type="text" class="form-control" placeholder="Last Name" runat="server"></asp:TextBox>

                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Last Name is required." ControlToValidate="txtEmail" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtEmail" type="text" class="form-control" placeholder="Email ID" runat="server"></asp:TextBox>

                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password is required." ControlToValidate="txtpasword" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtpasword" type="text" class="form-control" placeholder="Password" runat="server"></asp:TextBox>

                        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                    </div>

                    <div class="form-group has-feedback">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Password is not match." ControlToValidate="txtpasword" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtcpassword" type="password" class="form-control" placeholder="Confirm Password" runat="server"></asp:TextBox>

                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                    <div class="row" align="left">
                        <div class="col-xs-4">
                            <asp:Button ID="btnsignup" runat="server" Text="Sign Up"
                                class="btn btn-primary btn-block btn-flat" Style="padding: 0 0 0 0" OnClick="btnsignup_Click" />

                        </div>

                        <div class="row" align="left">
                            <div class="col-xs-4">
                                <asp:LinkButton ID="lnkblogin" CausesValidation="false" runat="server" class="btn btn-primary btn-block btn-flat" Style="padding: 0 0 0 0" PostBackUrl="~/Login.aspx">Have an account? Login</asp:LinkButton>


                            </div>
                            <div class="col-xs-8 text-right no-padding">
                                <img src="dist/img/flow.png" width="66px" height="25px" />
                            </div>
                        </div>

                        <!-- /.social-auth-links -->

                    </div>
                    <!-- /.login-box-body -->
                </div>
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
