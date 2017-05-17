<%@ Page Title="" Language="C#" MasterPageFile="~/admin_master.master" AutoEventWireup="true" CodeFile="Employee.aspx.cs" Inherits="Employee" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
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
    </style>
    <div class=" panel panel-info">
        <div class="panel-heading">
            <h5 class="panel-title">
                <asp:Label ID="lbl_title" CssClass="text-primary" runat="server" Text="Employee Entry Form"></asp:Label>
            </h5>
            <div>
                <label class="text-danger">All * fields are mandatory</label>
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="panel-body" style="background-color: #f9f8f8;">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-2">
                                <asp:Label ID="lbl_name" runat="server" Text="Name"></asp:Label>
                                <span class="text-danger">*</span>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_name" runat="server" MaxLength="30" ValidationGroup="vg" CssClass=" form-control" PlaceHolder="Enter Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_name" runat="server" ControlToValidate="txt_name" ErrorMessage="Name is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-2">

                                <asp:Label ID="lblActive" runat="server" Text="Active"></asp:Label>
                                <span class="text-danger">*</span>
                            </div>
                            <div class="col-sm-4">

                                <asp:DropDownList ID="ddl_Active" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                    <asp:ListItem Value="Y">YES</asp:ListItem>
                                    <asp:ListItem Value="N">NO</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RFV_Active" runat="server" ControlToValidate="ddl_Active" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Select Yes/No" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <asp:Label ID="lbl_mobile" runat="server" Text="Mobile No "></asp:Label>
                                <span class="text-danger">*</span>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_mobile" runat="server" MaxLength="10" ValidationGroup="vg" CssClass=" form-control" PlaceHolder="10 digit Mobile no."></asp:TextBox>
                                <asp:RegularExpressionValidator ID="rev_mobile" runat="server" ControlToValidate="txt_mobile" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Please Enter a valid Number" SetFocusOnError="True" ValidationExpression="^[1-9][0-9]{9}$" ValidationGroup="vg"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfv_mobile" runat="server" ValidationGroup="vg" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ControlToValidate="txt_mobile" ErrorMessage="Mobile Number Is Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-2">
                                <asp:Label ID="lbl_email" runat="server" Text="Email Id"></asp:Label><span class="text-danger">*</span>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txt_email" runat="server" MaxLength="60" ValidationGroup="vg" CssClass="form-control" PlaceHolder="Ex-ekta@gmail.com"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ref_email" runat="server" ControlToValidate="txt_email" ValidationGroup="vg" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ErrorMessage="Please Enter Email ID"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rev_email" runat="server" ControlToValidate="txt_email" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Please Enter Valid Email ID" SetFocusOnError="True" ValidationGroup="vg" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <asp:Label ID="lbl_state" runat="server" Text="State"></asp:Label><span class="text-danger">*</span>
                            </div>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddl_state" runat="server" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" ValidationGroup="vg" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfv_state" runat="server" ControlToValidate="ddl_state" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Select State" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-2">
                                <asp:Label ID="lbl_district" Text="District" runat="server"></asp:Label><span class="text-danger">*</span>
                            </div>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddl_district" runat="server" AutoPostBack="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddl_district_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfv_district" runat="server" ControlToValidate="ddl_district" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Select District" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-4" style="display: none;">
                                <asp:TextBox ID="txtDistrict_Other" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <asp:Label ID="Label1" Text="Department" runat="server"></asp:Label><span class="text-danger">*</span>
                            </div>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddl_department" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_department_SelectedIndexChanged" ValidationGroup="vg" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfv_department" runat="server" ControlToValidate="ddl_department" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Select Department" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-2">
                                <asp:Label ID="lbl_office" runat="server" Text="Office"></asp:Label><span class="text-danger">*</span>
                            </div>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddl_office" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_office_SelectedIndexChanged" ValidationGroup="vg" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfv_office" runat="server" ControlToValidate="ddl_office" CssClass="alert-danger" Display="Dynamic" ErrorMessage=" Please Select Office" SetFocusOnError="true" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <asp:HiddenField ID="empid" runat="server" />
                        <div class="form-group center">
                            <div class="col-sm-6"></div>
                            <div class="col-sm-6">
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass=" btn btn-primary" ValidationGroup="vg" OnClick="btn_submit_Click" />
                                <asp:Button ID="btn_update" runat="server" Text="Update" CssClass=" btn btn-primary" ValidationGroup="vg" Visible="false" />
                            </div>
                        </div>
                    </div>
                    <asp:Panel runat="server" ID="pnl_grid" ScrollBars="Both" CssClass="panel panel-info">
                        <div class="row">
                            <asp:Label ID="lbl_count" runat="server" CssClass="text-primary bold"></asp:Label>
                        </div>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="20" OnRowUpdating="GridView1_RowUpdating"
                            AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="state_id,id,state,dist,depnm,office,dist_id,ofc_id,dept_id"
                            OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                            CssClass="table table-striped table-bordered  table-hover table-grid" AutoGenerateEditButton="True">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#507CD1" HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="S.No. ">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1%>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="left" />
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Employee Id" DataField="id" ReadOnly="true" Visible="false" />

                                <asp:TemplateField HeaderText="Employee Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_empName" runat="server" Text='<%#Eval("empname") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_Emp_Name" runat="server" MaxLength="20" Text='<%#Eval("empname") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv_emp_name" runat="server" ControlToValidate="txt_Emp_Name" CssClass="text-danger" ErrorMessage="Emp Name is Required" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Mobile No">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_mob_num" runat="server" Text='<%#Eval("mblname") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_mob_num" runat="server" MaxLength="10" Text='<%#Eval("mblname") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="rev_mobile_num" runat="server" ControlToValidate="txt_mob_num" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Please Enter a valid Number" SetFocusOnError="True" ValidationExpression="^[1-9][0-9]{9}$"></asp:RegularExpressionValidator>

                                        <asp:RequiredFieldValidator ID="rfv_mob_num" runat="server" ControlToValidate="txt_mob_num" CssClass="text-danger" ErrorMessage="Mobile Number is Required" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Email Id">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_email" runat="server" MaxLength="60" Text='<%#Eval("email") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="rev_email_id" runat="server" ControlToValidate="txt_email" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Please Enter Valid Email ID" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email" CssClass="text-danger" ErrorMessage="email is Required" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_State" runat="server" Text='<%#Eval("state") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_state" runat="server" OnSelectedIndexChanged="ddl_grid_state_SelectedIndexChanged" AutoPostBack="true" Enabled="false"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_grid_state" runat="server" ControlToValidate="ddl_state" CssClass="text-danger" Display="Dynamic" ErrorMessage=" Please Select State" SetFocusOnError="true" InitialValue="0"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="District">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_District" runat="server" Text='<%#Eval("dist") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_district" runat="server" OnSelectedIndexChanged="ddl_grid_district_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_grid_district" runat="server" ControlToValidate="ddl_district" CssClass="text-danger" Display="Dynamic" ErrorMessage=" Please Select district" SetFocusOnError="true" InitialValue="0"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Department" runat="server" Text='<%#Eval("depnm") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_department_grid" runat="server" OnSelectedIndexChanged="ddl_grid_department_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_grid_dept" runat="server" ControlToValidate="ddl_department_grid" CssClass="text-danger" Display="Dynamic" ErrorMessage=" Please Select State" SetFocusOnError="true" InitialValue="0"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Office">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Office" runat="server" Text='<%#Eval("office") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_office" runat="server"></asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_grid_ofc" runat="server" ControlToValidate="ddl_office" CssClass="text-danger" Display="Dynamic" ErrorMessage=" Please Select State" SetFocusOnError="true" InitialValue="0"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
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

