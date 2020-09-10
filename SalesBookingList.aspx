<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="SalesBookingList.aspx.cs" Async="true" Inherits="SalesBookingList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pagecontents" runat="Server">

    <!-- Main content -->
    <section class="content">
      <div class="row">
		 <!--Right Side -->
		  <div class="col-md-12">

     
      <!-- TABLE: Search Result -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Booking List</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
				  
				  <asp:ListView ID="lvBucket" runat="server" OnItemCommand="lvBucket_ItemCommand">
    <LayoutTemplate>
        <table id="tblsalesbooking" class="table no-margin">
            <thead>
                  <tr>
                      <th>Booking Id</th>
                    <th>Booking Type</th>
                    <th>Start Date</th>
<th>End Date</th>
<th>Agency</th>
                      <th>Brand</th>
                      <th>Client</th>
                      <th>Po No</th>
      <th>Inventory /Package</th>
      <th>Card Rate</th>
      <th>Selling Rate</th>
      <th>Premium /Discount</th>
                      <th>Creative Approve</th>
                      
                  </tr>
                  </thead>
           <tr id="itemPlaceholder" runat="server"></tr>
        </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
            <td><asp:LinkButton runat="server" ID="LinkButton1" Text='<%#Eval("bookingid")%>' CommandName="viewdata" CommandArgument='<%#Eval("bookingid")%>' CssClass="btn"/></td>
			<td><%#Eval("bookingtype")%></td>
			<td><%#Eval("startdate")%></td>
            <td><%#Eval("enddate")%></td>
            <td><%#Eval("agency")%></td>
            <td><%#Eval("brand")%></td>
            <td><%#Eval("client")%></td>
            <td><%#Eval("pono")%></td>
          <td><%#Eval("code")%></td>
          <td style="text-align:right" ><%#Eval("cardrate")%></td>
          <td style="text-align:right"><%#Eval("sellingrate")%></td>
          <td style="text-align:right"><%#Eval("premiunrate")%></td>
            <td><%#Eval("creativeapp")%></td>
            
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
</asp:Content>

