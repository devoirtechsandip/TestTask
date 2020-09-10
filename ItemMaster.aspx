<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="ItemMaster.aspx.cs" Async="true" Inherits="ItemMaster" %>

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
   
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">

     
        <!-- /.box-header -->
      
         
	 <!-- TABLE: Search Criteria -->

          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Create New Inventory</h3>
				<div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">	
				
				<div class="row">
					  
					 <div class="col-xs-6">
                         <label>MMOPL Code:</label>
				 <div class="input-group">
                     
                <span class="input-group-addon"><i class="fa fa-code"></i></span>
                
					 <asp:TextBox runat="server" ID="txtMMOPLCode" CssClass="form-control" placeholder="MMOPL Code" ></asp:TextBox>
					  
              </div>
						
						  </div>

					  <div class="col-xs-6">
                          <label>TIML Code:</label>
				 <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-code"></i></span>
                
					 <asp:TextBox runat="server" ID="txtTIMLCode" CssClass="form-control" placeholder="TIML Code"></asp:TextBox>
              </div>
						  </div>
					 </div>
                <br />
				<asp:UpdatePanel runat="server">
										<ContentTemplate>
                <div class="row">
					 <div class="col-xs-6">
                         <label>Length (In Ft):</label>
				 <div class="input-group">
                     
                <span class="input-group-addon"><i class="fa fa-ruler-combined"></i></span>
                
					 <asp:TextBox runat="server" ID="txtLength" CssClass="form-control" placeholder="Length" OnTextChanged="txtLength_TextChanged" AutoPostBack="true" ></asp:TextBox>
					  
              </div>
					
						  </div>
                    <div class="col-xs-6">
                         <label>Height (In Ft):</label>
				 <div class="input-group">
                     
                <span class="input-group-addon"><i class="fa fa-ruler-combined"></i></span>
                
					 <asp:TextBox runat="server" ID="txtHeight" CssClass="form-control" placeholder="Height" OnTextChanged="txtLength_TextChanged" AutoPostBack="true"></asp:TextBox>
					  
              </div>
					
						  </div>
					 </div>
				<br />
                <div class="row">
					 <div class="col-xs-6">
                         <label>Area (In Ft):</label>
				 <div class="input-group">
                     
                <span class="input-group-addon"><i class="fas fa-ruler-combined"></i></span>
                
					 <asp:TextBox runat="server" ID="txtArea" CssClass="form-control" placeholder="Area" ></asp:TextBox>
					  
              </div>
					
						  </div>
                    
                    <div class="col-xs-6">
                         <label>Rate/day:</label>
				 <div class="input-group">
                     
                <span class="input-group-addon"><i class="fa fa-inr"></i></span>
                
					 <asp:TextBox runat="server" ID="txtrate" CssClass="form-control" placeholder="Rate/day" ></asp:TextBox>
					  
              </div>
					
						  </div>
					 </div>
                                             
				<br />

                  <div class="row">
					 <div class="col-xs-6">
                         <label>Type:</label>
				 <div class="input-group">
                     
                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                
                     <asp:DropDownList ID="ddltype" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddltype_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
              </div>
					</div>
                      <div class="col-xs-6">
                         <label>Sub Type:</label>
				 <div class="input-group">
                     
                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                
					 <asp:TextBox runat="server" ID="txtsubtype" CssClass="form-control" placeholder="Sub Type" ></asp:TextBox>  
              </div>
					</div>
					 </div>
				<br />
 <div class="row">
                <div class="col-xs-6">
                         <label>Location:</label>
				 <div class="input-group">
                     
                <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                
                     <asp:DropDownList ID="ddlloc" CssClass="form-control" runat="server"></asp:DropDownList>
              </div>
					</div>
                </div>

                </ContentTemplate>
        </asp:UpdatePanel>
                <div class="row">
					 <div class="col-xs-12">
				 <div class="form-group">
                                   <label>Remarks:</label>                  
					 <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" placeholder="Description" CssClass="form-control"></asp:TextBox>
					  
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
              <h3 class="box-title">Inventory List</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
               
            <div class="box-body">
              <div class="table-responsive">
				  
				  <asp:ListView ID="lvBucket" runat="server"  DataKeyNames="pk" OnItemCommand="ListView1_ItemCommand">
    <LayoutTemplate>
        <table id="example2" class="table no-margin">
            <thead>
                  <tr>
                      <th>MMOPL Code</th>
                    <th>TIML Code</th>  
                    <th>Type</th>
                      <th>Sub-Type</th>
                      <th>Location</th>
                      <%--<th>Rate<br />/day</th>--%>
                      
                  </tr>
                  </thead>
           <tr id="itemPlaceholder" runat="server"></tr>
        </table>
    </LayoutTemplate>
    <ItemTemplate>
        <tr>
            <td><asp:LinkButton runat="server" ID="btnview" Text='<%#Eval("MMOPLCode")%>' CommandName="viewdata" CommandArgument='<%#Eval("pk")%>' CssClass="btn"/></td>
			<td><%#Eval("TIMLCode")%></td>
            <td><%#Eval("type")%></td>
            <td><%#Eval("subtype")%></td>
                <td><%#Eval("loc")%></td>
            <%--<td style="text-align:right"><%#Eval("rate")%></td>--%>
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

