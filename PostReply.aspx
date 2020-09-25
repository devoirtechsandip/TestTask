<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="PostReply.aspx.cs" Inherits="PostReply" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title>Post Reply</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .sidebar-module {
            background-color: #f5f5f5 !important;
            color: #565051 !important;
            border-radius: 5px;
            padding: 5px 10px 10px 10px;
            margin-bottom: 20px;
            width: 100%;
            float: left;
            overflow-x: hidden;
            border: 1px solid #e3e3e3;
        }

        .ticket_status_sidebar {
            margin-bottom: 10px;
            font-size: 12px;
        }

        .ticketstatussidebar {
            border-top: 1px solid #D1D0CE !important;
            margin-top: 0px !important;
            margin-bottom: 10px !important;
        }

        .spanlabel {
            border-radius: 4px;
            color: #ffffff;
            font-weight: bold;
            padding: 5px 10px;
            font-size: 10px;
        }

        .rich_form_container {
            display: block;
            background-color: #d2d2d2;
            padding-top: 30px;
            padding-bottom: 30px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .status1,.status1:hover{
            background-color: #fff;
    color: #444;
    border-color: #444;
        }
    </style>
    <script type="text/javascript">
        $('document').ready(function () {
            $('#btnPosteRply').click(function () {
                $('#pnlPostRply').slideDown('slow');
            });
        });

        $('document').ready(function () {
            $('#btnCancel').click(function () {
                $('#pnlPostRply').slideUp('slow');
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pagecontents" runat="Server">
    <section class="content">
        <div class="row">
            <div class="col-md-12">
    <div class="box box-info">
        <div class="box-body">
            <div class="row">
                <div class="col-md-9">
            <div class="row" style="display:inline-block">
                <div class="col-md-5">
                    <asp:Button ID="btnBackToTicket" runat="server" PostBackUrl="~/TicketListMaster1.aspx" CssClass="btn btn-default btn-sm status1" Text="Back to tickets " />
                </div>
                <div class="col-md-1">
                    <asp:Button ID="btnCloseTicket" runat="server" OnClick="btnCloseTicket_Click" CssClass="btn btn-default btn-sm status1" Text="Close Ticket" />
                </div>
            </div>

                    <h4>
                     Ticket #<asp:Label runat="server" Text="" ID="lblTicketId"></asp:Label>&nbsp;&nbsp;<asp:Label runat="server" Text="" ID="lblSubject"></asp:Label>
                    </h4>
                    
                <hr />

            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="btnPosteRply" runat="server" Text="Post Reply" Font-Bold="true" OnClick="btnPosteRply_Click" CssClass="btn well btn-default" Width="100%" Style="text-align:center"></asp:Button>
                    <%--<button runat="server" id="btnPosteRply" class="btn well btn-default" style="text-align:center;width:100%" onclick="slidePanel('<%= pnlPostRply.ClientID %>')">--%>
                        
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:Panel ID="pnlPostRply" runat="server" Visible="false">
                        <div id="reply_ticket_form_container" class="col-md-12 rich_form_container">
                            <div class="col-md-12 form-group">

                                <asp:TextBox ID="txtReply" TextMode="MultiLine" Rows="40" runat="server" class="form-control textarea" name="editor" Height="127px"></asp:TextBox>

                            </div>
                            <div class="col-md-12 form-group">
                                <asp:TextBox ID="txtBCC" runat="server" autocomplete="off" class="form-control" type="text" name="bcc" value="" placeholder="BCC (Comma separated list)" />
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
                                <div class="panel panel-primary col-md-12 wpsp_ticket_reply_thread" style="padding: 0px;">
                                    <div class="panel-heading col-md-12">
                                        <div class="col-md-8 ticket_thread_title">
                                            <div class="col-md-12" style="padding-left: 0px;">
                                                <div class="col-md-2 col-sm-2 col-xs-2 wpsp_thread_avatar" style="padding-left: 0px; padding-right: 0px; width: 50px;">
                                                    <img alt="" src="https://secure.gravatar.com/avatar/10933a36c442afed11f813423d76e372?s=40&amp;d=mm&amp;r=g" srcset="https://secure.gravatar.com/avatar/10933a36c442afed11f813423d76e372?s=80&amp;d=mm&amp;r=g 2x" class="avatar avatar-40 photo img-circle" height="40" width="40">
                                                </div>
                                                <div class="col-md-10 wpsp_hthread_info" style="padding-left: 0px;">
                                                    <strong><%#Eval("PostedUser")%></strong><br>
                                                    <small><%#Eval("DatePosted")%></small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4 ticket_thread_actions">
                                        </div>
                                    </div>
                                    <div class="panel-body col-md-12 wpsp_ticket_thread_content">

                                        <div class="col-md-12 wpsp_ticket_thread_body" style="padding: 0px;">
                                            <%#Eval("ReplyMessage")%>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
                    </div>
                <div class="col-md-3">
            <%-- Ticket Status--%>
                    <div class="sidebar-module" id="tic_status_sidebar">
                        <h4>Ticket Status	</h4>
                        <hr class="ticketstatussidebar" />
                         <div class="ticket_status_sidebar">
                            <strong>Status: </strong> 
                            <span class="label <%#Eval("stat") %>" style="line-height:2.6;padding:6.6px;"><asp:Label runat="server" ID="lblstatus" Text="" style="font-size:10px;border-radius:0.75rem;padding:6.6px; line-height:2.6"></asp:Label></span>
                        </div>

                        <div class="ticket_status_sidebar">
                            <strong>Category: </strong><asp:Label runat="server" ID="lblcategory" Text=""></asp:Label> 
                        </div>

                        <div class="ticket_status_sidebar">
                            <strong>Priority: </strong><span class="label <%#Eval("prior") %>" style="line-height:2.6;padding:6.6px;"> <asp:Label runat="server" ID="lblpriority" Text="" style="font-size:10px;border-radius:0.75rem;padding:6.6px; line-height:2.6"></asp:Label></span>
                        </div>
                    </div>
            <%--Ticket Field Sidebar--%>
        <div class="sidebar-module" id="tic_fields_sidebar">
                    <h4>Ticket Fields</h4>

                    <hr class="ticketstatussidebar"/>
            <div class="ticket_status_sidebar">
                      <%--<strong>Attachment:</strong>--%>
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
                    <div class="sidebar-module" id="tic_userdetails_sidebar">
                        <h4>User Details	</h4>
                        <hr class="ticketstatussidebar"/>
                        <div class="ticket_status_sidebar">
                            <strong>Name:&nbsp; </strong>
                            <asp:Label ID="lblname" runat="server" Text=""></asp:Label>
                            <br />
                            <strong>
                                Email ID:&nbsp; </strong>
                            <asp:Label ID="lblemail" runat="server" Text=""></asp:Label>
                        </div>
                       
                        </div>
                    </div>
                </div>
            </div>
    </div>
                </div>
            </div>
               <!-- CK Editor -->
<script src="bower_components/ckeditor/ckeditor.js" type="text/javascript"></script>
    <!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('editor1')
        //bootstrap WYSIHTML5 - text editor
        $('.textarea').wysihtml5()
    })
</script>
        </section>
</asp:Content>

