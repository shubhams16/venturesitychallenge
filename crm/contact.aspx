<%@ Page Title="" Language="C#" MasterPageFile="~/Crm.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="crm.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 500px;  
            
        }
        .style2
        {
        width: 161px;
    }
        .style4
        {
        width: 482px;
    }
    .style5
    {
        width: 597px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-image:url(image/2.jpg)">
    <div style="margin-left: 35%; padding-top: 10%;">
    <table class="style1">
        <tr>
            <td class="style2">
               
            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label> </td>
            <td class="style5">
                <asp:Label ID="Label4" runat="server" Text="Shubham Singh"></asp:Label>
            </td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            </td>
            <td class="style5">
                <asp:Label ID="Label5" runat="server" Text="shubhamsingh200@gmail.com"></asp:Label>
            </td>
            <td class="style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
        </tr>
    </table>
</div>
</div>
</asp:Content>
