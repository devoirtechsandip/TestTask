<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="TicketListMaster.aspx.cs" Inherits="TicketListMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <title>Ticket List</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <!-- bootstrap wysihtml5 - text editor -->
  <%--<link rel="stylesheet" href="..\plugins\bootstrap-wysihtml5\bootstrap3-wysihtml5.min.css" />--%>
    <link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" />
    
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
         <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="col-xs-offset-0" Width="53px" />
     </div>
                            </div>
                        </div>
                        <br /> 
          </div>
                      
                       </div> 
                            <asp:Label ID="lblpk" runat="server" Text="pk" Visible="false"></asp:Label>
                            <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label> 
                        
                        <br />

                        <div class="table-responsive" style="border: 1px solid #5D7B9D;">
                            <asp:ListView ID="lstdc" runat="server" DataKeyNames="pk">
                                <LayoutTemplate>
                                    <table class="table no-margin table-bordered table-hover">
                                        <thead style="background: #5D7B9D; color: white;">
                                            <tr>
                                                <th>Id</th>
                                                <th>Status</th>
                                                <th>Subject</th> 
                                                <th>Category</th>
                                                <th>Priority</th>
                                                <th>DateUpdated</th>
                                            </tr>

                                        </thead>
                                        <tr id="itemPlaceholder" runat="server"></tr>

                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr onclick="window.location.href = 'PostReply.aspx?pk=<%# Eval("pk") %>';">
                                        
                                        <td><%#Eval("pk")%>
                                          <td> <asp:Label ID="btopen" runat="server" class="wpsp_admin_label" style="background-color:#d9534f;" Text="Open" /><%#Eval("Status")%></td>
                                          <td><%#Eval("Subject")%>
                                            <td><%#Eval("CategoryId")%>
                                            <td><%#Eval("PriorityId")%>
                                            <td><%#Eval("DateUpdated")%>  
                                       </tr>
                                </ItemTemplate>
                                <EmptyDataTemplate> 
                                    <table class="table no-margin table-bordered table-hover">
                                        <thead style="background: #5D7B9D; color: white;">
                                            <tr>
                                                <th>Id</th>
                                                <th>Status</th>
                                                <th>Subject</th> 
                                                <th>Category</th>
                                                <th>Priority</th>
                                                <th>DateUpdated</th>
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
                        </div>
                    </div>
         <div class="row">
                          
                          <div class="col-md-4 col-md-offset-4" style="text-align: center;">
						            <button class="btn btn-default btn-sm" onclick="wpsp_ticket_prev_page();"><i class="fa fa-chevron-circle-left" aria-hidden="true"></i></button>
            <strong>1</strong> of <strong>1</strong> Pages            <button class="btn btn-default btn-sm" onclick="wpsp_ticket_next_page();"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></button>

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
