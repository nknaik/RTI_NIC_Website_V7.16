<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="user_feedback" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
    
        var count1 = "500";
        var lent=0;
        function countChars() {
            document.getElementById("ContentPlaceHolder1_charcount").innerHTML = count1-lent;
            var text = document.getElementById("ContentPlaceHolder1_txt_feedback").value;
            lent = text.length;
            if (lent > count1) {
                text = text.substring(0, count1);
                document.getElementById("ContentPlaceHolder1_txt_feedback").value = text;
                return false;
            }
            document.getElementById("ContentPlaceHolder1_charcount").innerHTML = count1 - lent;
        }

        
    </script>

    <div class="form-horizontal">
        <div class="panel panel-info">
            <div class="panel-heading panel-collapse">
                <div class="title-border-color text-center">
                    <h3>FEEDBACK</h3>
                </div>
            </div>
            <div class="panel panel-body ">
                <div class="container">
                    <div class=" form-group">
                        <div class=" col-sm-12 text-primary">
                            <label class=" text-primary">We welcome your feedback and suggestions about the Portal to help us improve further and serve you better.</label>
                        </div>
                        <div class="col-sm-4 text-left text-warning ">
                            All <span class="text-danger">*</span> Fields Are mandatory 
                        </div>
                    </div>
                </div>
                <div class="container">
                    <asp:UpdatePanel ID="udp" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                        <div class="col-sm-3">
                            subject of Feedback :<span class="text-danger">*</span>
                        </div>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="ddl_subject" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_subject_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="0">Select Subject</asp:ListItem>
                                <asp:ListItem Value="1">WebSite Content</asp:ListItem>
                                <asp:ListItem Value="2">Form Filling</asp:ListItem>
                                <asp:ListItem Value="3">Navigation in website</asp:ListItem>
                                <asp:ListItem Value="4">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfv_ddl" runat="server" ValidationGroup="vg" SetFocusOnError="true"
                                 ControlToValidate="ddl_subject" ErrorMessage="Subject Is Required" Display="Dynamic" InitialValue="0"
                                 CssClass="alert-danger" ></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group" id="div_sub" runat="server" visible="false">
                    <div class="col-sm-3">Please Specify</div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txt_sub" runat="server" CssClass="form-control" ValidationGroup="vg"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_txt_sub" runat="server" ControlToValidate="txt_sub"  ValidationGroup="vg"
                             SetFocusOnError="true" ErrorMessage="Subject Is Required" Display="Dynamic" CssClass="alert-danger" Enabled="false" />
                    </div></div>
                 
                  
                       <div class="form-group">
                        <div class="col-sm-3">
                            Your Valuable Feedback <span class="text-danger">*</span>
                        </div>
                        <div class="col-sm-6    ">
                            <asp:TextBox ID="txt_feedback" runat="server" ValidationGroup="vg" TextMode="MultiLine" CssClass="form-control" onkeyup="countChars();" placeholder="Your Massage Here And We Will Answer As Soon As Possible."></asp:TextBox>
                            <asp:Label runat="server" id="charcount" CssClass="text-danger" Text="500"></asp:Label> characters Remain.
                         <asp:RequiredFieldValidator ID="rfv_first_name" runat="server" ControlToValidate="txt_feedback" ErrorMessage="Feedback is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-sm-3"></div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-3 ">Enter Security Code <span class="text-danger">*</span> </div>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control" ValidationGroup="vg"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfv_captcha" runat="server" ControlToValidate="txtCaptcha" ErrorMessage="Security code is required is Required" Display="Dynamic" CssClass="alert-danger" SetFocusOnError="true" ValidationGroup="vg"></asp:RequiredFieldValidator>
                       
                        </div>
                        <div class="col-sm-3">
                            <cc1:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
                                CaptchaHeight="40" CaptchaWidth="270" CaptchaMinTimeout="5" CaptchaMaxTimeout="240"
                                FontColor="#D20B0C" NoiseColor="#B1B1B1" />
                        </div>
                        <div class="col-sm-3">
                            <asp:ImageButton ID="imgbtn_refresh" ImageUrl="~/refresh.png" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4">
                        </div>
                        <div class="col-sm-4 aligncenter">
                            <asp:Button ID="btn_submit" OnClick="btn_submit_Click" runat="server" ValidationGroup="vg" Text="Submit" CssClass="button button-3d button-black nomargin btn btn-primary"/>

                            
                       

                   
                        </div>
                              </ContentTemplate>
                    </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

