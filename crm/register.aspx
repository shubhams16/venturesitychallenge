<%@ Page Title="" Language="C#" MasterPageFile="~/Crm.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="crm.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/list.css" type="text/css" media="all" />
    <style type="text/css">
        .style1
        {
            width: 105px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="pmain">

 <div id="Div2">
  <div id="content" >
        <h1>Book an Appointment</h1>
         <div id="crttbl" style="margin-left: 30%; margin-right: 30%;">

            <table class="tblrgstr" style="display: block;">
            <tr>
                    <td class="style6">
                        <asp:Label ID="lbluid" runat="server" Text="Patient No"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox6" runat="server" Height="22px" Width="170px"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:Label ID="lblname" runat="server" Text="First Name" ></asp:Label>
                       </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="170px"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2" style="margin-left: 40px">
                     <asp:CompareValidator ID="CompareValidator2" runat="server" Operator="DataTypeCheck" Type="Integer" 
                        ControlToValidate="TextBox6" ErrorMessage="Value must be a number" />
                       </td>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="lbldgr" runat="server" Text="Last Name" ></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox2" runat="server" Height="22px" Width="170px"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:Label ID="lblprcnt" runat="server" Text="Age" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Height="22px" Width="170px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" Operator="DataTypeCheck" Type="Integer" 
                    ControlToValidate="TextBox3" ErrorMessage="Value must be a number" /></td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="lblph" runat="server" Text="Address" ></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox4" runat="server" Height="22px" TextMode="MultiLine" 
                            Width="170px"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:Label ID="lblmail" runat="server" Text="Email" ></asp:Label>
                     </td>
                   <td>
                        <asp:TextBox ID="TextBox5" runat="server" Height="22px" Width="170px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style1">
 
                        &nbsp;</td>
                    <td>
 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                     ErrorMessage="Invalid email address."    ControlToValidate="TextBox5" 
                      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                         Display="Dynamic">
                    </asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="lblphoneno" runat="server" Text="Phone"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="TextBox7" runat="server" Height="22px" Width="170px"></asp:TextBox>
                    </td>
                    <td class="style1">
                        <asp:CompareValidator ID="CompareValidator3" runat="server" Operator="DataTypeCheck" Type="Integer" 
                     ControlToValidate="TextBox7" ErrorMessage="Value must be a number" />
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Error" ForeColor="Red" ControlToValidate="TextBox7"
                        ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                                   </td> 
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style1">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style1">
                        <asp:Button ID="Button1" runat="server" OnClick="RegisterUser" Text="Submit" 
                            Height="25px" Width="100px" />
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" ></asp:Label>
                    </td>
                </tr>
            </table>
            </div>
    </div> 
    <div>

   
    
</div>


    </div>
</div>
</asp:Content>
