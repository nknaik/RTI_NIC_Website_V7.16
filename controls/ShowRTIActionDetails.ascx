﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ShowRTIActionDetails.ascx.cs" Inherits="controls_ShowRTIActionDetails" %>
<style type="text/css">
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

<div class="panel-body" style="background-color: #f9f8f8;">
    <div class="form-horizontal">

        <div class="panel">
            <div class=" panel-heading">
                <h3 class="center" style="color: #4B4B4B">Action Details </h3>
            </div>

            <div class="panel-body ">
                <div class="form-group">
                    <div class="col-sm-2">
                        <label class="control-label">RTI ID </label>
                    </div>
                    <div class="col-sm-4">
                        <asp:HiddenField ID="h_Roll_ID" runat="server" />
                        <asp:TextBox ID="txt_rti_id" runat="server" CssClass=" form-control" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_rti_id" runat="server" ControlToValidate="txt_rti_id" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please Enter RTI ID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>

                    <div runat="server" id="div_security">
                        <div class="col-sm-2">
                            <label class="control-label">Security Code </label>
                        </div>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtScurity" runat="server" CssClass=" form-control" MaxLength="4"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_security" runat="server" ControlToValidate="txtScurity" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please Enter Security Code" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <br />

                <div class="form-group">
                    <div class="col-sm-5"></div>
                    <div class="col-sm-6">
                        <asp:Button ID="btn_submit" runat="server" align="center" CssClass="button button-3d button-black nomargin btn btn-primary" Text="Submit" OnClick="btn_submit_Click"></asp:Button>

                    </div>
                </div>

                <div>
                    <asp:Label ID="lbl_count" runat="server"></asp:Label>
                </div>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="10"
                    AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="rti_id"
                    OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GV_OnRowDataBound"
                    CssClass="table table-striped table-bordered  table-hover table-grid">
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


                        <asp:BoundField HeaderText="Action Details" DataField="action_detail" />
                        <asp:BoundField HeaderText="District Name" DataField="District_Name_En" />
                        <asp:BoundField HeaderText="Department Name" DataField="dept_name" />
                        <asp:BoundField HeaderText="Office Name" DataField="OfficeName" />
                        <%--<asp:BoundField HeaderText="Officer Code" DataField="emp_code" />--%>
                        <asp:BoundField HeaderText="Officer Name" DataField="Emp_Name" />

                        <asp:BoundField HeaderText="RTI Status" DataField="rti_status" />
                        <asp:BoundField HeaderText="Action Date" DataField="action_date" />
                        <asp:BoundField HeaderText="RTI Date Time" DataField="rti_date" />
                        <asp:BoundField HeaderText="Is Meeting" DataField="IsMeeting" />
                        <asp:BoundField HeaderText="Meeting Date" DataField="meeting_date" />

                        <asp:TemplateField HeaderText="File">
                            <ItemTemplate>

                                <asp:HyperLink runat="server" NavigateUrl='<%# Eval("file_ID", "~/ActionFileHandler.ashx?fileid={0}") %>' Target="_blank" Text="View File" />
                                <%--<asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/ActionFileHandler.ashx?fileid={0}&di={1}", Eval("file_ID"), Eval("district_id_ofc") ) %>'   Text='<%# Eval("file_ID") %>' />--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- <asp:TemplateField >
                                    <ItemTemplate>
                                         <asp:HiddenField ID="lbl_Isnew" runat="server" Value='<%# Eval("IsNew") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                    </Columns>

                    <EmptyDataTemplate>No Records Available</EmptyDataTemplate>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="left" CssClass="cssPager" />
                </asp:GridView>
            </div>
        </div>

    </div>

</div>
