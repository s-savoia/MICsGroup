<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="location.aspx.cs" Inherits="Default2" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/public_theme/location_styles.css" rel="stylesheet" media="all" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <h2>Contact Us</h2>

            <div id="map-canvas"></div>
            <asp:ListView ID="lv_locations" runat="server" DataKeyNames="Id">
        <LayoutTemplate>

            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
        </LayoutTemplate>
        <ItemTemplate>
            <asp:hiddenfield ID="hdf_name" runat="server" Value='<%#Eval("name") %>' />
            <asp:hiddenfield ID="hdf_lat" runat="server" Value='<%#Eval("lat") %>' />
            <asp:hiddenfield ID="hdf_lng" runat="server" Value='<%#Eval("lng") %>' />
            <div class="location_public_content">
                <asp:Image ID="img" runat="server" ImageUrl='<%#Eval("image") %>' />
                <div>
                    From: <%#Eval("name") %> <%#Eval("description") %>
                    Location: <%#Eval("lat") %>, <%#Eval("lng") %>
                    Email: <%#Eval("phone") %>
                </div>
                <div class="post">
                    <%#Eval("image") %>
                    <br />
                </div> 
            </div>
        </ItemTemplate>
    </asp:ListView>

            <script>
                // array of all hospital names/coords (taken from the hidden fields, which are taken from the database)
                hospitals = [
                    [document.getElementById('content_main_lv_locations_hdf_name_0').value, document.getElementById('content_main_lv_locations_hdf_lat_0').value, document.getElementById('content_main_lv_locations_hdf_lng_0').value],
                    [document.getElementById('content_main_lv_locations_hdf_name_1').value, document.getElementById('content_main_lv_locations_hdf_lat_1').value, document.getElementById('content_main_lv_locations_hdf_lng_1').value],
                    [document.getElementById('content_main_lv_locations_hdf_name_2').value, document.getElementById('content_main_lv_locations_hdf_lat_2').value, document.getElementById('content_main_lv_locations_hdf_lng_2').value]
                ];

                function initialize() {
                    var mapOptions = {
                        zoom: 7,
                        center: new google.maps.LatLng(48, -80.5)
                    }
                    map = new google.maps.Map(document.getElementById('map-canvas'),
                                                  mapOptions);

                    for (var i = 0, len = hospitals.length; i < len; i++) {
                        var hospital = hospitals[i];
                        setMarker(hospital[0], hospital[1], hospital[2]);
                    }
                }

                function setMarker(name, lat, lng) {
                    var image = {
                        url: 'img/cruz.png'
                    };
                    var myLatLng = new google.maps.LatLng(lat, lng);
                    var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        icon: image,
                        title: name
                    });

                }

                google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</asp:Content>

