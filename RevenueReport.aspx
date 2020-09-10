<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="RevenueReport.aspx.cs" Async="true" Inherits="RevenueReport" %>

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
        Revenue
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
        <table id="tblrevreport" class="table no-margin">
            <thead>
                  <tr>
                      <th style="text-align:center">Seq. No.</th>
                    <th>Type</th>
      <th>Sub-Type</th>
      <th style="text-align:center">Units / Slots</th>
      <th style="text-align:center">Revenue Potential<br />(Rs. Lacs)</th>
      <th style="text-align:center">Revenue Generated<br />(Rs. Lacs)</th>
      <th style="text-align:center">% Achievement</th>
                  </tr>
                  </thead>
           <tr id="itemPlaceholder" runat="server"></tr>
        </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
           
            <td style="text-align:center"><%#Eval("seq")%></td>
           <td><%#Eval("type")%></td>
      <td><%#Eval("subtype")%></td>
      <td style="text-align:center"><%#Eval("unit")%></td>
      <td style="text-align:center"><%#Eval("ava")%></td>
      <td style="text-align:center"><%#Eval("Occ")%></td>
      <td style="text-align:center"><%#Eval("ach")%>%</td>
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

