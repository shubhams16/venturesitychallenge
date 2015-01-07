<%@ Page Title="" Language="C#" MasterPageFile="~/Crm.Master" AutoEventWireup="true" CodeBehind="Hospital.aspx.cs" Inherits="crm.Hospital" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <link rel="stylesheet" href="css/list.css" type="text/css" media="all" />
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#block1").click(function () {
                $('html, body').animate({
                    scrollTop: $("#content2").offset().top
                }, 2000);
            });
        });
    </script>
     </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<div id="content">
       <h1>Hospital Management <br /> System</h1>
        <div id="block1"><a href="register.aspx">Register Patient</a>
        </div>
        <div id="block2"><a href="show.aspx">Manage Patient</a>
        </div>
       
    </div>


</asp:Content>
