<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="PostReply.aspx.cs" Inherits="PostReply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <title>Post Reply</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <!-- bootstrap wysihtml5 - text editor -->
  <%--<link rel="stylesheet" href="..\plugins\bootstrap-wysihtml5\bootstrap3-wysihtml5.min.css" />--%>
    <link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pagecontents" runat="Server">

    <section class="content-header" style="left: 3px; top: 11px">
        <h1 style="width: 450px; height: 21px;">
            <asp:Button ID="btnBackToTicket" runat="server" PostBackUrl="~/TicketListMaster.aspx" Height="26px" Text="Back to tickets " />
            <asp:Button ID="btnCloseTicket" runat="server" OnClick="btnCloseTicket_Click" Height="26px" Text="Close Ticket" style="margin-top: 3px" />
        </h1>
        <h1 style="width: 240px">
            &nbsp;</h1>
        <h1 style="width: 240px">
    [Ticket #<asp:Label runat="server" Text="" ID="lblTicketId" Font-Bold="true"></asp:Label>]
      
        </h1>
       
    </section>
    <section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- /.box-header -->
                <!-- TABLE: Search Criteria -->
                <div class="box box-info" style="left: 0px; top: 0px; width: 69%">
                 <div class="well well-sm thread_actions col-md-12">
                    <asp:Button ID="btnPosteRply" runat="server" Text="Post Reply" OnClick="btnPosteRply_Click" ForeColor="#3399ff" BorderColor="#3399ff" BackColor="White" Width="92%" Height="50px" style="margin-left: 28px"></asp:Button>
                      
                     <asp:Panel ID="pnlPostRply" runat="server" Visible="false">
                <div id="reply_ticket_form_container" class="col-md-12 rich_form_container">
                                        <div class="col-md-12 form-group">
                                    <asp:TextBox ID="txtReply" TextMode="MultiLine" Rows="40" runat="server" class="form-control" name="editor" Height="127px"></asp:TextBox>
            						 
						                    </div>
                    <div class="col-md-12 form-group">
                        <asp:TextBox ID="txtBCC" runat="server" class="form-control" type="text" name="bcc" value="" placeholder="BCC (Comma separated list)" />
                    </div>
                                        <div class="col-md-3 col-md-offset-6 form-group">
                        <asp:Button runat="server" Onclick="btnSubmitReply_Click" class="form-control btn btn-success" id="btnSubmitReply" Text="Submit Reply" ></asp:Button>
                    </div>
                    <div class="col-md-3 form-group">
                        <asp:Button runat="server" class="form-control btn btn-info" id="btnCancel" onclick="btnCancel_Click" Text="Cancel"></asp:Button>
                    </div>
                </div>
                         </asp:Panel>
             </div>
            
                                        <div class="table-responsive" style="border: 1px solid #5D7B9D;">
                            <asp:ListView ID="lstReply" runat="server"> 
                                <ItemTemplate>
                                  <%-- <table>
                                        <tr> 
                                            <th><%#Eval("UserName")%> <br><%#Eval("DatePosted")%></th>
                                        </tr>
                                       <hr style="width:50%;text-align:left;margin-left:0">
                                        <tr>
                                        <td><%#Eval("ReplyMessage")%></td>
                                    </tr>
                                       <hr style="width:50%;text-align:left;margin-left:0">
                                    </table>--%>
                                    <div class="panel panel-primary col-md-12 wpsp_ticket_reply_thread" style="padding: 0px;">
                <div class="panel-heading col-md-12">
                    <div class="col-md-8 ticket_thread_title">
                        <div class="col-md-12" style="padding-left:0px;">
                        	<div class="col-md-2 col-sm-2 col-xs-2 wpsp_thread_avatar" style="padding-left: 0px;padding-right: 0px; width:50px;">
                        		<img alt="" src="https://secure.gravatar.com/avatar/10933a36c442afed11f813423d76e372?s=40&amp;d=mm&amp;r=g" srcset="https://secure.gravatar.com/avatar/10933a36c442afed11f813423d76e372?s=80&amp;d=mm&amp;r=g 2x" class="avatar avatar-40 photo img-circle" height="40" width="40">                        	</div>
													<div class="col-md-10 wpsp_hthread_info" style="padding-left:0px;">
														<strong><%#Eval("UserName")%></strong><br>

                            
                            <small><%#Eval("DatePosted")%></small>
													</div>
                        </div>
                    </div>
                    <div class="col-md-4 ticket_thread_actions">
                    </div>
                </div>
                <div class="panel-body col-md-12 wpsp_ticket_thread_content">

                    <div class="col-md-12 wpsp_ticket_thread_body" style="padding: 0px;">
                        <p><%#Eval("ReplyMessage")%></p> 
                    </div> 
                </div>
            </div>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>


                     <%-- Ticket Status--%> 
<div class="well well-sm thread_actions col-md-4">

              <div id="right-sidebar-container" class="col-md-3" style="left: -7px; top: -1px; width: 236px; height: 108px;">
              <div class="sidebar-module" id="tic_status_sidebar">

    <h4> Ticket Status	</h4>
    <div class="ticket_status_sidebar">
        <strong>Status:</strong> <span class="wpsp_admin_label" style="background-color:#d9534f;">Open</span>
    </div>

    <div class="ticket_status_sidebar">
        <strong>Category:</strong> Android Application    </div>

    <div class="ticket_status_sidebar">
        <strong>Priority:</strong> <span class="wpsp_admin_label" style="background-color:#5cb85c;">Normal</span>
    </div>
</div>
</div>
    </div>
                </div>
                      <%--Ticket Field Sidebar--%>
          <div class="sidebar-module" id="tic_fields_sidebar">
            <div class="well well-sm thread_actions col-md-4">
      <div class="ticket-field-sidebar" style="width: 204px">
          <h4> Ticket Fields</h4>
          
    <hr class="sidebar-module-hr">
          
        <br /> 
       <%-- <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True"
            onselectedindexchanged="ListBox1_SelectedIndexChanged" />--%>
              <div class="table-responsive" style="border: 1px solid #5D7B9D;">
                  <asp:GridView ID="gridAttachment" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="pk" Visible="false" HeaderText="Id" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Attachment" ItemStyle-Width="200px" HeaderStyle-CssClass="ticket-field-sidebar" >
                        <ItemTemplate>
                            <br />
                            <asp:LinkButton ID="lnkDownload" runat="server" Text='<%# Eval("FileName") %>'
                                CommandArgument='<%# Eval("pk") %>' OnClick="lnkDownload_Click"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                  </div>
         

                  
                
</div>

</div>
        
                </div>
         </div>       
</div>                               
    </section>

</asp:Content>

