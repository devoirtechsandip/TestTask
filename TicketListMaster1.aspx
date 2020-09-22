<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="TicketListMaster1.aspx.cs" Inherits="TicketListMaster1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title>Ticket List</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <!-- bootstrap wysihtml5 - text editor -->
    <%--<link rel="stylesheet" href="..\plugins\bootstrap-wysihtml5\bootstrap3-wysihtml5.min.css" />--%>
    <link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" />
    <link href="dist/css/licenselists.css" rel="Stylesheet" type="text/css" />
    <style>
        .status1,.status1:hover{
            background-color: #fff;
    color: #444;
    border-color: #444;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pagecontents" runat="Server">

    <section class="content-header">
        <h1>Ticket List
        <%--<small>Security</small>--%>
        </h1>
        <%--<ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">CRM</a></li>
        <li class="active">Create</li>
      </ol>
        --%>
    </section>
    <section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- /.box-header -->
                <!-- TABLE: Search Criteria -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Ticket List</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>

                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12">

                               <div id="search">         
         <asp:TextBox ID="txtSearchMaster" runat="server" Height="23px" Width="973px"></asp:TextBox>
         <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="col-xs-offset-0 status1" Width="53px" />
     </div>
                            </div>
                        </div>
                        <br /> 
            <div class="row" style="display:inline-block">      
                <div class="col-md-6">
                    <asp:Button ID="btnchangestatus" runat="server"  CssClass="btn btn-default btn-sm status1" Text="Change Status " OnClick="btnchangestatus_Click" />
                    <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>
       
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btndelete" runat="server" OnClick="btndelete_Click" CssClass="btn btn-default btn-sm status1" Text="Delete" />
                </div>
            </div>
                    <!-- Change status and priority modal popup -->
                   <asp:Button ID="btnvstatus" runat="server" style="display:none" ></asp:Button>
                <cc1:ModalPopupExtender ID="mpechangestatus" BehaviorID="mpestatus" runat="server"
    PopupControlID="pnlstatus" TargetControlID="btnvstatus" BackgroundCssClass="modal-lg" CancelControlID="btncancel">
</cc1:ModalPopupExtender>
                <asp:Panel ID="pnlstatus" runat="server" CssClass="modalPopup upload" Style="display: none">
    <div class="header">
        <asp:Label ID="Label7" runat="server"></asp:Label> Confirmation
    </div>
    <div class="body">
         <div class="col-md-12">
             <asp:Label ID="Label1" runat="server" Text="Status"></asp:Label>
             <asp:DropDownList ID="ddlstatus" ValidationGroup="vg" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>
         <div class="col-md-12">
             <asp:Label ID="Label2" runat="server" Text="Priority"></asp:Label>
             <asp:DropDownList ID="ddlPriority" ValidationGroup="vg" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>

                
        </div>
                    <br /><br /><br /><br /><br />
                     <div class="footer" style="margin-bottom:42px;">
        <div class="col-md-offset-3 col-md-2 col-xs-12">
        <asp:Button ID="btnupdate" runat="server" Text="Update" Onclick="btnupdate_Click" CssClass="btn btn-default status1"></asp:Button>
            </div>
        <div class="col-md-offset-1 col-md-2 col-xs-12">
        <asp:Button ID="btncancel" runat="server" Text="Close" CssClass="btn btn-default status1"></asp:Button>
            </div>
    </div>
</asp:Panel>
                    <!-- End Change status and priority modal popup -->

                            <asp:Label ID="lblpk" runat="server" Text="pk" Visible="false"></asp:Label>
                            <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label> 
                        
                        <br /><br />
            <div class="table-responsive" style="border: 1px solid #5D7B9D;">
                            <asp:ListView ID="lstdc" runat="server" DataKeyNames="pk">
                                <LayoutTemplate>
                                    <table class="table no-margin table-bordered table-hover">
                                        <thead style="background: #5D7B9D; color: white;">
                                            <tr>
                                                <th><asp:CheckBox ID="checkall" runat="server"></asp:CheckBox></th>
                                               <%-- <th>Id</th>--%>
                                                <th>Status</th> 
                                                <th>Subject</th> 
                                                <th>Raised By</th>
                                                <th>Category</th>
                                                <th>Assign Agent</th>
                                                <th>Priority</th>
                                                <th>Date Updated</th>
                                            </tr> 
                                        </thead>
                                        <tr id="itemPlaceholder" runat="server"></tr>

                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr >
                                          <td><input id="chkpk" value='<%# Eval("pk") %>' type="checkbox" runat="server" /></td>
                                          <%--<td onclick="window.location.href = 'PostReply.aspx?pk=<%# Eval("pk") %>';"><%#Eval("pk")%></td>--%>
                                          <td onclick="window.location.href = 'PostReply.aspx?pk=<%# Eval("pk") %>';"> 
                                          <span class="label <%#Eval("stat") %>" style="line-height:2.6;padding:6.6px;"><%#Eval("Status")%></td>
                                          <td onclick="window.location.href = 'PostReply.aspx?pk=<%# Eval("pk") %>';"><%#Eval("Subject")%></td>
                                         <td onclick="window.location.href = 'PostReply.aspx?pk=<%# Eval("pk") %>';"><%#Eval("UserName")%></td>
                                          <td onclick="window.location.href = 'PostReply.aspx?pk=<%# Eval("pk") %>';"><%#Eval("CategoryId")%></td>
                                          <td onclick="window.location.href = 'PostReply.aspx?pk=<%# Eval("pk") %>';"></td>
                                          <td onclick="window.location.href = 'PostReply.aspx?pk=<%# Eval("pk") %>';">
                                           <span class="label <%#Eval("prior") %>" style="line-height:2.6;padding:6.6px;"><%#Eval("PriorityId")%></td>
                                          <td onclick="window.location.href = 'PostReply.aspx?pk=<%# Eval("pk") %>';"><%#Eval("DateUpdated")%>  </td>
                                       </tr>
                                </ItemTemplate>
                                <EmptyDataTemplate> 
                                    <table class="table no-margin table-bordered table-hover">
                                        <thead style="background: #5D7B9D; color: white;">
                                            <tr>
                                                 <th><asp:CheckBox ID="CheckBox1" runat="server"></asp:CheckBox></th>
                                                <th>Id</th>
                                                <th>Status</th>
                                                <th>Subject</th> 
                                                <th>Raised By</th>
                                                <th>Category</th>
                                                <th>Assign Agent</th>
                                                <th>Priority</th>
                                                <th>Date Updated</th>
                                            </tr> 
                                        </thead>
                                        <tr id="itemPlaceholder" runat="server"></tr> 
                                        <tr>
                                            <td colspan="6">
                                    <strong>No Tickets found!</strong></td>
                                        </tr>
                                    </table> 
                                </EmptyDataTemplate>
                            </asp:ListView>
                        </div>
         <div class="row">
                          
                          <div class="col-md-4 col-md-offset-4" style="text-align: center;">
						            <button class="btn btn-default btn-sm" onclick="wpsp_ticket_prev_page();"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i></button>
            <strong>1</strong> of <strong>1</strong> Pages            <button class="btn btn-default btn-sm" onclick="wpsp_ticket_next_page();"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></button>

        </div>
                          
        </div>
                 
                </div>
                    </div>
                </div>
            </div>
<%--<div id="divPopUp" class="pnlBackGround">
     <div class="row">
                             <div class="col-md-12">
                                <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label><asp:Label runat="server" ID="Label5" Text=" *" ForeColor="Red" Font-Bold="true"></asp:Label>
                                 <asp:DropDownList ID="ddlstatus" ValidationGroup="vg" runat="server" CssClass="form-control"></asp:DropDownList>
                                 </div>
                            </div>
                        <div class="row">
                             <div class="col-md-12">
                                <asp:Label ID="Label1" runat="server" Text="Priority"></asp:Label><asp:Label runat="server" ID="Label4" Text=" *" ForeColor="Red" Font-Bold="true"></asp:Label>
                               <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-control"></asp:DropDownList>
                                  </div>
                            </div>

     <div id="buttons">
          <div id="DivbtnOK" class="buttonOK"><asp:Button id="btnOk" runat="server" text="Ok" /></div>
          <div id="Divbtncancel" class="buttonOK"><asp:Button id="btnCancel" runat="server" text="Cancel" /></div>
     </div>
</div>--%>
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
