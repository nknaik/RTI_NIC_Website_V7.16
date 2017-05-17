<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="user_detail.aspx.cs" Inherits="user_user_detail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="form-horizontal">
        <div class="panel panel-success">
            <div class="panel-heading ">
                <h5 class="panel-title">YOUR PROFILE
               <a data-toggle="collapse" href="#DetailUser" aria-expanded="true"></a>
                </h5>
            </div>
            <div id="DetailUser" class="panel-collapse collapse in" aria-expanded="true">
                <div class="panel-body">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8">
                        <div class="form-group">
                            <div class="col-sm-6">
                                <asp:Label ID="lbl_lastlogin" runat="server" CssClass="lbltxt" Text="Last Successful login:"></asp:Label>
                            </div>
                            <div class="col-sm-6">
                                <asp:Label ID="txt_last_login" runat="server" ReadOnly="true"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <asp:Label ID="lbl_First_name" CssClass="lbltxt" runat="server" Text="Name:"></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="txt_first_name" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <asp:Label ID="lbl_gender" runat="server" CssClass="lbltxt" Text="Gender:"></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="txt_gender" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <asp:Label ID="lbl_mobile" runat="server" CssClass="lbltxt" Text="Mobile No: "></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="txt_mobile" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <asp:Label ID="lbl_email" runat="server" CssClass="lbltxt" Text="Email Id:"></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="txt_email" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <asp:Label ID="lbl_address" runat="server" CssClass="lbltxt" Text="Address:"></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="txt_Address" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <asp:Label ID="lbl_pin_code" runat="server" CssClass="lbltxt" Text="Pin Code:"></asp:Label>
                            </div>
                            <div class="col-sm-4">
                                <asp:Label ID="txt_pin_code" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

