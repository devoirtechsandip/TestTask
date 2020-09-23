<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="CreateNewTicketMaster.aspx.cs" Inherits="CreateNewTicketMaster" %>

<%--<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    <title>Create New Ticket</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <!-- bootstrap wysihtml5 - text editor -->
    <%--<link rel="stylesheet" href="..\plugins\bootstrap-wysihtml5\bootstrap3-wysihtml5.min.css" />--%>
    <link href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" />
    <style type="text/css">
        fieldset{
            display: block;
    margin-left: 2px;
    margin-right: 2px;
    padding-top: 0.35em;
    padding-bottom: 0.625em;
    padding-left: 0.75em;
    padding-right: 0.75em;
    border: 1px solid #ccc;
        }
        legend{
            display: block;
    width: auto;
    padding: 0px;
    margin-bottom: 0px;
    font-size: 15px;
    font-weight: bold;
    line-height: inherit;
    color: #333;
    border: 0;
    /*border-bottom: 1px solid #ccc;*/

        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pagecontents" runat="Server">

    <section class="content-header">
        <h1>Create New Ticket
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
                        <h3 class="box-title">Create New Ticket</h3>
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
                                <asp:Label ID="Label2" runat="server" Text="Subject"></asp:Label><asp:Label runat="server" ID="Label13" Text=" *" ForeColor="Red" Font-Bold="true"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is required." ControlToValidate="txtsubject" ForeColor="Red" Display="Static"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtsubject" runat="server"  autocomplete="off" CssClass="form-control" ValidationGroup="vg"></asp:TextBox>
                                

                            </div>

                        </div>
                        <br /> 
                        <div class="row">
                            <div class="col-md-12">
                                <asp:Label ID="lbldescription" runat="server" Text="Description"></asp:Label><asp:Label runat="server" ID="Label10" Text=" *" ForeColor="Red" Font-Bold="true"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Static" ForeColor="Red" runat="server" ControlToValidate="txtTextArea" ErrorMessage="Please select a Description."></asp:RequiredFieldValidator>
                <%--<asp:TextBox class="textarea" placeholder="Place some text here" ValidationGroup="vg" runat="server" cols="10" rows="4" ID="txtTextArea"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></asp:TextBox>--%>

<textarea class="textarea" placeholder="Place some text here"
                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" ID="txtTextArea" runat="server"></textarea>
          </div>
                            </div>
                       <br /> 
                            <div class="row">
                             <div class="col-md-12">
                                <asp:Label ID="Label3" runat="server" Text="Category"></asp:Label><asp:Label runat="server" ID="Label5" Text=" *" ForeColor="Red" Font-Bold="true"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" InitialValue="Please Select" Display="Static" ForeColor="Red" runat="server"  ControlToValidate="ddlCategory" ErrorMessage="Please select a Category."></asp:RequiredFieldValidator>
                                 <asp:DropDownList ID="ddlCategory" ValidationGroup="vg" runat="server" CssClass="form-control"></asp:DropDownList>
                                 </div>
                            </div>
                        <br /> 
                        <div class="row">
                             <div class="col-md-12">
                                <asp:Label ID="Label1" runat="server" Text="Priority"></asp:Label><asp:Label runat="server" ID="Label4" Text=" *" ForeColor="Red" Font-Bold="true"></asp:Label>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="Please Select" Display="Static" ForeColor="Red" runat="server" ControlToValidate="ddlPriority" ErrorMessage="Please select a Priority."></asp:RequiredFieldValidator>
                                 <asp:DropDownList ID="ddlPriority" ValidationGroup="vg" runat="server" CssClass="form-control"></asp:DropDownList>
                                  </div>
                            </div>
                        <br /> 
                         <div class="row">
                             <div class="col-md-12">
                                 <asp:Label ID="Label8" runat="server" Text="Attachment" />
                                 <fieldset>
                                     <legend>Attach Files (+)</legend>
                                     <asp:FileUpload ID="FileUpload1"  runat="server" AllowMultiple="true"></asp:FileUpload>
                                 </fieldset>
                                 
                                  </div>
                            </div>
                        <br /> 
                        <div class="row">
                          <div class="col-md-3">
                               <%-- <asp:CheckBox ID="CheckBox1" runat="server"></asp:CheckBox>
                                <asp:Label ID="Label6" runat="server" Text="I'm not a robot"></asp:Label>--%>
                              
                                     <asp:UpdatePanel ID="UP1" runat="server">

                        <ContentTemplate>

                            <table>
                                <tr>
                                    <td style="height: 50px; width: 200px;">

                                        <asp:Image ID="imgCaptcha" runat="server" style="width: 180px;height: 34px;margin-bottom: 16px;" />
                                       
                                    </td>
                                    
                                    <td valign="middle">

                                        <%--<asp:Button ID="btnRefresh" runat="server" CausesValidation="false" Text="Refresh" style="margin-left:10px;" OnClick="btnRefresh_Click" />--%>
                                        <asp:LinkButton ID="btnRefresh" runat="server" CssClass="btn btn-primary"  CausesValidation="false" style="padding: 0px;min-width: 40px;min-height: 34px;margin-bottom:16px" ToolTip="Refresh" OnClick="btnRefresh_Click"><i class="fas fa-redo-alt" style="padding-top:10px;"></i></asp:LinkButton>
                                    </td>

                                </tr>

                            </table>

                        </ContentTemplate>

                    </asp:UpdatePanel>
                              </div>
                            <div class="col-md-9 col-xs-12">
                    <asp:TextBox ID="txtCaptcha" runat="server" autocomplete="off" CssClass="form-control" placeholder="Enter Captcha Code"></asp:TextBox>
                    <br />
                    <span style="color: Red; font-weight: bold"> 
                        <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>

                      
        </div>
   </div>
                          <div class="row">
                            <div class="col-md-2">
                                <asp:Button ID="submit" runat="server" Text="Submit" class="btn btn-success btnsubmit margin form-control" ValidationGroup="vg" CausesValidation="false" OnClick="submit_Click" />
                                <asp:Button ID="update" runat="server" Text="Update" class="btn btn-primary btnsubmit margin form-control" CausesValidation="false" Visible="false"  />
                                </div>
                              <div class="col-md-2">
                                <asp:Button runat="server" ID="btnReset" Text="Reset" class="btn btn-default btnsubmit margin form-control" CausesValidation="false" OnClick="btnReset_Click" />
                            </div>
                              </div>
                            <asp:Label ID="lblpk" runat="server" Text="pk" Visible="false"></asp:Label>
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
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
