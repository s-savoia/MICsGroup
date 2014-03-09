<%@ Page Title="" Language="C#" MasterPageFile="~/public_master.master" AutoEventWireup="true" CodeFile="location.aspx.cs" Inherits="Default2" %>

<%-- This page was coded by STEPHEN SAVOIA. --%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="App_Themes/public_theme/location_styles.css" rel="stylesheet" media="all" />
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content_main" Runat="Server">
    <h2>Contact Us</h2>
            <asp:ListView ID="lv_locations" runat="server" DataKeyNames="Id">
        <LayoutTemplate>
            <div class="location_public_content">
            <div id="map-canvas"></div>
                <div id="hospitals_wrapper">
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                </div>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <asp:hiddenfield ID="hdf_name" runat="server" Value='<%#Eval("name") %>' />
            <asp:hiddenfield ID="hdf_lat" runat="server" Value='<%#Eval("lat") %>' />
            <asp:hiddenfield ID="hdf_lng" runat="server" Value='<%#Eval("lng") %>' />
                <div class="locations_hospital_info">
                    <a href="javascript:void(0);" onclick="zoomTo(<%#Eval("lat") %>,<%#Eval("lng") %>);">
                    <asp:Image ID="img" runat="server" CssClass="locations_image" ImageUrl='<%#Eval("image") %>' /></a>
                    <div class="hospital_info_text">
                        <a href="javascript:void(0);" onclick="zoomTo(<%#Eval("lat") %>,<%#Eval("lng") %>);"><%#Eval("name") %></a>
                        <br />
                        <%#Eval("description") %>
                        <br />
                        Phone:<br />
                        <%#Eval("phone") %>
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
                        zoom: 8,
                        center: new google.maps.LatLng(48.839589, -80.66974)
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
                        url: 'img/map_logo.png'
                    };
                    var myLatLng = new google.maps.LatLng(lat, lng);
                    var marker = new google.maps.Marker({
                        position: myLatLng,
                        map: map,
                        icon: image,
                        title: name
                    });

                }

                function zoomTo(lat, lng) {
                    var this_lat_long = new google.maps.LatLng(lat, lng);
                    map.setZoom(14);
                    map.panTo(this_lat_long);
                }

                google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</asp:Content>

