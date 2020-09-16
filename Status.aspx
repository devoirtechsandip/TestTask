<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/main.master" CodeFile="Status.aspx.cs" Inherits="Status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <title>Status</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pagecontents" runat="Server">

    <section class="content-header">
        <h1>Status
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
                        <h3 class="box-title">Status</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>

                        </div>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <asp:Label ID="Label2" runat="server" Text="Status"></asp:Label>
                                <asp:TextBox ID="txtstatus" runat="server" placeholder="Enter Status" CssClass="form-control"></asp:TextBox>
                                
                            </div>
                          
                            <div class="col-md-4 col-xs-12">

                                <asp:Button ID="submit" runat="server" Text="Submit" class="btn btn-primary btnsubmit margin" OnClick="submit_Click" />
                                <asp:Button ID="update" runat="server" Text="Update" class="btn btn-primary btnsubmit margin" Visible="false" OnClick="update_Click" />
                            </div>
                            <asp:Label ID="lbllpk" runat="server" Text="pk" Visible="false"></asp:Label>
                            <asp:Label ID="lbllmsg" runat="server"></asp:Label>

                        </div>
                        <br />

                        <div class="table-responsive" style="border: 1px solid #5D7B9D;">
                            <asp:ListView ID="lstdcc" runat="server" OnItemCommand="lstdcc_ItemCommand" OnItemUpdating="lstdcc_ItemUpdating" OnItemDeleting="lstdcc_ItemDeleting">
                                <layouttemplate>
                                    <table class="table no-margin table-bordered table-hover">
                                        <thead style="background: #5D7B9D; color: white;">
                                            <tr>
                                                <th>Status</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>

                                        </thead>
                                        <tr id="itemPlaceholder" runat="server"></tr>

                                    </table>
                                </layouttemplate>
                                <itemtemplate>
                                    <tr>
                                        <td><%#Eval("Status")%></td>
                                        <td>
                                            <asp:LinkButton ID="btnupdate" runat="server" CssClass="btn btn-primary"  CausesValidation="false" CommandName="update" CommandArgument='<%#Eval("pk")%>' ToolTip="Update"><i class="fas fa-edit"></i></asp:LinkButton></td>
                                        <td>
                                            <asp:LinkButton ID="btndelete" runat="server" CssClass="btn btn-danger" CausesValidation="false" CommandName="delete" CommandArgument='<%#Eval("pk")%>' ToolTip="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton></td>
                                    </tr>
                                </itemtemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
