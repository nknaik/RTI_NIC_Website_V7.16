﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin_master.master" AutoEventWireup="true" CodeFile="createRoll.aspx.cs" Inherits="dio_create_roll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_MasterLogin" runat="Server">
    <style type="text/css">
         
        td, th {
            padding: 2px !important;
        }
    </style>
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
                Roll Adding Form
            </div>
        </div>
        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">
                    <div class="col-sm-4">
                          <asp:Label ID="Label1" Text="Role Name" runat="server"></asp:Label><span class="text-danger">*</span>
                       
                        <asp:TextBox ID="txt_role_name" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_rollname" ControlToValidate="txt_role_name" CssClass="alert-danger" runat="server" ErrorMessage="required"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-sm-4">
                          <asp:Label ID="Label2" Text="Active" runat="server"></asp:Label><span class="text-danger">*</span>

                        
                        <asp:DropDownList ID="ddl_active" CssClass="form-control" runat="server">
                            <asp:ListItem Value="0">select</asp:ListItem>
                            <asp:ListItem Value="Y">Active</asp:ListItem>
                            <asp:ListItem Value="N">Deactive</asp:ListItem>

                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_ddl" ControlToValidate="ddl_active" CssClass="alert-danger" InitialValue="0" runat="server" ErrorMessage="required"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-sm-4">
                            <asp:Label ID="Label3" Text="Welcome Page " runat="server"></asp:Label> 

                       
                        <asp:TextBox ID="txt_de_page" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_welcomepg" ControlToValidate="txt_de_page" CssClass="alert-danger" runat="server" ErrorMessage="required"></asp:RequiredFieldValidator>

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <asp:Button ID="btn_save" CssClass="button button-3d button-black nomargin" OnClick="btn_save_Click" runat="server" Text="Save" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lbl_count" runat="server" CssClass="text-primary bold"></asp:Label>
                    </div>
                </div>
                <asp:GridView ID="grd_Office" runat="server" AllowPaging="true" PageSize="20" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                    CssClass="table table-striped table-bordered  table-hover table-grid mydatagrid" OnPageIndexChanging="grd_Office_PageIndexChanging">
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
                        <asp:BoundField HeaderText="Roll Name" DataField="RoleName">
                            <ItemStyle HorizontalAlign="left" />
                            <HeaderStyle HorizontalAlign="left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="WelcomePage" HeaderText="Welcome Page ">
                            <ItemStyle HorizontalAlign="left" />
                            <HeaderStyle HorizontalAlign="left" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="" Visible="false">
                            <ItemTemplate>
                                <asp:Label Visible="false" runat="server" ID="lbl_id" Text='<%# Bind("Role_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--  <asp:BoundField DataField="mobile" HeaderText="Contact  ">
                                        <ItemStyle HorizontalAlign="left" />
                                        <HeaderStyle HorizontalAlign="left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="email" HeaderText="Email ID  ">
                                        <ItemStyle HorizontalAlign="left" />
                                        <HeaderStyle HorizontalAlign="left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ofc_url" HeaderText="Office url  ">
                                        <ItemStyle HorizontalAlign="left" />
                                        <HeaderStyle HorizontalAlign="left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="basedept" HeaderText="Base Department">
                                        <ItemStyle HorizontalAlign="left" />
                                        <HeaderStyle HorizontalAlign="left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ofclvl" HeaderText="Office Level">
                                        <ItemStyle HorizontalAlign="left" />
                                        <HeaderStyle HorizontalAlign="left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="district" HeaderText=" Office District">
                                        <ItemStyle HorizontalAlign="left" />
                                        <HeaderStyle HorizontalAlign="left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="address" HeaderText="Address Of Office">
                                        <ItemStyle HorizontalAlign="left" />
                                        <HeaderStyle HorizontalAlign="left" />
                                    </asp:BoundField>--%>
                    </Columns>
                    <EmptyDataTemplate>Action  Records Not Available</EmptyDataTemplate>
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="left" CssClass="cssPager" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

