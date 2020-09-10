<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="PriorityMaster.aspx.cs" Inherits="PriorityMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pagecontents" Runat="Server">

    <section class="content-header">
        <h1>Priority
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <!-- /.box-header -->
                <!-- TABLE: Search Criteria -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Priority</h3>
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
                                <asp:Label ID="Label4" runat="server" Text="Priority"></asp:Label><asp:Label runat="server" ID="Label5" Text=" *" ForeColor="Red" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtpriority" runat="server" placeholder="Enter Priority" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Priority is required." ControlToValidate="txtpriority" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>

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
                                                <th>Priority</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>

                                        </thead>
                                        <tr id="itemPlaceholder" runat="server"></tr>

                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("Priority")%></td>
                                        <%--<td><asp:Button ID="btnupdate" runat="server" Text="Update" CommandName="update" CommandArgument='<%#Eval("pk")%>'></asp:Button></td>--%>
                                        <td>
                                            <asp:LinkButton ID="btnupdate" runat="server" CssClass="btn btn-primary" CausesValidation="false" CommandName="update" CommandArgument='<%#Eval("pk")%>' ToolTip="Update"><i class="fas fa-edit"></i></asp:LinkButton></td>
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


