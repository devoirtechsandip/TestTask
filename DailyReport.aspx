<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="DailyReport.aspx.cs" Async="true" Inherits="DailyReport" %>

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
        Booking
        <small>Summary</small>
      </h1>
      
    </section>


    <!-- Main content -->
    <section class="content">
      
          <div class="row">
             
       
     <div class="col-md-2">
          <!-- small box -->
          
              <asp:TextBox runat="server" ID="txtstartdate" Width="85%" CssClass="form-control margin" placeholder="From Date" AutoCompleteType="Disabled"></asp:TextBox>
<cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtstartdate"></cc1:CalendarExtender>
          
        </div>
               <div class="col-md-2">
          <!-- small box -->
          
              <asp:TextBox runat="server" ID="txtEndDate" Width="85%" CssClass="form-control margin" placeholder="To Date"  AutoCompleteType="Disabled" ></asp:TextBox>
              <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="txtEndDate"></cc1:CalendarExtender>
          
        </div>
              <div class="col-md-2">
          <!-- small box -->
          
              <asp:DropDownList ID="ddlorderstatus" Width="85%" CssClass="form-control margin" runat="server">
                  <asp:ListItem>All</asp:ListItem>
                  <asp:ListItem>Complete</asp:ListItem>
                  <asp:ListItem>Incomplete</asp:ListItem>
                  </asp:DropDownList>
        </div>
               <div class="col-md-2">
          <!-- small box -->
          
              <asp:Button runat="server" ID="btnGenerate" Width="85%" CssClass="btn bg-olive margin" Text="Generate" OnClick="btnGenerate_Click"/>
          
        </div>
               <div class="col-md-2">
          <!-- small box -->
          
              <asp:Button runat="server" ID="btndownload" Width="85%" CssClass="btn bg-olive margin" Text="Download" OnClick="btndownload_Click"/>
          
        </div>
      </div>

          <div class="box box-info">
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
               <asp:ListView ID="lstdc" runat="server">
    <LayoutTemplate>
        <table id="tbldailyreport" class="table no-margin">
            <thead>
                  <tr>
                    <th>Sr.</th>
                    <th>Booking Id</th>
                      <th>Type</th>
                      <th>Start Date</th>
                      <th>End Date</th>
            <th>Agency</th>
            <th>Brand</th>
            <th>Client</th>
            <th>PO No</th>
            <th>Inventory/Package Code</th>
            <th>Type</th>
            <th>Card Rate</th>
            <th>Selling Rate</th>
            <th>Premimum / Discount</th>
                  </tr>
                  </thead>
           <tr id="itemPlaceholder" runat="server"></tr>
        </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
            <td style="text-align:center"><%#Eval("Row_Number")%></td>
            <td><a href="SalesBooking.aspx?pk=<%#Eval("bookingid")%>" ><%#Eval("bookingid")%></td>
            <td><%#Eval("bookingtype")%></td>
            <td><%#Eval("startdate")%></td>
            <td><%#Eval("enddate")%></td>
            <td><%#Eval("agency")%></td>
            <td><%#Eval("brand")%></td>
            <td><%#Eval("client")%></td>
            <td><%#Eval("pono")%></td>
            <td><%#Eval("code")%></td>
            <td><%#Eval("type")%></td>
            <td style="text-align:right" ><%#Eval("cardrate")%></td>
            <td style="text-align:right" ><%#Eval("sellingrate")%></td>
            <td style="text-align:right" ><%#Eval("premiunrate")%></td>
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
           
            <!-- /.box-footer -->
          </div>
		  </section>
</asp:Content>

