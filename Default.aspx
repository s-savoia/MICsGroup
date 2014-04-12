<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

         <%--***** HEADER *****--%>
            <header>
                <div class="logo">
                    <asp:HyperLink ID="link_logo" runat="server" NavigateUrl="~/home.aspx">
                    <asp:Image CssClass="img" runat="server" ID="logo" ImageUrl="~/img/logo.png" />
                    <h1>
                        <asp:Label ID="labl_hospital" runat="server">
                        MICs Group of Health Services
                        </asp:Label></h1>
                    <p>
                        <asp:Label ID="lbl_group" runat="server">
                            Bingham Memorial Hospital
                            <br />
                            Anson General Hospital
                            <br />
                            Lady Minto Hospital
                        </asp:Label>
                    </p>
                    </asp:HyperLink>
                </div>

               <div  class="btn_header">
                <ul>
                    <li>
                        <asp:HyperLink ID="HyperLink19" Text="Log in" runat="server" 
                            Target="_self"  NavigateUrl="admin/admin_login.aspx"/>
                    </li>
                    <li>
                        <asp:Image ImageUrl="~/img/access.png" runat="server" ID="Image4" width="20" />
                        <asp:HyperLink ID="HyperLink20" Text="Accessibility" NavigateUrl="~/about.aspx" runat="server" ForeColor="#08659f" />
                    </li>
                    <li>
                        <asp:HyperLink ID="HyperLink21" Text="Donate Now"  runat="server" NavigateUrl="~/donation.aspx" CssClass="donate" />
                    </li>
                </ul>
                    </div>
            </header>
        <%--***** HEADER *****--%>


        <%--***** FOOTER *****--%>

        <div class="footer">
                <div class="box_l">
                    <p>
                        <asp:ImageButton ID="btn_fb" runat="server" ImageUrl="~/img/L2.png" />
                        <asp:ImageButton ID="btn_li" runat="server" ImageUrl="~/img/L3.png" />
                        <asp:ImageButton ID="btn_tw" runat="server" ImageUrl="~/img/L4.png" />
                        <asp:ImageButton ID="btn_you" runat="server" ImageUrl="~/img/L5.png" />
                    </p>
                </div>

                <div class="box_c">
                    <p>
                        <strong>
                            <asp:Literal runat="server" ID="literal" Text="PARTNERS" /></strong>
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink9" Text="Health Canada" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink10" Text="Ontario College of Physicians and Surgeons" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink11" Text="The Ontario Hospital Association" runat="server" />
                    </p>
                    <p>

                        <asp:HyperLink ID="HyperLink12" Text="Ontario Ministry of Health and Long Term Care" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink13" Text="Porcupine Health Unit" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink14" Text="Timmins and District Hospital" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink15" Text="Ontario Ministry of Health and Long Term Care" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink16" Text="Town of Cochrane" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink17" Text="Town of Iroquois Falls" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink18" Text="Town of Matheson" runat="server" />
                    </p>

                </div>

                <div class="box_r">
                    <p>
                        <asp:HyperLink ID="HyperLink7" Text="Site map" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink6" Text="Privacy &amp; Confidentiality" runat="server" />
                    </p>
                    <p>
                        <asp:HyperLink ID="HyperLink8" Text="Copyright &amp; terms of use" runat="server" />
                    </p>
                </div>
            </div>



    
    </div>
    </form>
</body>
</html>
