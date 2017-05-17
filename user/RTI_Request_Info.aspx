<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UserMaster.master" CodeFile="RTI_Request_Info.aspx.cs" Inherits="RTI_Request_Info" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <style type="text/css">
/*ol li {
  list-style-type: decimal;
  display: list-item;
  }*/
</style>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h5 class="panel-title">
                <b>
                    <asp:Label ID="Label3" runat="server" Text=" RTI Request Information "></asp:Label>
                </b>
            </h5>

        </div>

        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">

                    <ol class="list-group">
                        <li class="list-group-item">1. This Web Portal can be used by Indian citizens to file RTI application online and also to make payment for RTI application online. First appeal can also be filed online.
                        </li>
                        <li class="list-group-item">2. An applicant who desires to obtain any information under the RTI Act can make a request through this Web Portal to the Ministries/Departments of Government of Chhattisgarh.
                                                    On clicking at "Continue Apply for RTI", the applicant has to fill the required details on the page that will appear. 
                        </li>
                        <li class="list-group-item"> 
                            3. On clicking at "Submit Request", the applicant has to fill the required details on the page that will appear. The fields marked * are mandatory while the others are optional.
                        </li>
                        <li class="list-group-item"> 
                            4. The text of the application may be written at the prescribed column.
                        </li>
                        <li class="list-group-item"> 
                            5. At present, the text of an application that can be uploaded at the prescribed column is confined to 500 characters only.
                        </li>
                        <li class="list-group-item"> 
                           6. In case an application contains more than 3000 characters, it can be uploaded as an attachment, by using column "Supporting document".
                        </li>
                        <li class="list-group-item"> 
                            7. No RTI fee is required to be paid by any citizen who is below poverty line as per RTI Rules, 2012. However, the applicant must attach a copy of the certificate issued by the appropriate government in this regard, alongwith the application.
                        </li>
                        <li class="list-group-item"> 
                            8. On submission of an application, a unique registration number would be issued, which may be referred by the applicant for any references in future.
                        </li>
                        <li class="list-group-item"> 
                            9. For making an appeal to the first Appellate Authority, the applicant has to click at "Submit First Appeal" and fill up the page that will appear.
                        </li>
                        <li class="list-group-item"> 
                            10. The registration number of original application has to be used for reference.
                        </li>
                        <li class="list-group-item"> 
                            11. The applicant/the appellant should submit his/her mobile number to receive SMS alert.
                        </li>
                       
                    </ol>
                    <div class="col-sm-4">
                        <asp:Button ID="btn_Submit" runat="server" Text="Continue Apply for RTI" align="center" ValidationGroup="vg" OnClick="btn_Submit_Click1" />
                    </div>

                </div>
            </div>
        </div>


    </div>
</asp:Content>
