<%@ Page Title="" Language="C#" MasterPageFile="~/admin_master.master" AutoEventWireup="true" CodeFile="addNewAction.aspx.cs" Inherits="addNewAction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_MasterLogin" runat="Server">
    <style type="text/css">
        .pager {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }

        .mydatagrid a /** FOR THE PAGING ICONS  **/ {
            background-color: #4682b4;
            padding: 5px 5px 5px 5px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }

        .header {
            background-color: #646464;
            font-family: Arial;
            color: White;
            border: none 0px transparent;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }

        .mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
            background-color: #c9c9c9;
            color: #000;
            padding: 5px 5px 5px 5px;
        }

        .bold {
            font-family: Arial;
            font-size: larger;
            font-weight: 800;
        }
    </style>
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="panel-title">
                Add New action
            </div>
        </div>
        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">

                    <div class="col-sm-3">
                        <label>Action Name <span class="text-danger">*</span> </label>
                        <asp:TextBox ID="txt_action_name" MaxLength="20" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_action_name" ControlToValidate="txt_action_name" CssClass="alert-danger" runat="server" ErrorMessage="required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-sm-3">
                        <label>Action Id <span class="text-danger">*</span> </label>
                        <asp:TextBox ID="txtaction_id" MaxLength="4" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtaction_id" CssClass="alert-danger" runat="server" ErrorMessage="required"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-sm-3">
                        <label>Remark <span class="text-danger">*</span> </label>
                        <asp:TextBox ID="txtremark" MaxLength="50" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtremark" CssClass="alert-danger" runat="server" ErrorMessage="required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-sm-3">
                        <label>Display Order <span class="text-danger">*</span> </label>
                        <asp:TextBox ID="txtdisplay_order" MaxLength="3" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtdisplay_order" CssClass="alert-danger" runat="server" ErrorMessage="required"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <asp:Button ID="btn_save" CssClass="button button-3d button-black nomargin" OnClick="btn_save_Click1" runat="server" Text="Save" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lbl_count" runat="server" CssClass="text-primary bold"></asp:Label>
                    </div>
                </div>
                <asp:GridView ID="grd_Action" runat="server" AllowPaging="true" PageSize="10" OnPageIndexChanging="grd_Action_PageIndexChanging" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                    CssClass="table table-striped table-bordered" DataKeyNames="DDL_List_ID">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" HorizontalAlign="left" VerticalAlign="Middle" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="S.No.">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="left" />
                            <ControlStyle Width="10px" />
                            <HeaderStyle HorizontalAlign="left" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action Id" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="DDL_List_ID" Text='<%# Bind("DDL_List_ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Action Id">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="id" Text='<%# Bind("DDL_Name_Value") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action Name">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="action_name" Text='<%# Bind("DisplayName_en") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" OnClick="lnkdelete_Click" OnClientClick="return confirm('Are you sure you want delete');" runat="server" CausesValidation="false">Delete</asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>


                    </Columns>
                    <EmptyDataTemplate>Action Records Not Available</EmptyDataTemplate>
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="left" CssClass="cssPager" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

