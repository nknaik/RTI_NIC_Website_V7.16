﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin_master.master" AutoEventWireup="true" CodeFile="EmpOfficeMapAllocated.aspx.cs" Inherits="EmpOfficeMapAllocated" %>
<%@ Register Assembly="DropDownCheckBoxes" Namespace="Saplin.Controls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_MasterLogin" runat="Server">


    <style>
        .cssPager td {
            padding-left: 4px;
            padding-right: 4px;
        }
    </style>
    <style type="text/css">
        td, th {
            padding: 2px !important;
        }
         .dd_chk_select {
            padding-top: 6px !important;
            padding-bottom: 6px !important;
            padding-left: 30px !important;
            height: 34px !important;
        }
    </style>

    <div class="row">
        <div class="panel-collapse panel panel-default">
            <div class="panel-heading">

                <h5 class="panel-title">
                    <b>
                        <asp:Label ID="lbl_outer_panel" runat="server" Text="Employee Office Mapping Allocated"></asp:Label>
                    </b>
                </h5>
                <div>
                    <label class="text-danger">All * fields are mandatory</label>
                </div>
            </div>

</div>
        </div>

            <div class="panel-default">
                <div class="panel-heading">

                    <h5 class="panel-title">
                        <b>
                            <asp:Label ID="lbl_title" runat="server" Text="Select Employee"></asp:Label>
                        </b>
                    </h5>

                </div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="panel-body" style="background-color: #f9f8f8;">
                            <div class="form-horizontal">
                                <div class="form-group">

                                    <div class="col-sm-2">
                                        <asp:HiddenField runat="server" ID="h_roll_id" />
                                        <asp:Label ID="lbl_department1" runat="server" Text="Department Name:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">

                                        <asp:DropDownList ID="ddl_department1" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddl_department1_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_department1" runat="server" ControlToValidate="ddl_department1" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Select Department" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-sm-2">
                                        <asp:Label ID="lbl_district1" runat="server" Text="District:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div id="ddl_dist_view" runat="server">
                                        <div class="col-sm-4">
                                            <asp:DropDownList ID="ddl_district1" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddlDistrict1_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="rfv_district1" runat="server" ControlToValidate="ddl_district1" ErrorMessage="District is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div id="txt_dist_view" runat="server">
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txt_district1" runat="server" CssClass="form-control" ReadOnly="True" Visible="False"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <asp:Label ID="lbl_Employee1" runat="server" Text="Employee:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddl_employee1" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddl_employee1_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_employee1" runat="server" InitialValue="0" ControlToValidate="ddl_employee1" ErrorMessage="Employee is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-2">

                                        <asp:Label ID="lbl_office_Category1" runat="server" Text="Office Category :"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">

                                        <asp:DropDownList ID="ddl_office_Category1" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddl_office_Category1_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_office_category1" runat="server" ControlToValidate="ddl_office_Category1" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Enter Office Level" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <asp:Label ID="lbl_office_level1" runat="server" Text="Office Level:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddl_office_level1" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddl_office_level1_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_office_level1" runat="server" InitialValue="0" ControlToValidate="ddl_office_level1" ErrorMessage="Office Level is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-2">

                                        <asp:Label ID="lbl_office_name1" runat="server" Text="Office Name :"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">

                                        <asp:DropDownList ID="ddl_office_name1" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddl_office_name1_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_office_name1" runat="server" ControlToValidate="ddl_office_name1" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Enter Office Name" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2">

                                        <asp:Label ID="lbl_designation1" runat="server" Text="Designation Name:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">

                                        <asp:DropDownList ID="ddl_designation1" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_designation1" runat="server" ControlToValidate="ddl_designation1" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Select Designation" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
           

                <div class="panel-heading">

                    <h5 class="panel-title">
                        <b>
                            <asp:Label ID="Label3" runat="server" Text="Map Employee"></asp:Label>
                        </b>
                    </h5>

                </div>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="panel-body" style="background-color: #f9f8f8;">
                            <div class="form-horizontal">
                                <div class="form-group">

                                    <div class="col-sm-2">

                                        <asp:Label ID="lbldepartment" runat="server" Text="Department Name:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">

                                        <asp:DropDownList ID="ddl_department" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddlBaseDeptName_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_department" runat="server" ControlToValidate="ddl_department" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Select Department" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:Label ID="lbl_district" runat="server" Text="District:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddl_district" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_district" runat="server" ControlToValidate="ddl_district" ErrorMessage="District is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <asp:Label ID="lbl_office_category" runat="server" Text="Office Category:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddl_office_category" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddl_office_category_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_office_category" runat="server" InitialValue="0" ControlToValidate="ddl_office_category" ErrorMessage="Office category is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-2">

                                        <asp:Label ID="lbl_office_level" runat="server" Text="Office Level:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">

                                        <asp:DropDownList ID="ddl_office_level" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddl_office_level_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_office_level" runat="server" ControlToValidate="ddl_office_level" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Enter Office Level" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <asp:Label ID="lbl_office" runat="server" Text="Office Name:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddl_office" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddlOfficeName_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_office" runat="server" ControlToValidate="ddl_office" InitialValue="0" ErrorMessage="Office is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-2">

                                        <asp:Label ID="lbl_designation" runat="server" Text="Designation Name:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">

                                        <asp:DropDownList ID="ddl_designation" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_designation" runat="server" ControlToValidate="ddl_designation" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Select Designation" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                              
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-2">

                                        <asp:Label ID="lbl_active" runat="server" Text="Active"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">

                                        <asp:DropDownList ID="ddl_Active" runat="server" ValidationGroup="vg" CssClass="form-control">
                                            <asp:ListItem Value="0">----Select-----</asp:ListItem>
                                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                                            <asp:ListItem Value="N">No</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_active" runat="server" ControlToValidate="ddl_Active" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Select Yes/No" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:Label ID="lbl_charge" runat="server" Text="Charge Type:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddl_charge" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="RFV_charge" runat="server" ControlToValidate="ddl_charge" InitialValue="0" ErrorMessage="Charge is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                            </div>

                        </div>
                     
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <label class="text-primary">Select Permissions</label>
                                    </div>
                                    <div class="col-sm-4">
                                        <cc1:DropDownCheckBoxes ID="ddlcb_permission" runat="server" CssClass="form-control dd_chk_select" ValidationGroup="vg" UseButtons="true" UseSelectAllNode="true">
                                            <Texts OkButton="Confirm" CancelButton="Cancel" SelectAllNode="ALL" SelectBoxCaption="Select" />
                                            <Items>
                                            </Items>
                                        </cc1:DropDownCheckBoxes>
                                        <cc1:ExtendedRequiredFieldValidator ID="rfv_ddlcb_permission" runat="server" ControlToValidate="ddlcb_permission" ErrorMessage="Permissions is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg"></cc1:ExtendedRequiredFieldValidator>
                                    </div>
                                     <div class="col-sm-2">
                                        <asp:Label ID="Lbl_role" runat="server" Text="Role:"></asp:Label>
                                        <span class="text-danger">*</span>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="Ddl_role" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="Rfv_role" runat="server" ControlToValidate="Ddl_role" InitialValue="0" ErrorMessage="Role is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                        <div style="width: 100%; margin: 0px auto; text-align: center; padding: 10px 0px;">
                            </br>

                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="butt" ValidationGroup="vg" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btn_update" runat="server" Text="Update" CssClass="button button-3d button-black nomargin btn btn-primary" ValidationGroup="vg" Visible="false" />
                            
                        </div>


             

                        <div class="col-sm-12">
                            <asp:Label ID="lbl_count" runat="server" CssClass="text-primary bold"></asp:Label>
                        </div>
                    
                        
                        
                          <asp:Panel CssClass="panel" ScrollBars="Both" ID="panel_grid" runat="server" Wrap="true">
                          <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered  table-hover table-grid" AllowPaging="true" PageSize="10" Width="100%" ShowHeaderWhenEmpty="True" AlternatingRowStyle-CssClass="alt" ClientIDMode="Static" AutoGenerateColumns="False"
                                    OnPageIndexChanging="GridView1_PageIndexChanging" EmptyDataText="No Record Found." DataKeyNames="mapping_id">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No. ">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Employee Name">
                                            <ItemTemplate>
                                                <%#Eval("EmpName")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Office Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOfficeName" runat="server" Text='<%# Eval("officeName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Department Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDepartmentName" runat="server" Text='<%# Eval("DeptName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Office Level">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOfficeLevelName" runat="server" Text='<%# Eval("OfficeLevelName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="District Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDistName_En" runat="server" Text='<%# Eval("DistName_En") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Office Category Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOfficeCategoryName" runat="server" Text='<%# Eval("OfficeCategoryName") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Designation Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDesignationName" runat="server" Text='<%# Eval("Designation_Name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>

                                          <asp:TemplateField HeaderText="Role Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRoleName" runat="server" Text='<%# Eval(" role_name") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>

                               
                                        <asp:TemplateField HeaderText="Charge">
                                            <ItemTemplate>
                                                <%#Eval("ChangeTypeName")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Is Active">
                                            <ItemTemplate>
                                                <%#Eval("activeStatus")%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="left" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>No Records Available</EmptyDataTemplate>
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="left" CssClass="cssPager" />
                                </asp:GridView>
                              </asp:Panel>
                    
            </div>
        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
</asp:Content>

