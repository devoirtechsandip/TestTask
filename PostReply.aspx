<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="PostReply.aspx.cs" Inherits="PostReply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title>Post Reply</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <!-- bootstrap wysihtml5 - text editor -->
    <%--<link rel="stylesheet" href="..\plugins\bootstrap-wysihtml5\bootstrap3-wysihtml5.min.css" />--%>
    <link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pagecontents" runat="Server">

    <div class="box box-info">
        <div class="box-body">
            <div class="row">
                <div class="col-md-2">
                    <asp:Button ID="btnBackToTicket" runat="server" PostBackUrl="~/TicketListMaster.aspx" CssClass="btn bg-blue" Text="Back to tickets " />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnCloseTicket" runat="server" OnClick="btnCloseTicket_Click" CssClass="btn bg-blue" Text="Close Ticket" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    [Ticket #<asp:Label runat="server" Text="" ID="lblTicketId" Font-Bold="true"></asp:Label>]
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="btnPosteRply" runat="server" Text="Post Reply" OnClick="btnPosteRply_Click" CssClass="btn bg-olive" Width="92%" Height="50px" Style="margin-left: 28px"></asp:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:Panel ID="pnlPostRply" runat="server" Visible="false">
                        <div id="reply_ticket_form_container" class="col-md-12 rich_form_container">
                            <div class="col-md-12 form-group">
                                <asp:TextBox ID="txtReply" TextMode="MultiLine" Rows="40" runat="server" class="form-control" name="editor" Height="127px"></asp:TextBox>

                            </div>
                            <div class="col-md-12 form-group">
                                <asp:TextBox ID="txtBCC" runat="server" class="form-control" type="text" name="bcc" value="" placeholder="BCC (Comma separated list)" />
                            </div>
                            <div class="col-md-3 col-md-offset-6 form-group">
                                <asp:Button runat="server" OnClick="btnSubmitReply_Click" class="form-control btn btn-success" ID="btnSubmitReply" Text="Submit Reply"></asp:Button>
                            </div>
                            <div class="col-md-3 form-group">
                                <asp:Button runat="server" class="form-control btn btn-info" ID="btnCancel" OnClick="btnCancel_Click" Text="Cancel"></asp:Button>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
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
                                            <div class="col-md-12" style="padding-left: 0px;">
                                                <div class="col-md-2 col-sm-2 col-xs-2 wpsp_thread_avatar" style="padding-left: 0px; padding-right: 0px; width: 50px;">
                                                    <img alt="" src="https://secure.gravatar.com/avatar/10933a36c442afed11f813423d76e372?s=40&amp;d=mm&amp;r=g" srcset="https://secure.gravatar.com/avatar/10933a36c442afed11f813423d76e372?s=80&amp;d=mm&amp;r=g 2x" class="avatar avatar-40 photo img-circle" height="40" width="40">
                                                </div>
                                                <div class="col-md-10 wpsp_hthread_info" style="padding-left: 0px;">
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
                </div>
            </div>
            <%-- Ticket Status--%>
            <div class="well well-sm thread_actions col-md-4">

                <div id="right-sidebar-container" class="col-md-3" style="left: -7px; top: -1px; width: 236px; height: 108px;">
                    <div class="sidebar-module" id="tic_status_sidebar">

                        <h4>Ticket Status	</h4>
                        <div class="ticket_status_sidebar">
                            <strong>Status:</strong> <span class="wpsp_admin_label" style="background-color: #d9534f;">Open</span>
                        </div>

                        <div class="ticket_status_sidebar">
                            <strong>Category:</strong> Android Application   
                        </div>

                        <div class="ticket_status_sidebar">
                            <strong>Priority:</strong> <span class="wpsp_admin_label" style="background-color: #5cb85c;">Normal</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--Ticket Field Sidebar--%>
        <div class="sidebar-module" id="tic_fields_sidebar">
            <div class="well well-sm thread_actions col-md-4">
                <div class="ticket-field-sidebar" style="width: 204px">
                    <h4>Ticket Fields</h4>

                    <hr class="sidebar-module-hr">

                    <br />
                    <%-- <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True"
            onselectedindexchanged="ListBox1_SelectedIndexChanged" />--%>
                    <div class="table-responsive" style="border: 1px solid #5D7B9D;">
                        <asp:GridView ID="gridAttachment" runat="server" AutoGenerateColumns="false" Width="250px">
                            <Columns>
                                <asp:BoundField DataField="pk" Visible="false" HeaderText="Id" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Attachment" ItemStyle-Width="200px" HeaderStyle-CssClass="ticket-field-sidebar">
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
            <%--User name and Email ID--%>
            <div class="well well-sm thread_actions col-md-4">

                <div id="right-sidebar-container1" class="col-md-3" style="left: -11px; top: 2px; width: 203px; height: 108px;">
                    <div class="sidebar-module" id="tic_status_sidebar1">

                        <h4>User Details	</h4>
                        <div class="ticket_status_sidebar">
                            <strong>Name:&nbsp; </strong>
                            <asp:Label ID="lblname" runat="server" Text=""></asp:Label>
                            <strong>
                                <br />
                                Email ID:&nbsp; </strong>
                            <asp:Label ID="lblemail" runat="server" Text=""></asp:Label>
                        </div>
                        <%--<div class="ticket_status_sidebar" style="width: 228px">
        <strong>Email ID:&nbsp; </strong> dmsahani@gmail.com    </div>--%>
                    </div>
                </div>


            </div>

        </div>
    </div>
    </div>
        </div>

</asp:Content>

