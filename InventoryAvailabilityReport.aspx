<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="InventoryAvailabilityReport.aspx.cs" Async="true" Inherits="InventoryAvailabilityReport" %>

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
        Availability
        <small>Report</small>
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
        <table id="tblavareport" class="table no-margin">
            <thead>
                  <tr>
                      <th>Booking Id</th>
                      <th>MMOPL Code</th>
                      <th>TIML Code</th>
                      <th>Type</th>
                      <th>Sub Type</th>
                      <th>Location</th>
                      <th>Rate/Day</th>
                      <th>Length</th>
                      <th>Height</th>
                      <th>Area</th>
                  </tr>
                  </thead>
           <tr id="itemPlaceholder" runat="server"></tr>
        </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
            <td><a href="SalesBooking.aspx?pk=<%#Eval("bookingid")%>" ><%#Eval("bookingid")%></td>
            <td><a href="ItemMaster.aspx?pk=<%#Eval("MMOPLCode")%>" ><%#Eval("MMOPLCode")%></td>
            <td><%#Eval("TIMLCode")%></td>
            <td><%#Eval("type")%></td>
            <td><%#Eval("subtype")%></td>
            <td><%#Eval("loc")%></td>
            <td style="text-align:right"><%#Eval("rate")%></td>
            <td style="text-align:right"><%#Eval("Length")%></td>
            <td style="text-align:right"><%#Eval("Height")%></td>
            <td style="text-align:right"><%#Eval("Area")%></td>
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

