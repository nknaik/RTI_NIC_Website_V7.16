<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="RTIRequest.aspx.cs" Inherits="RTIRequest" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .hide {
            display: none;
        }

        .show {
            display: block;
        }

        .divcss {
            background-color: #f00;
            width: 100px;
            height: 10px;
        }

        .txtbox {
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            border-bottom-left-radius: 20px;
            border-bottom-right-radius: 20px;
        }


        .lol label {
            border: none;
            margin-right: 5px;
            margin-left: 5px;
        }

        .lol1 {
            color: red;
        }

        /* Change the link color to #111 (black) on hover */


        .lol2 {
            height: 3px;
        }

        .b label {
            font-weight: normal;
        }
    </style>

    <script type="text/javascript">

        var count1 = "500";
        function limiterRTI() {

            document.getElementById("ContentPlaceHolder1_limit").innerHTML = count1;
            var text = document.getElementById("ContentPlaceHolder1_txt_RequestApplicationText").value;
            var lent = text.length;
            if (lent > count1) {
                text = text.substring(0, count1);
                document.getElementById("ContentPlaceHolder1_txt_RequestApplicationText").value = text;
                return false;
            }
            document.getElementById("ContentPlaceHolder1_limit").innerHTML = count1 - lent;
        }

        var count2 = "100";
        function limiterAdd() {

            document.getElementById("ContentPlaceHolder1_limit1").innerHTML = count2;
            var text = document.getElementById("ContentPlaceHolder1_txtAddress").value;
            var lent = text.length;
            if (lent > count2) {
                text = text.substring(0, count2);
                document.getElementById("ContentPlaceHolder1_txtAddress").value = text;
                return false;
            }
            document.getElementById("ContentPlaceHolder1_limit1").innerHTML = count2 - lent;
        }


        function compareYear() {
            var txtYearOfIssue = document.getElementById("<%=txtYearOfIssue.ClientID%>");
            var hiddennn = document.getElementById("<%=hiddenn.ClientID%>");
            if (txtYearOfIssue.value > hiddennn.value) {
                alert("Year should be less then or equal to current year");
            }
        }

        function displayBPL() {
            // alert('Hi');
            var ddl_ID = '<%= DDL_BPL.ClientID %>';
            var rfv_bplcardno = document.getElementById("<%=RFV_BPL_CardNo.ClientID%>");
            var rfv_issue_year = document.getElementById("<%=RFV_Year_Of_Issue.ClientID%>");
            var rfv_issuing_auth = document.getElementById("<%=RFV_IssuingAuth.ClientID%>");
            if (document.getElementById(ddl_ID).value == "Y") {
                $("#BPL_Yes").show();
                $("#BPL_No").hide();

                //var str = document.getElementById("BPL_Yes").innerHTML;
                //str = str.replace("xx", "vg");
                //document.getElementById("BPL_Yes").innerHTML = str;

                ValidatorEnable(rfv_bplcardno, true);
                ValidatorEnable(rfv_issue_year, true);
                ValidatorEnable(rfv_issuing_auth, true);

                // $("#BPL_No_2").hide();
            }
            else if (document.getElementById(ddl_ID).value == "N") {

                $("#BPL_Yes").hide();
                $("#BPL_No").show();
                //var str = document.getElementById("BPL_Yes").innerHTML;
                //str = str.replace("vg", "xx");
                //document.getElementById("BPL_Yes").innerHTML = str;
                ValidatorEnable(rfv_bplcardno, false);
                ValidatorEnable(rfv_issue_year, false);
                ValidatorEnable(rfv_issuing_auth, false);

                // $("#BPL_No_2").show();
            }
            else {

                $("#BPL_Yes").hide();
                $("#BPL_No").hide();
                //var str = document.getElementById("BPL_Yes").innerHTML;
                //str = str.replace("xx", "vg");
                //document.getElementById("BPL_Yes").innerHTML = str;
                ValidatorEnable(rfv_bplcardno, false);
                ValidatorEnable(rfv_issue_year, false);
                ValidatorEnable(rfv_issuing_auth, false);

                //  $("#BPL_No_2").hide();
            }
        }

        $(document).ready(function () {
            $("#BPL_Yes").hide();
            $("#BPL_No").hide();
            // $("#BPL_No_2").hide();
            var prmInstance = Sys.WebForms.PageRequestManager.getInstance();
            prmInstance.add_endRequest(function () {
                var ddlCountry = document.getElementById("<%=ddl_country.ClientID%>");
                var revPinCode = document.getElementById("<%=REV_PinCode.ClientID%>");
                if (ddlCountry.value != "091") {

                    ValidatorEnable(revPinCode, false);

                } else {
                    ValidatorEnable(revPinCode, true);
                }

            });


        });

        <%--        var prmInstance = Sys.WebForms.PageRequestManager.getInstance();
        prmInstance.add_endRequest(function () {
            var ddlCountry = document.getElementById("<%=ddl_country.ClientID%>");
            if (ddlCountry.value != "091") {
                var revPinCode = document.getElementById("<%=REV_PinCode.ClientID%>");
                ValidatorEnable(revPinCode, false);
               
            }
            
        });--%>

    </script>



    <div class="panel panel-success">
        <div class="panel-heading">
            <h5 class="panel-title">
                <b>
                    <asp:Label ID="Label3" runat="server" Text="Online RTI Request Form"></asp:Label>
                    <asp:HiddenField ID="H_LoginMobileNo" runat="server" />
                </b>
            </h5>
        </div>
        <label class="text-danger  ">
            Note: all
            <samp class="text-danger">*</samp>
            marked  Fields are Mandatory
        </label>
        <%--   <div class="form-horizontal">--%>
        <div class="panel-body">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h5 class="panel-title">
                        <b>
                            <asp:Label ID="lbt_reg_ttl" runat="server" Text="Applicant Information"></asp:Label>
                        </b>
                    </h5>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-2">
                                <asp:Label ID="Label4" runat="server" Text="Applicant Type"> </asp:Label>

                            </div>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddl_usertype" runat="server" ValidationGroup="vg" CssClass=" form-control" Enabled="False">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfv_usertype" runat="server" ControlToValidate="ddl_usertype" ValidationGroup="vg" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please Select User type" InitialValue="0" CssClass="text-danger"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <span class="lol1">*</span>
                                <asp:Label ID="Label5" runat="server" Text="Name"> </asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtName" runat="server" MaxLength="50" CssClass=" form-control" placeholder="Full Name Here"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFV_Name" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name Required" CssClass="text-danger" ValidationGroup="vg"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-2">
                                <span class="lol1">*</span>
                                <asp:Label ID="Label6" runat="server" Text="Gender "> </asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="DDL_Gender" runat="server" CssClass=" form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <span class="lol1">*</span>
                                <asp:Label ID="Label7" runat="server" Text="Email-ID "> </asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtEmailID" runat="server" MaxLength="60" CssClass=" form-control" placeholder="E-mail Here"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFV_Email" runat="server" ControlToValidate="txtEmailID" Display="Dynamic" ErrorMessage="Email Required" CssClass="text-danger" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rev_email" runat="server" ControlToValidate="txtEmailID" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Please Enter Valid Email ID" SetFocusOnError="True" ValidationGroup="vg" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-sm-2">
                                <span class="lol1">*</span>
                                <asp:Label ID="Label8" runat="server" Text="Address"> </asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtAddress" runat="server" MaxLength="100" Rows="3" TextMode="MultiLine" CssClass=" form-control" placeholder="Address Here" onkeyup="limiterAdd();"></asp:TextBox>
                                <asp:Label ID="lblChar1" runat="server" CssClass="text-danger" Text="Characters left."></asp:Label>
                                <asp:Label ID="limit1" runat="server" CssClass="text-danger" Text="100"></asp:Label>
                                <asp:RequiredFieldValidator ID="RFV_Address" runat="server" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Address Required" CssClass="text-danger" ValidationGroup="vg"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <asp:UpdatePanel ID="updatepanel_1" runat="server">
                            <ContentTemplate>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <span class="lol1">*</span>
                                        <asp:Label ID="lbl_country" runat="server" Text="Country" CssClass="control-label">  </asp:Label>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:DropDownList ID="ddl_country" runat="server" ValidationGroup="vg" CssClass=" form-control" AutoPostBack="true" OnSelectedIndexChanged="ddl_country_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Choose Country</asp:ListItem>
                                            <asp:ListItem Value="091">India</asp:ListItem>
                                            <asp:ListItem Value="999">Other</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_Country" runat="server" ControlToValidate="ddl_country" Display="Dynamic" ErrorMessage="Country  Required" CssClass="text-danger" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-2">
                                        <span class="lol1">*</span>
                                        <asp:Label ID="lbl_state" Text="State" runat="server" CssClass="control-label"></asp:Label>
                                    </div>
                                    <div class="col-sm-4">
                                        <div id="ddlState" runat="server">
                                            <asp:DropDownList ID="DDL_State" runat="server" CssClass=" form-control" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true">
                                                <asp:ListItem Value="0">---Select----</asp:ListItem>
                                                <asp:ListItem Value="1">Chhattisgarh</asp:ListItem>
                                                <asp:ListItem Value="2">Madhya Pradesh</asp:ListItem>
                                                <asp:ListItem Value="3">Maharashtra</asp:ListItem>
                                                <asp:ListItem Value="4">Telangana</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RFV_State" runat="server" ControlToValidate="DDL_State" Display="Dynamic" ErrorMessage="State  Required" CssClass="text-danger" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                        </div>
                                        <div visible="false" id="txtOther" runat="server">
                                            <asp:TextBox ID="txtState_Other" Visible="true" runat="server" MaxLength="50" Text="" CssClass="form-control" placeholder="Other Country Name Here"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2 text-default" id="ctc" runat="server">
                                        <span class="lol1">*</span>
                                        <asp:Label ID="lbl_district" runat="server" Text="District"> </asp:Label>
                                        
                                        <%--<span class="text-danger">*</span>--%>
                                    </div>
                                    <div class="col-sm-4" id="ctc1">
                                        <asp:DropDownList ID="ddl_district" runat="server" AppendDataBoundItems="true" ValidationGroup="vg" CssClass="form-control" OnSelectedIndexChanged="ddl_district_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select District</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfv_district" runat="server" ValidationGroup="vg" ControlToValidate="ddl_district" InitialValue="0" CssClass="alert-danger" ErrorMessage="District is Required" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <%-- End of Update panel 1 update1 --%>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%--</ContentTemplate>
                            <Triggers>
                                  <asp:AsyncPostBackTrigger ControlID = "RTI_DDL_District"   EventName ="SelectedIndexChanged" />
                                  <asp:PostBackTrigger ControlID = "RTI_DDL_District" />
                            </Triggers>
                        </asp:UpdatePanel>--%>
                        <div class="form-group">
                            <div class="col-sm-2">
                                <span class="lol1">*</span>
                                <asp:Label ID="Label9" runat="server" Text="Pin Code"> </asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtPinCode" runat="server" MaxLength="6" CssClass=" form-control" placeholder="Pin code of the Place"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="REV_PinCode" runat="server" ControlToValidate="txtPinCode" Display="Dynamic"
                                    ErrorMessage="Please enter valid pincode" CssClass="text-danger" ValidationExpression="\d{6}" ValidationGroup="vg"></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-sm-2">
                                <span class="lol1">*</span>
                                <asp:Label ID="Label10" runat="server" Text="Mobile Number"> </asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtMobile" runat="server" MaxLength="10" ValidationGroup="vg" CssClass=" form-control" placeholder="Mobile Number Here"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RFV_mobile" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Mobile Number Required" CssClass="text-danger" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="REV_MobileNo" runat="server" ControlToValidate="txtMobile" Display="Dynamic" ErrorMessage="Only Numeric Value are allowed" CssClass="text-danger" ValidationExpression="^[1-9][0-9]{9}$" ValidationGroup="vg"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h5 class="panel-title">
                        <b>

                            <asp:Label ID="Label1" runat="server" Text=" RTI Details"></asp:Label>
                        </b>
                    </h5>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel runat="server" ID="update1" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <span class="lol1">*</span>
                                        <asp:Label ID="Label11" runat="server" Text="Is the Applicant Below Poverty Line"> </asp:Label>
                                    </div>
                                    <div class="col-sm-2">
                                        <%--<asp:DropDownList ID="DDL_BPL" runat="server" ValidationGroup="vg" onchange="displayBPL();" CssClass=" form-control">--%>
                                        <asp:DropDownList ID="DDL_BPL" runat="server" ValidationGroup="vg" AutoPostBack="true" OnSelectedIndexChanged="DDL_BPL_SelectedIndexChanged" CssClass=" form-control">
                                            <asp:ListItem Value="0">----Select-----</asp:ListItem>
                                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                                            <asp:ListItem Value="N">No</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_BPL" runat="server" ControlToValidate="DDL_BPL" Display="Dynamic" ErrorMessage="Please Select BPL Status" InitialValue="0" ValidationGroup="vg" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="form-horizontal">
                                <div id="BPL_No" runat="server">
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <asp:Label ID="Label12" runat="server" Text="Pay RTI Fees Rs. 10"></asp:Label>
                                        </div>
                                        <div class="col-sm-2">
                                            <asp:LinkButton ID="LB_PayFees" runat="server" PostBackUrl="~/PayFees.aspx">Pay Fees</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <div id="BPL_Yes" runat="server">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <span class="lol1">*</span>
                                                <asp:Label ID="Label13" runat="server" Text="BPL Card No. "></asp:Label>


                                            </div>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="txtBPLNo" runat="server" MaxLength="20" CssClass=" form-control" placeholder="BPL Card Number Here"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFV_BPL_CardNo" runat="server" ControlToValidate="txtBPLNo" Display="Dynamic" ErrorMessage="BPL Card No. Required" CssClass="text-danger" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <span class="lol1">*</span>
                                                <asp:Label ID="Label14" runat="server" Text="Year of Issue."></asp:Label>


                                            </div>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="txtYearOfIssue" onblur="compareYear();" runat="server" MaxLength="4" CssClass=" form-control" placeholder="Issue Year"></asp:TextBox>
                                                <asp:TextBox ID="HiddenTodayDate" Visible="false" runat="server" />
                                                <asp:HiddenField ID="hiddenn" runat="server" />
                                                <%--<asp:CompareValidator ID="CV_Year_Of_Issue" runat="server" ControlToValidate="txtYearOfIssue" ControlToCompare="HiddenTodayDate" Display="Dynamic" CssClass="text-danger" ErrorMessage="Year Should be less then or equal to current year" Operator="LessThanEqual" Type="String" ValidationGroup="vg"></asp:CompareValidator>--%>
                                                <asp:RegularExpressionValidator ID="REV_Year_Of_Issue" runat="server" ControlToValidate="txtYearOfIssue" Display="Dynamic" ErrorMessage="Enter Valid Year of Issue" CssClass="text-danger" ValidationExpression="\d+" ValidationGroup="vg"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RFV_Year_Of_Issue" runat="server" ControlToValidate="txtYearOfIssue" Display="Dynamic" ErrorMessage="BPL Card Issue year Required" CssClass="text-danger" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-6">
                                                <span class="lol1">*</span>
                                                <asp:Label ID="Label15" runat="server" Text="Issuing Authority"></asp:Label>

                                            </div>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="txtIssuingAuthority" runat="server" MaxLength="30" CssClass=" form-control" placeholder="Issuing Authority"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFV_IssuingAuth" runat="server" ControlToValidate="txtIssuingAuthority" Display="Dynamic" ErrorMessage="BPL Card Issuing Authority Required" CssClass="text-danger" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <asp:Label ID="Label16" runat="server" Text="Attach Supporting Document "> </asp:Label>
                                            </div>
                                            <div class="col-sm-3">
                                                Click to add files
                                         <%--<input id="Button1" type="button" value="add" onclick="AddFileUpload()" />--%>
                                            </div>
                                            <div class="col-sm-4">
                                                <%--<div id="FileUploadContainer">  </div>--%>
                                                <!--FileUpload Controls will be added here -->
                                                <asp:FileUpload ID="FU_BPL" runat="server" />
                                            </div>
                                            <div class="col-sm-5">
                                                <asp:TextBox ID="txt_FU_BPL_Disc" runat="server" MaxLength="35" CssClass="form-control" placeholder="File Description Here"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <span class="lol1">*</span> 
                                         <asp:Label ID="Label17" runat="server" Text="Details of RTI Request application"></asp:Label>
                                        
                                    </div>
                                    <div class="col-sm-2">
                                        <span class="lol1">*</span> 
                                         <asp:Label ID="Label18" runat="server" Text="Subject"></asp:Label>
                                    </div>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txt_subject" runat="server" ValidationGroup="vg" MaxLength="100" CssClass="form-control" placeholder="Subject Here"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RFV_Subject" runat="server" ControlToValidate="txt_subject" Display="Dynamic" ErrorMessage=" Subject is Required" ValidationGroup="vg" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2">
                                        <span class="lol1">*</span>
                                         <asp:Label ID="Label19" runat="server" Text="RTI Details"> </asp:Label>
                                    </div>
                                    <div class="col-sm-10">
                                        <asp:TextBox ID="txt_RequestApplicationText" runat="server" ValidationGroup="vg" MaxLength="500" Rows="5" TextMode="MultiLine" onkeyup="limiterRTI();" CssClass=" form-control" placeholder="Application Details Here"></asp:TextBox>
                                        <asp:Label ID="lblChar" runat="server" CssClass="text-danger" Text="Characters left."></asp:Label>
                                        <asp:Label ID="limit" runat="server" CssClass="text-danger" Text="500"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RFV_RequestApplicationText" runat="server" ControlToValidate="txt_RequestApplicationText" Display="Dynamic" ErrorMessage="Please Enter Details of RTI" ValidationGroup="vg" CssClass="text-danger"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-3">
                                         <asp:Label ID="Label20" runat="server" Text="RTI Additional Document "> </asp:Label>
                                    </div>
                                    <div class="col-sm-2">
                                        Click to add files
                                         <%--<input id="Button2" type="button" value="add" onclick="AddFileUpload2()" />--%>
                                    </div>
                                    <div class="col-sm-3">
                                        <%--<div id="FileUploadContainer_2"></div>--%>
                                        <!--FileUpload Controls will be added here -->
                                        <asp:FileUpload ID="FU_RTI" runat="server" />
                                        <%-- <asp:RequiredFieldValidator ID="rfv_rtifu" runat="server" ControlToValidate="FU_RTI" ErrorMessage="FileUpload NEEDED" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                        --%>
                                    </div>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="txt_FU_RTI_Disc" runat="server" MaxLength="35" CssClass="form-control" placeholder="File Description here"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btn_Submit" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h5 class="panel-title">
                        <b>
                            <asp:Label ID="Label2" runat="server" Text="RTI Department Detail"></asp:Label>
                        </b>
                    </h5>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-sm-3">
                                        <span class="lol1">*</span> 
                                         <asp:Label ID="Label21" runat="server" Text="District Name"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="RTI_DDL_District" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_District_SelectedIndexChanged" CssClass=" form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RTI_RFV_District" runat="server" ControlToValidate="RTI_DDL_District" Display="Dynamic" ErrorMessage="Select District" CssClass="text-danger" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="lol1">*</span>
                                         <asp:Label ID="Label22" runat="server" Text="Base Department Name"> </asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="DDL_BaseDepartment" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_BaseDepartment_SelectedIndexChanged" CssClass=" form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_BaseDepartment" runat="server" ControlToValidate="DDL_BaseDepartment" Display="Dynamic" ErrorMessage="Base Department Required" CssClass="text-danger" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-3">
                                        <span class="lol1">*</span> 
                                         <asp:Label ID="Label23" runat="server" Text="Office Category"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="DDL_OfficeCategory" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_Category_SelectedIndexChanged" CssClass="form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_OfficeCategory" runat="server" ControlToValidate="DDL_OfficeCategory" Display="Dynamic" ErrorMessage="Select Office Category" CssClass="text-danger" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="lol1">*</span>
                                         <asp:Label ID="Label24" runat="server" Text="Office Level"> </asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="DDL_OfficeLevel" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_OfficeLevel_SelectedIndexChanged" CssClass=" form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_OfficeLevel" runat="server" ControlToValidate="DDL_OfficeLevel" Display="Dynamic" ErrorMessage="Office Level Required" CssClass="text-danger" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-3">
                                        <span class="lol1">*</span> 
                                         <asp:Label ID="Label25" runat="server" Text="Office"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="DDL_Office" runat="server" CssClass=" form-control" AutoPostBack="True" OnSelectedIndexChanged="DDL_Office_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_Office" runat="server" ControlToValidate="DDL_Office" Display="Dynamic" ErrorMessage="Office  Required" CssClass="text-danger" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-sm-3">
                                        <span class="lol1">*</span>
                                         <asp:Label ID="Label26" runat="server" Text="RTI Officer"> </asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:DropDownList ID="DDL_RTI_Officer" runat="server" CssClass=" form-control">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RFV_RTI_Officer" runat="server" ControlToValidate="DDL_RTI_Officer" Display="Dynamic" ErrorMessage=" RTI Officer  Required" CssClass="text-danger" ValidationGroup="vg" InitialValue="0"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <%-- End of panel body --%>
                            <div class="form-group">
                                <span class="lol1">*</span>
                                <div class="col-sm-3">Enter Security Code  </div>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="txtCaptcha" EnableViewState="false" runat="server" CssClass=" form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFV_ScurityCode" runat="server" ControlToValidate="txtCaptcha"
                                        Display="Dynamic" ErrorMessage="Security code Required" CssClass="text-danger" ValidationGroup="vg"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-sm-3">
                                    <cc1:CaptchaControl ID="Captcha1" runat="server" CaptchaBackgroundNoise="Low" CaptchaLength="5"
                                        CaptchaHeight="40" CaptchaWidth="200" CaptchaMinTimeout="5" CaptchaMaxTimeout="240"
                                        FontColor="#D20B0C" NoiseColor="#B1B1B1" />
                                </div>
                                <div class="col-sm-3">
                                    <asp:ImageButton ImageUrl="~/refresh.png" runat="server" CausesValidation="false" />
                                </div>
                            </div>

                            <br />
                            <br />
                            <div class="form-group">
                                <div class="col-sm-4"></div>
                                <div class="col-sm-8">
                                    <asp:Button ID="btn_Submit" runat="server" Text="Submit" align="center" ValidationGroup="vg" OnClick="btn_Submit_Click1" CssClass="button button-3d button-black nomargin btn btn-primary" />
                                    <asp:Button ID="btn_reset" runat="server" Text="Reset" align="center" OnClick="btn_reset_click1" CssClass="button button-3d button-black nomargin btn btn-primary" />
                                </div>
                            </div>
                            </div>  
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btn_Submit" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

