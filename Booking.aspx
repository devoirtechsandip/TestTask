<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Async="true" Inherits="Booking" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="ECalendar" Namespace="ExtendedControls" Assembly="EventCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pagecontents" runat="Server">
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">

     
        <!-- /.box-header -->
      
         
	 <!-- TABLE: Search Criteria -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Add Booking</h3>
				<div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">	
				 <div class="col-md-12">
          <ECalendar:EventCalendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Silver"
            BorderWidth="1px" Font-Names="Verdana"
            Font-Size="9pt" ForeColor="Black" Height="500px"
            Width="100%" FirstDayOfWeek="Monday" NextMonthText="Next &gt;" PrevMonthText="&lt; Prev"  ShowGridLines="True" NextPrevFormat="ShortMonth" 
            ShowDescriptionAsToolTip="True" BorderStyle="Solid" EventDateColumnName="" EventDescriptionColumnName="" EventHeaderColumnName="" OnSelectionChanged="Calendar1_SelectionChanged">
            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
            <TodayDayStyle BackColor="#CCCCCC" />
            <SelectorStyle BorderColor="#404040" BorderStyle="Solid" />
            <DayStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom" />
            <DayHeaderStyle BorderWidth="1px" Font-Bold="True" Font-Size="8pt" />
            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True"
                Font-Size="12pt" ForeColor="#333399" HorizontalAlign="Center" VerticalAlign="Middle" />
        </ECalendar:EventCalendar>
        </div>
          </div>
              </div>
          <!-- /.Search Criteria -->


			
				 </div>

		
		  </div>

          <div class="row">
        <!-- left column -->
        <div class="col-md-12">

     
        <!-- /.box-header -->
      
         
	 <!-- TABLE: Search Criteria -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Details</h3>
				<div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">	
				 <div class="col-md-12">
         <asp:ListView ID="lvBucket" runat="server" OnItemCommand="lstsubinventory_ItemCommand">
    <LayoutTemplate>
        <table class="table no-margin">
            <thead>
                  <tr>
                      <th>Booking Id</th>
                    <th>Booking Type</th>
                    <th>Start Date</th>
<th>End Date</th>
<th>Agency</th>
                      <th>Brand</th>
                      <th>Client</th>
                      <th>Po. No.</th>
                  </tr>
                  </thead>
           <tr id="itemPlaceholder" runat="server"></tr>
        </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
            <td><%#Eval("bookingid")%>&nbsp; <asp:LinkButton runat="server" ID="btnRun"  CommandName="View" CommandArgument='<%#Eval("bookingid")%>' Text="<i class='fa fa-info-circle'></i> " /></td>
			<td><%#Eval("bookingtype")%></td>
			<td><%#Eval("startdate")%></td>
            <td><%#Eval("enddate")%></td>
            <td><%#Eval("agency")%></td>
            <td><%#Eval("brand")%></td>
            <td><%#Eval("client")%></td>
            <td><%#Eval("pono")%></td>
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
          <!-- /.Search Criteria -->


			
				 </div>

		
		  </div>
		
        <asp:Button ID="btnmodal" runat="server" style="display:none" ></asp:Button>
                 <cc1:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
    PopupControlID="pnlPopup" TargetControlID="btnmodal" BackgroundCssClass="modalBackground" CancelControlID="btnclose">
</cc1:ModalPopupExtender>
<asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup details" Style="display: none" ScrollBars="Both">
    <div class="header">
        <asp:Label ID="lbldoc" runat="server"></asp:Label> Details
    </div>
    <div class="body">
        <div class="row">
                <div class="col-md-12 col-xs-12">
                  <asp:ListView ID="lstdetails" runat="server" OnItemCommand="lstsubinventory_ItemCommand">
                            <LayoutTemplate>
                    <table class="table table-bordered">
                <tr>
                  <th style="width: 10px">#</th>
                  <th>Inventory Code</th>
                  <th>Card Rate</th>
                  <th>Selling Rate</th>
                    <th>Premium Discount Rate</th>
                </tr>
               <tr id="itemPlaceholder" runat="server"></tr>
              </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                 <tr>
                                     <td scope="row"><%#Eval("row_num")%></td>
                                     <td><%# Eval("code") %></td>
                                     <td><%# Eval("cardrate") %></td>
                                     <td><%# Convert.ToDouble(Eval("sellingrate")).ToString("#.##")%></td>
                                     <td><%# Convert.ToDouble(Eval("premiumdisc")).ToString("#.##")%></td>
                                 </tr>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <h2>No Records!</h2>
                            </EmptyDataTemplate>
                        </asp:ListView>
                </div>
               
    </div>
       
        </div>
    <div class="footer">
        <div class="col-md-offset-4 col-md-4 col-xs-12">
        <asp:Button ID="btnclose" runat="server" Text="Close" CssClass="btn btn-default"></asp:Button>
            </div>
    </div>
</asp:Panel>
		  </section>


</asp:Content>

