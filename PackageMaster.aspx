<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="PackageMaster.aspx.cs" Async="true" Inherits="PackageMaster" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

     
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pagecontents" runat="Server">
    <section class="content-header">
      <h1>
        AD
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
              <h3 class="box-title">Create New Package</h3>
				<div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">	
				
				<div class="row">
					  
					 <div class="col-md-6 col-xs-12">
                         <label>Package Name:</label>
				 <div class="input-group">
                     
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                
					 <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Name" ></asp:TextBox>
					  
              </div>
						
						  </div>

					   <div class="col-md-6 col-xs-12">
              <div class="form-group">
                <label>Select Inventory:</label>&nbsp;&nbsp; <asp:LinkButton runat="server" ID="btndetails" OnClick="btndetails_Click" Text="<i class='fa fa-search'></i> " />
<asp:listbox ID="dditem" class="form-control select2"  SelectionMode="Multiple"  multiple="multiple" runat="server">
</asp:listbox>
              </div>
             
            </div>
					 </div>
               
				<br />
                <div class="row">
					 <div class="col-xs-12">
				 <div class="form-group">
                                   <label>Remarks:</label>                  
					 <asp:TextBox ID="txtUserComments" runat="server" TextMode="MultiLine" Rows="5"  CssClass="form-control"></asp:TextBox>
					  
                </div>
             
						  </div>
					 </div>
				
				<div class="row">
					 <div class="col-xs-6">
						 <asp:Button runat="server" ID="btnSubmit" UseSubmitBehavior="false" OnClientClick="this.disabled=true;" CssClass="btn bg-olive margin" Text="Create" OnClick="btnSubmit_Click" ValidationGroup="vgregister"/>
					 <asp:Button runat="server" ID="btnUpdate" UseSubmitBehavior="false" OnClientClick="this.disabled=true;" CssClass="btn bg-olive margin" Text="Update" OnClick="btnUpdate_Click" ValidationGroup="vgregister"/>
                         <asp:Button runat="server" ID="btndelete" UseSubmitBehavior="false" OnClientClick="this.disabled=true;" CssClass="btn bg-olive margin" Text="Delete" OnClick="btndelete_Click" ValidationGroup="vgregister"/>
                         <asp:HiddenField ID="hfpk" runat="server"></asp:HiddenField>
                </div>
				 <br />

              <!-- /input-group -->
            </div>
            <!-- /.box-body -->
          </div>
              </div>
          <!-- /.Search Criteria -->


			
				 </div>

		 <!--Right Side -->
		  <div class="col-md-6">

     
      <!-- TABLE: Search Result -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Group List</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
				  
				  <asp:ListView ID="lvBucket" runat="server" DataKeyNames="pk" OnItemCommand="ListView1_ItemCommand">
    <LayoutTemplate>
        <table id="tblpackage" class="table no-margin">
            <thead>
                  <tr>
                      <th></th>
                      <th>Package Name</th>
                    <th>Inventory Name</th>
                    
                  </tr>
                  </thead>
           <tr id="itemPlaceholder" runat="server"></tr>
        </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
            <td><asp:LinkButton runat="server" ID="btnview" Text="View" CommandName="viewdata" CommandArgument='<%#Eval("pk")%>' CssClass="btn"/></td>
            <td style="width:30%"><%#Eval("packagename")%></td>
			<td><%#Eval("Inventory")%></td>
			
        </tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        <h2>
            No Records!</h2>
    </EmptyDataTemplate>
</asp:ListView>
				 
              </div>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
             <%-- <a href="#" class="btn btn-sm btn-info btn-flat pull-left">Create New</a>--%>
              
				
            	
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.Search Result -->
				 </div>
			<!-- /.Right Side -->
		  </div>

		  </section>
   
    <asp:Button ID="Button3" runat="server" style="display:none" ></asp:Button>
    <cc1:ModalPopupExtender ID="ModalPopupExtender3" BehaviorID="mpb" runat="server"
    PopupControlID="Panel2" TargetControlID="Button3" BackgroundCssClass="modalBackground" CancelControlID="Button4">
</cc1:ModalPopupExtender>
<asp:Panel ID="Panel2" runat="server" CssClass="modalPopup details" Style="display: none; height:90%" ScrollBars="Both">
    <div class="header">
        <asp:Label ID="Label2" runat="server"></asp:Label> Details
    </div>
    <div class="body">
        <div class="row">
                <div class="col-md-12 col-xs-12">
                
                         <asp:ListView ID="ListView2" runat="server"  DataKeyNames="pk" OnItemCommand="ListView2_ItemCommand">
    <LayoutTemplate>
        <table id="tblitemsearch" class="table no-margin">
            <thead>
                  <tr>
                      <th></th>
                      <th>MMOPL Code</th>
                    <th>TIML Code</th>  
                    <th>Type</th>
                      <th>Location</th>
                      <th>Rate/day</th>
                      
                  </tr>
                  </thead>
           <tr id="itemPlaceholder" runat="server"></tr>
        </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
            <td><asp:LinkButton runat="server" ID="btnview" Text="Select" CommandName="viewdata" CommandArgument='<%#Eval("pk")%>' CssClass="btn"/></td>
            <td><%#Eval("MMOPLCode")%></td>
			<td><%#Eval("TIMLCode")%></td>
            <td><%#Eval("type")%></td>
                <td><%#Eval("loc")%></td>
            <td><%#Eval("rate")%></td>
        </tr>
    </ItemTemplate>
    <EmptyDataTemplate>
        <h2>
            No Records!</h2>
    </EmptyDataTemplate>
</asp:ListView>

                </div>
               
    </div>
       
        </div>
    <div class="footer">
        <div class="col-md-offset-4 col-md-4 col-xs-12">
        <asp:Button ID="Button4" runat="server" Text="Close" CssClass="btn btn-default"></asp:Button>
            </div>
    </div>
</asp:Panel>

</asp:Content>

