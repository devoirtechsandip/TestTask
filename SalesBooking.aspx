<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="SalesBooking.aspx.cs" Async="true" Inherits="SalesBooking" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pagecontents" runat="Server">
    
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Sales Booking <asp:Label ID="lblbookingid" runat="server" ForeColor="Red"></asp:Label></h3>
				<div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">	
				
				<div class="row">
					  
					 <div class="col-md-3 col-xs-12">
                         <div class="form-group">
                             <label>Booking Type:</label>
				
                    
					  <asp:DropDownList ID="ddlbookingtype" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlbookingtype_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            
              </div>
						
						  </div>
                    <div class="col-md-3 col-xs-12">
                         <div class="form-group"> 
                        <label>Start Date:</label>
				
					  <asp:TextBox runat="server" ID="txtstartdate" CssClass="form-control" placeholder="Start Date" OnTextChanged="txtstartdate_TextChanged" AutoPostBack="true" autocomplete="off"></asp:TextBox>
<cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd/MM/yyyy" TargetControlID="txtstartdate"></cc1:CalendarExtender>
					  
              </div>
						
						  </div>
					   
					
             
                    <div class="col-md-3 col-xs-12">
                           <div class="form-group"> 
                        <label>End Date:</label>
					  <asp:TextBox runat="server" ID="txtEndDate" CssClass="form-control" placeholder="End Date" OnTextChanged="txtstartdate_TextChanged" AutoPostBack="true" autocomplete="off"></asp:TextBox>
<cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="txtEndDate"></cc1:CalendarExtender>
					  
              </div>
						  </div>
					   <div class="col-md-3 col-xs-12">
                        <div class="form-group"> 
                            <label>Agency:</label>
				<asp:TextBox runat="server" ID="txtAgency" CssClass="form-control" placeholder="Agency" ></asp:TextBox>
					  
              </div>
						  </div>
					 </div>
                <div class="row">
                    <div class="col-md-3 col-xs-12">
                         <div class="form-group"> 
                             <label>Brand:</label>
				<asp:TextBox runat="server" ID="txtBrand"  CssClass="form-control" placeholder="Brand" ></asp:TextBox>
					  
              </div>
						  </div>
					   <div class="col-md-3 col-xs-12">
                         <div class="form-group"> 
                             <label>Client:</label>
				 <asp:TextBox runat="server" ID="txtClient"  CssClass="form-control" placeholder="Client" ></asp:TextBox>
					  
              </div>
						  </div>
					
                    <div class="col-md-3 col-xs-12">
                         <div class="form-group"> 
                             <label>PO No.:</label>
				 <asp:TextBox runat="server" ID="txtPONo"  CssClass="form-control" placeholder="PO No." ></asp:TextBox>
					  
              </div>
						  </div>

                      <div class="col-md-3 col-xs-12">
                         <div class="form-group"> 
                             <label>Creative Approve:</label>
                             <asp:DropDownList ID="ddlcreativeapp" CssClass="form-control" runat="server">
                                 <asp:ListItem>No</asp:ListItem>
                                 <asp:ListItem>Yes</asp:ListItem>
                             </asp:DropDownList>
                         </div>
						  </div>

                     </div>
             
                <div class="row">

					   <div class="col-md-3 col-xs-12">
              <div class="form-group">
                <label>Inventory/Package Code:</label>&nbsp;&nbsp; <asp:LinkButton runat="server" ID="btndetails" OnClick="btndetails_Click" Text="<i class='fa fa-search'></i> " />
<asp:listbox ID="dditem" class="form-control select2"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="dditem_SelectedIndexChanged"> </asp:listbox>
              </div>
             
            </div>
					 
              
                    <div class="col-md-3 col-xs-12">
                         <div class="form-group"> 
                             <label>Card Rate:</label>
				<asp:TextBox runat="server" ID="txtCardRate"  CssClass="form-control" placeholder="Card Rate" ></asp:TextBox>
					  
              </div>
						  </div>
                      
                     <asp:UpdatePanel runat="server">
										<ContentTemplate>

					   <div class="col-md-3 col-xs-12">
                         <div class="form-group"> 
                             <label>Selling Rate:</label>
				 <asp:TextBox runat="server" ID="txtSellingRate"  CssClass="form-control" placeholder="Selling Rate" OnTextChanged="txtSellingRate_TextChanged" AutoPostBack="true"></asp:TextBox>
					  
              </div>
						  </div>
					
              
                    <div class="col-md-3 col-xs-12">
                         <div class="form-group"> 
                             <label>Premimum / Discount:</label>
				 <asp:TextBox runat="server" ID="txtPremimumDiscount"  CssClass="form-control" placeholder="Premimum / Discount" ></asp:TextBox>
					  
              </div>
						  </div>
					   </ContentTemplate>
        </asp:UpdatePanel>
					 </div>
                
                <div class="row">
					 <div class="col-xs-12">
				 <div class="form-group">
                                   <label>Remarks:</label>                  
					 <asp:TextBox ID="txtUserComments" runat="server" TextMode="MultiLine" Rows="2"  CssClass="form-control"></asp:TextBox>
					  
                </div>
             
						  </div>
					 </div>
				 <div class="row">
					 <div class="col-xs-6">
				 <div class="form-group">
                                   <label>Email To:</label>                  
					 <asp:TextBox ID="txtemailto" runat="server" CssClass="form-control"></asp:TextBox>
					  
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
		  </div>

      
    </section>


    
    <asp:Button ID="Button3" runat="server" Style="display: none"></asp:Button>
    <cc1:ModalPopupExtender ID="ModalPopupExtender3" BehaviorID="mpb" runat="server"
        PopupControlID="Panel2" TargetControlID="Button3" BackgroundCssClass="modalBackground" CancelControlID="LinkButton1">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup details" Style="display: none; height: 90%" ScrollBars="Both">
        <div class="header" >
            <div class="col-md-11">
            <asp:Label ID="Label2" runat="server">Details</asp:Label>
            </div>
            <div class="col-md-1" style="text-align:right">
                <asp:LinkButton runat="server"  ID="LinkButton1" OnClick="btndetails_Click" Text="<i class='fa fa-times'></i>" ForeColor="White" Font-Size="20px" />
            </div>
            
        </div>
        
        <div class="body">
            <div class="row">
                <div class="col-md-12 col-xs-12">

                    <asp:ListView ID="ListView2" runat="server" DataKeyNames="pk" OnItemCommand="ListView2_ItemCommand">
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
                                <td>
                                    <asp:LinkButton runat="server" ID="btnview" Text="Select" CommandName="viewdata" CommandArgument='<%#Eval("pk")%>' CssClass="btn" /></td>
                                <td><%#Eval("MMOPLCode")%></td>
                                <td><%#Eval("TIMLCode")%></td>
                                <td><%#Eval("type")%></td>
                                <td><%#Eval("loc")%></td>
                                <td><%#Eval("rate")%></td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <h2>No Records!</h2>
                        </EmptyDataTemplate>
                    </asp:ListView>

                </div>

            </div>

        </div>
        
    </asp:Panel>
                                      
</asp:Content>

