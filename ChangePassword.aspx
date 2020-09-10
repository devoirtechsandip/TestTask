<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Async="true" Inherits="ChangePassword" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
		.tableRadio {
			min-height: 20px;
			padding-left: 20px;
			margin-bottom: 0;
			font-weight: 400;
			cursor: pointer;
			position: relative;
			display: block;
			margin-top: 10px;
			margin-bottom: 10px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pagecontents" runat="Server">
    <section class="content-header">
      <h1>
        Mumbai Metro One Ad-Track
      </h1>
      
    </section>


	<!-- Main content -->
	<section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">

     
        <!-- /.box-header -->
      
         
	 <!-- TABLE: Search Criteria -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Change Password</h3>
				<div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">	
				<div class="row">
					  
					 <div class="col-xs-6">
                         <label>Old Password:</label>
				 <div class="input-group">
                     
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                
					 <asp:TextBox runat="server" ID="txtoldpwd" CssClass="form-control" placeholder="Old Password" ></asp:TextBox>
					  
              </div>
						  </div>

					  				

					 </div>

				 <br />


				 <div class="row">
                     <div class="col-xs-6">
                          <label>New Password:</label>
				 <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                
					 <asp:TextBox runat="server" ID="txtnewpassword" CssClass="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>
              </div>
						  </div>
					  <div class="col-xs-6">
                          <label>Confirm Password:</label>
				 <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-mobile"></i></span>
                
					  <asp:TextBox runat="server" ID="txtconfpassword" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
              </div>
						  </div>
					 </div>
                <br />
				<div class="row">
					 <div class="col-xs-6">
						 <asp:Button runat="server" ID="btnSubmit" UseSubmitBehavior="false" OnClientClick="this.disabled=true;" CssClass="btn bg-olive margin" Text="Create" OnClick="btnSubmit_Click" />
				</div>
                </div>
            </div>
          </div>
				 </div>		
		  </div>
		  </section>
</asp:Content>

