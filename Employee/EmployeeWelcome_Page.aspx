<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeWelcome_Page.aspx.cs" Inherits="LoginOfficerDetail" MasterPageFile="~/Master_employee.master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .logintime {
            text-align: right;
        }

        .cssPager td {
            padding-left: 4px;
            padding-right: 4px;
        }

        .gridCellBoldRed {
            font-weight: bold;
            color: black;
        }

        .badge {
            padding: 1px 9px 2px;
            font-size: 24.025px;
            font-weight: bold;
            white-space: nowrap;
            color: #ffffff;
            background-color: #999999;
            -webkit-border-radius: 9px;
            -moz-border-radius: 9px;
            border-radius: 9px;
        }

        .list-group-item {
            padding: 1px 9px 2px;
        }

        .list-group {
            padding: 1px 400px 2px;
        }
    </style>

    <div class="panel panel-success">
        <div class="panel-heading">
            <div class="panel-title">
                Wel Come:
                    <asp:Label ID="lbl_UserName" runat="server" Text="Label" CssClass="text-primary"></asp:Label>
            </div>
            <div class="left">
            </div>

        </div>
        <div class="panel-body">
            <asp:UpdatePanel runat="server" ID="up_office_designation">
                <ContentTemplate>
                    <div class="form-horizontal">
                        <div class="panel panel-info">
                            <div class="panel-heading center">
                                RTI  SUBMITTED
                            </div>


                            <div class="panel-body">
                                <div class="form-horizontal">

                                    <div class="form-group left">


                                        <div class="col-sm-8">
                                        </div>

                                        <div class="col-sm-4" style="font-size: 18px">

                                           <%-- <div style="padding-right: 20px">
                                                
                                            </div>--%>
                                             <asp:Label ID="Label3" runat="server" CssClass=" text-primary " Font-Bold="true" Text="RTI:"></asp:Label>&nbsp;

                                            <asp:Label ID="lbltotal" runat="server" CssClass=" text-primary " Font-Bold="true" Text="Total"></asp:Label>&nbsp;
                                             <asp:Label ID="lbl_Request_Registered" runat="server" CssClass=" text-primary " Font-Bold="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="Label1" runat="server" CssClass=" text-primary " Font-Bold="true" Text="Pending"></asp:Label>&nbsp;
                                            <asp:Label ID="lbl_Request_Pending" runat="server" CssClass=" text-primary " Font-Bold="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="Label2" runat="server" CssClass=" text-primary " Font-Bold="true" Text="Completed"></asp:Label>&nbsp;
                                            <asp:Label ID="lbl_Request_DisposedOf" runat="server" CssClass=" text-primary " Font-Bold="true"></asp:Label>
                                        </div>
                                    </div>



                                    <%--<ul class="list-group">
                                        <big>
                                        <li class="list-group-item">
                                            <span class="badge">
                                                <asp:Label ID="lbl_Request_Registered" runat="server" Text="0"></asp:Label></span>
                                            Total
                                        </li>
                                        <li class="list-group-item">

                                            <span class="badge">
                                                <asp:Label ID="lbl_Request_Pending" runat="server" Text="0"></asp:Label></span>
                                            Pending
                                        </li>
                                        <li class="list-group-item">
                                            <span class="badge">
                                                <asp:Label ID="lbl_Request_DisposedOf" runat="server" Text="0"></asp:Label></span>
                                            Completed
                                        </li>
                                            </big>
                                    </ul>--%>

                                    <div class="form-group center">
                                        <asp:Label ID="lbl_count" runat="server" CssClass=" text-primary " Font-Bold="true"></asp:Label>
                                        <asp:Panel CssClass="panel" ScrollBars="Both" ID="panel_grid" runat="server" Wrap="true">
                                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="10"
                                                AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" DataKeyNames="rti_id"
                                                OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GV_OnRowDataBound"
                                                CssClass="table table-comparison table-responsive ">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle BackColor="#dff0d8" HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True" ForeColor="#577db7" />
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No. ">
                                                        <ItemTemplate>
                                                            <%#Container.DataItemIndex+1%>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="left" />
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField HeaderText="RTI ID" DataField="rti_id" />
                                                    <asp:BoundField HeaderText="Name" DataField="Applicant_Name_en" />
                                                    <asp:BoundField HeaderText="Gender" DataField="Gender" />
                                                    <asp:BoundField HeaderText="Mobile Number" DataField="Mobile_No" />
                                                    <asp:BoundField HeaderText="Subject" DataField="rti_Subject" />
                                                    <asp:BoundField HeaderText="BPL" DataField="Is_BPL" />
                                                    <asp:BoundField HeaderText="RTI Filed Date" DataField="rti_DateTime" />

                                                    <asp:BoundField HeaderText="Action Status" DataField="DeptStatus" />
                                                    <asp:BoundField HeaderText="RTI Status" DataField="rti_status" />
                                                    <asp:TemplateField HeaderText="Do Action">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkrti_id" OnClick="lnkrti_id_Click" CommandArgument='<%# Eval("rti_id","{0}" )%>' Text="Take Action" runat="server" CausesValidation="false"></asp:LinkButton>
                                                            <%--<asp:LinkButton ID="LinkButton1" OnClick="lnkrti_id_Click" CommandArgument='<%# Eval("rti_id","{0}" )%>' Text='<%#Eval("rti_id") %>' runat="server" CausesValidation="false"></asp:LinkButton>--%>
                                                            <asp:HiddenField ID="lbl_Isnew" runat="server" Value='<%# Eval("IsNew") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>No Records Available</EmptyDataTemplate>
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="left" CssClass="cssPager" Wrap="true" />
                                            </asp:GridView>
                                        </asp:Panel>
                                    </div>
                                </div>
                            </div>
                        </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
