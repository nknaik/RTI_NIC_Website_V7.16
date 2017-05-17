<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Login" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_MasterLogin" runat="Server">
    <style type="text/css">
        .lol {
            color: red;
        }
    </style>
    <div class="contact-page" id="contact_page">
        <br />
        <div class="container ">
            <div class="row">

                <div class="col-sm-3" style="border: 1px solid #808080; border-radius: 8px">
                    <div class="contact-heading text-justify" style="padding-top: 5px">
                        <h4>This portal is to file RTI application/first appeal online along with payment gateway. Fee payment can be made through Internet Banking/Debit Card/Credit Card. Through this portal RTI application/first appeal can be filed by Indian Citizen only for the Departments/Public Authorities of the Government of Chhattisgarh. 

                        Please read instructions carefully while submitting the RTI application/first appeal.</h4>
                    </div>
                    <div class="clearfix"></div>
                    <br />
                </div>

                <div class="col-sm-1"></div>

                <div class="col-sm-5" style="border: 1px solid #808080; border-radius: 8px;">
                    <div class="contact-heading text-center">
                        <h3>Login </h3>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-3">

                            <b>
                                <asp:Label ID="lblActive" runat="server" Text="User ID"></asp:Label></b>
                            <span class="lol">*</span>

                            <%-- <label>User ID</label>
                            <span class="lol">*</span>--%>
                        </div>

                        <div class="col-sm-9">
                            <asp:TextBox ID="txt_usr_id" CssClass="form-control" CausesValidation="true" MaxLength="20" ValidationGroup="rt" runat="server"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RFV_UserID" runat="server" ControlToValidate="txt_usr_id" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Required Field" ValidationGroup="rt"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <br />
                    <div class="form-group">
                        <div class="col-sm-3">
                            <b>
                                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></b>

                            <span class="lol">*</span>

                            <%--                            <label>Password</label>
                            <span class="lol">*</span>--%>
                        </div>
                        <div class="col-sm-9">
                            <asp:TextBox ID="txt_pass" CssClass="form-control" CausesValidation="true" TextMode="Password" MaxLength="20" ValidationGroup="rt" runat="server"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RFV_Password" runat="server" ControlToValidate="txt_pass" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Required Field" ValidationGroup="rt"></asp:RequiredFieldValidator>
                            <asp:HyperLink ID="HL_FORGET_PASS" runat="server" NavigateUrl="~/Forget_password.aspx">Forget Password</asp:HyperLink>

                        </div>

                    </div>


                    <div class="form-group">

                        <div class="col-sm-3"></div>
                        <div class="col-sm-7" style="padding-top: 10px">
                            <cc1:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
                                CaptchaHeight="60" CaptchaWidth="200" CaptchaMinTimeout="5" CaptchaMaxTimeout="240"
                                FontColor="#D20B0C" NoiseColor="#B1B1B1" ValidationGroup="rt" />
                        </div>
                        <div class="col-sm-2">
                            <asp:ImageButton ImageUrl="~/refresh.png" runat="server" CausesValidation="false" />
                        </div>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Invalid Captcha. Please try again." ValidationGroup="rt" OnServerValidate="ValidateCaptcha"></asp:CustomValidator>

                    </div>
                    <div class="form-group" style="margin-top: -50px">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-7">
                            <p>(Enter the text shown in image)</p>
                        </div>

                    </div>

                    <div class="form-group">
                        <div class="col-sm-3">
                        </div>
                        <div class="col-sm-9 text-center" style="margin-top: -30px; padding-top: 10px">
                            <asp:TextBox ID="txt_captcha" CssClass="form-control" CausesValidation="true" MaxLength="10" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_captcha" runat="server" ValidationGroup="rt" ErrorMessage="Sequrity code required" SetFocusOnError="true" CssClass="alert-danger" Display="Dynamic" ControlToValidate="txt_captcha"></asp:RequiredFieldValidator>
                            <asp:Label ID="Label1" runat="server" Visible="false" ForeColor="#CC0000" Text="Label"></asp:Label>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <br />
                    <div class="form-group">
                        <div class="col-sm-3"></div>

                        <div class="col-sm-3 text-right">
                            <asp:Button ID="Button1" CssClass="button button-3d button-black nomargin btn btn-primary" runat="server" Text="Submit" ValidationGroup="rt" />
                        </div>
                        <div class="col-sm-3">
                            <asp:Button ID="Button2" runat="server" CausesValidation="false" CssClass="button button-3d button-black nomargin btn btn-primary" OnClick="Button2_Click" Text="Clear" />
                        </div>
                        <div class="col-sm-3">
                            <asp:LinkButton ID="lnk_signup" runat="server" Text="Not Registered?" CssClass="text-primary" OnClick="lnk_signup_Click"></asp:LinkButton>

                        </div>

                    </div>
                    <div class="clearfix"></div>
                    <br />



                </div>

                <div class="col-sm-1">
                </div>



                <div class="col-sm-2" style="border: 1px solid #808080; border-radius: 8px; padding-bottom: 173px">
                    <div class="contact-heading ">
                        <h3>RTI Data</h3>
                        <ul>
                            <li>
                                <a href="report.aspx">Total Employee&nbsp;&nbsp;&nbsp;  
                                        <asp:Label ID="lbl_employee_count" runat="server" ReadOnly="true"></asp:Label>

                                </a></li>
                            &nbsp;
                            <li><a href="report1.aspx">Total Department&nbsp;&nbsp;&nbsp;  
                                    <asp:Label ID="lbl_department_count" runat="server" ReadOnly="true"></asp:Label>

                            </a></li>
                            &nbsp;
                            <li><a href="office.aspx">Office&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lbl_office_count" runat="server" ReadOnly="true"></asp:Label>

                            </a></li>
                            &nbsp;
                          <%--  <li><a href="PIO.aspx">
                                
                                    Total Public Information Officer
                                    <asp:Label ID="lbl_officer" runat="server" ReadOnly="true"></asp:Label>
                                
                            </a></li>--%>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="form-group"></div>
</asp:Content>

