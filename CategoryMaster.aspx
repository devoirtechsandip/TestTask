<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="CategoryMaster.aspx.cs" Inherits="CategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <title>Category</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pagecontents" runat="Server">

    <section class="content-header">
        <h1>Category
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
                        <h3 class="box-title">Category</h3>
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
                                <asp:Label ID="Label2" runat="server" Text="Category"></asp:Label><asp:Label runat="server" ID="Label13" Text=" *" ForeColor="Red" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtcategory" runat="server" placeholder="Enter Category" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Category is required." ControlToValidate="txtcategory" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>

                            </div>
                          
                            <div class="col-md-4 col-xs-12">

                                <asp:Button ID="submit" runat="server" Text="Submit" class="btn btn-primary btnsubmit margin" OnClick="submit_Click" />
                                <asp:Button ID="update" runat="server" Text="Update" class="btn btn-primary btnsubmit margin" Visible="false" OnClick="update_Click" />
                            </div>
                            <asp:Label ID="lblpk" runat="server" Text="pk" Visible="false"></asp:Label>
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>

                        </div>
                        <br />

                        <div class="table-responsive" style="border: 1px solid #5D7B9D;">
                            <asp:ListView ID="lstdc" runat="server" OnItemCommand="lstdc_ItemCommand" OnItemUpdating="lstdc_ItemUpdating" OnItemDeleting="lstdc_ItemDeleting">
                                <LayoutTemplate>
                                    <table class="table no-margin table-bordered table-hover">
                                        <thead style="background: #5D7B9D; color: white;">
                                            <tr>
                                                <th>Category</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>

                                        </thead>
                                        <tr id="itemPlaceholder" runat="server"></tr>

                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Category")%></td>
                                        <%--<td><asp:Button ID="btnupdate" runat="server" Text="Update" CommandName="update" CommandArgument='<%#Eval("pk")%>'></asp:Button></td>--%>
                                        <td>
                                            <asp:LinkButton ID="btnupdate" runat="server" CssClass="btn btn-primary"  CausesValidation="false" CommandName="update" CommandArgument='<%#Eval("pk")%>' ToolTip="Update"><i class="fas fa-edit"></i></asp:LinkButton></td>
                                        <%--<td><asp:Button ID="btndelete" runat="server" Text="Delete" CommandName="delete" CommandArgument='<%#Eval("pk")%>'></asp:Button></td>--%>
                                        <td>
                                            <asp:LinkButton ID="btndelete" runat="server" CssClass="btn btn-danger" CausesValidation="false" CommandName="delete" CommandArgument='<%#Eval("pk")%>' ToolTip="Delete"><i class="fas fa-trash-alt"></i></asp:LinkButton></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
