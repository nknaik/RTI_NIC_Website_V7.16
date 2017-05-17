<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Detail_Rti.aspx.cs" Inherits="user_Detail_Rti" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function setTarget() {
            document.forms[0].target = "_blank";
        }
    </script>

    <style type="text/css">
        /*td, th {
            padding: 2px !important;
        }*/
    </style>
    <div class="form-horizontal ">
        <div class="panel panel-success panel-group">
            <div class="panel-heading ">
                <div class="panel-title center">
                    <h3>
                        <asp:Label ID="lbl_rti_Id" runat="server" CssClass=" text-primary"> RTI DETAIL</asp:Label>
                    </h3>
                </div>
            </div>
            <div class="panel-body">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" href="#Detailapplicatn" aria-expanded="true">Detail Of APPLICANT</a>
                        </h4>
                    </div>
                    <div id="Detailapplicatn" class="panel-collapse collapse in " aria-expanded="true">
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    Name : 
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="lbl_applicant_name" runat="server" CssClass=""></asp:Label>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    Gender :
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="Lbl_gender" runat="server" CssClass=""></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    Mobile Number :
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="lbl_mobile" runat="server" CssClass=""></asp:Label>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    Email ID :
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="lbl_email" runat="server" CssClass=""></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    Address :
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="Lbl_address" runat="server" CssClass=""></asp:Label>
                                </div>
                            </div>

                            <div class="form-group" id="div_state" runat="server">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    District :
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="lbl_district" runat="server" CssClass=""></asp:Label>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    State :
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="lbl_state" runat="server" CssClass=""></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    Country  :
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="Lbl_country" runat="server" CssClass=""></asp:Label>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    Pincode :
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="lbl_pincode" runat="server" CssClass=""></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    Subject:
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="lbl_subject" runat="server" CssClass=""></asp:Label>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2 text-primary">
                                    RTI Status:
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="lbl_status" runat="server"></asp:Label>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    Description :
                                </div>
                                <div class="col-sm-9">
                                    <asp:Label ID="lbl_detail" runat="server" CssClass=""></asp:Label>
                                </div>
                            </div>
                            <div class="form-group" runat="server" id="divfile">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    File Description : 
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="lbl_file_dtl" runat="server" CssClass=""></asp:Label>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2  text-primary">
                                    supporting File:
                                </div>
                                <div class="col-sm-3">
                                    <asp:LinkButton ID="lnk_file" runat="server" Text="" OnClientClick="setTarget();"  OnClick="lnk_file_Click"></asp:LinkButton>
                                    <%-- OnClientClick="aspnetForm.target ='_blank';"--%>
                                </div>
                            </div>
                            <div class="form-froup " id="div_pending" runat="server">
                                <div class="col-sm-12 text-center center">
                                    Your Rti Under Process Result Will Be Provided Soon
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-info " id="pnl_result" runat="server">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" href="#Dtlgrid" aria-expanded="true">RESULT OF RTI </a>
                        </h4>
                    </div>
                    <div id="Dtlgrid" class="panel-collapse collapse in">
                        <%--<asp:UpdatePanel ID="udp" runat="server">
                            <ContentTemplate>--%>
                        <div class="panel-body">

                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-2 text-primary">
                                        Result Description:
                                    </div>
                                    <div class="col-sm-9">
                                        <asp:Label ID="lbl_resultdesc" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div id="div_fees" runat="server" class="form-group">
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2 text-primary">
                                    Required fees:
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label runat="server" ID="lbl_fees_ammount"></asp:Label>
                                </div>
                                <div class="col-sm-1"></div>
                                <div class="col-sm-2 text-primary">
                                    Pay Fees:
                                </div>
                                <div class="col-sm-3">
                                    <asp:LinkButton ID="lnk_fees" runat="server" Text="click To Pay" OnClick="lnk_fees_Click"></asp:LinkButton>
                                </div>
                            </div>
                            <div id="Action_file" runat="server">
                                <div class="form-group">
                                    <div class="col-sm-1">
                                    </div>
                                    <div class="col-sm-2">
                                        <label class="text-primary">File Description :</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:Label ID="lbl_act_file_des" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-2">
                                        <label class="text-primary">File Provided : </label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:LinkButton ID="lnk_fil_action" runat="server" Text="Open" OnClientClick="setTarget();"  OnClick="lnk_fil_action_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" id="meet" runat="server">
                                <div class="col-sm-1">
                                </div>
                                <div class="col-sm-2 text-primary">
                                    Meting Date:                                        
                                </div>
                                <div class="col-sm-3">
                                    <asp:Label ID="lbl_date" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div id="div_meet" runat="server">
                                <div class="form-group">
                                    <div class="col-sm-1">
                                    </div>
                                    <div class="col-sm-2 text-primary">Select Meeting Date:<span class="text-danger">*</span></div>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="txt_meetdate" runat="server" ReadOnly="true" CssClass="form-control" ValidationGroup="vg" placeholder="DD-MM-YYYY">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv_meet_date" runat="server" CssClass="alert-danger" Display="Dynamic" ControlToValidate="txt_meetdate" SetFocusOnError="true" ValidationGroup="vg" ErrorMessage="Meeting Is Required Please select Meeting Date"></asp:RequiredFieldValidator>
                                        <asp:CalendarExtender ID="caltest" runat="server" TargetControlID="txt_meetdate" PopupButtonID="img_cal" Format="dd-MM-yyyy"></asp:CalendarExtender>
                                        <%--<asp:Calendar runat="server" ID="caltest" OnDayRender="caltest_DayRender" OnSelectionChanged="caltest_SelectionChanged" TitleStyle-BackColor="#ff9966" Visible="false"></asp:Calendar>
                                        --%>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:ImageButton runat="server" ID="img_cal" OnClick="img_cal_Click" ImageUrl="~/images/calendar-icon.png" Width="40" Height="40" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12 center">
                                        <asp:Button ID="btn_submit" runat="server" OnClick="btn_submit_Click" Text="submit" ValidationGroup="vg" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <%--  <asp:GridView ID="grd_rti_dtl" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="false" ShowHeaderWhenEmpty="false"
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
                                       
                                                                                <asp:BoundField DataField="action" HeaderText="Action Detail">
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
                                        <asp:BoundField DataField="department" HeaderText="Name Of Department">
                                            <ItemStyle HorizontalAlign="left" />
                                            <HeaderStyle HorizontalAlign="left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nameofficer" HeaderText="Name Of Officer">
                                            <ItemStyle HorizontalAlign="left" />
                                            <HeaderStyle HorizontalAlign="left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="action_date" HeaderText="Date Of Action">
                                            <ItemStyle HorizontalAlign="left" />
                                            <HeaderStyle HorizontalAlign="left" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>Your Rti Running Under Process </EmptyDataTemplate>
                                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="left" CssClass="cssPager" />
                                </asp:GridView>--%>
                        </div>
                    </div>
                    <%-- </ContentTemplate>
                        </asp:UpdatePanel>--%>
                </div>
            </div>
        </div>
    </div>
    <%--</div>--%>
</asp:Content>
