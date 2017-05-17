﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Rti_detail.aspx.cs" Inherits="user_Rti_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        td, th {
            padding: 2px !important;
        }
    </style>
    <div class="form-horizontal">
        <div class="panel">
            <div class=" panel-heading">
                <h3 class="center" style="color:#4B4B4B">RTI DETAILS </h3>
            </div>
            
                   
               
            <div class="panel-body ">
                <div class="form-group">
                     <asp:Label ID="lbl_count" runat="server" CssClass="text-primary bold"></asp:Label>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="10" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                        CssClass="table table-striped table-bordered  table-hover table-grid" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <FooterStyle BackColor="#507CD1" HorizontalAlign="left" VerticalAlign="Middle" Font-Bold="True" ForeColor="White" />
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
                            <asp:TemplateField HeaderText="RTI Request ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_id" OnClick="lnk_id_Click" runat="server" CausesValidation="false" CommandArgument='<%# Eval("RequestID","{0}") %>' Text='<%# Bind("RequestID") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>
                            <%--  <asp:BoundField HeaderText="RTI Request ID"  DataField="RequestID" >
                                            <ItemStyle HorizontalAlign="left"  />
                                            <HeaderStyle HorizontalAlign="left" />
                                        </asp:BoundField>--%>

                            <asp:BoundField HeaderText="Applicant Name" DataField="ApplicantName">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="subject" HeaderText="Subject Of RTI">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="status" HeaderText="Status">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="action" HeaderText="Action Taken">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>

                            <asp:BoundField DataField="officer" HeaderText="Name Of Officer">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="office" HeaderText="Name Of Office">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="department" HeaderText="Name Of Department">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                        </Columns>
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="6" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="left" CssClass="cssPager" />
                    </asp:GridView>
                </div>

                <%--<div class="form-group">
                    <asp:GridView ID="grd_rti_dtl" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="false" ShowHeaderWhenEmpty="false"
                        CssClass="table table-striped table-bordered  table-hover table-grid" OnPageIndexChanging="grd_rti_dtl_PageIndexChanging">
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
                            <asp:TemplateField HeaderText="RTI Request ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_id" OnClick="lnk_id_Click" runat="server" CausesValidation="false" CommandArgument='<%# Eval("RequestID","{0}") %>' Text='<%# Bind("RequestID") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Applicant Name" DataField="ApplicantName">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="subject" HeaderText="Subject Of RTI">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="status" HeaderText="Status">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="office" HeaderText="Name Of Office">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="officer" HeaderText="Name Of Officer">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="department" HeaderText="Name Of Department">
                                <ItemStyle HorizontalAlign="left" />
                                <HeaderStyle HorizontalAlign="left" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>Action  Records Not Available</EmptyDataTemplate>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="left" CssClass="cssPager" />
                    </asp:GridView>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
