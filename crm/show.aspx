<%@ Page Title="" Language="C#" MasterPageFile="~/Crm.Master" AutoEventWireup="true" CodeBehind="show.aspx.cs" Inherits="crm.show" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/list.css" type="text/css" media="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="content">
<div id="dash_content">
        <h1>Dashboard</h1>
        <p>This is admin dashborad which will create "Bulk Patient Records & "Individual Patients Records"</p>

        <div id="upload">
            <h3>Upload Records</h3>
            
             &nbsp<asp:Label ID="Label3" runat="server"></asp:Label>
            <table class="style1">
           <tr>
               <td class="style3">
                   <asp:Label ID="Label4" runat="server" Text="Upload Excel File"></asp:Label>

               </td>
               <td class="style4">

        <asp:FileUpload ID="FileUpload2" runat="server" />
   
  
               </td>
               <td class="style5">
                   <asp:Button ID="btnupload" runat="server" onclick="upload_click" 
            Text="Upload" Width="130px" />
  
               </td>
               <td>
  
    <asp:Label ID="Label1" runat="server"></asp:Label>
               </td>
           </tr>
           <tr>
               <td class="style3">
                   &nbsp;</td>
               <td class="style4">
                   &nbsp;</td>
               <td class="style5">
                   &nbsp;</td>
               <td>
                   &nbsp;</td>
           </tr>
           <tr>
               <td class="style3">
                   <asp:Label ID="Label5" runat="server" Text="Upload CSV File"></asp:Label>
               </td>
               <td class="style4">
   
                 <asp:FileUpload ID="FileUpload1" runat="server" />
               </td>
               <td class="style5">
<asp:Button ID="Button2" Text="Upload" OnClick = "Upload" runat="server" 
            Width="130px" />
               </td>
               <td>
            <asp:Label ID="Label2" runat="server"></asp:Label>
               </td>
           </tr>
           <tr>
               <td class="style3">
                   &nbsp;</td>
               <td class="style4">
                   &nbsp;</td>
               <td class="style5">
                   &nbsp;</td>
               <td>
                   &nbsp;</td>
           </tr>
           <tr>
               <td class="style3">
                  
               </td>
               <td class="style4">

       <asp:TextBox ID="tstserch" runat="server" ToolTip="serch with first name"></asp:TextBox>
               </td>
               <td class="style5">
       <asp:Button ID="btnserch" runat="server" Text="Search" 
            onclick="btnserch_Click" Width="130px" />
               </td>
               <td>
       <asp:Label ID="lblshow" runat="server"></asp:Label>
               </td>
           </tr>
       </table>
        </div>
    </div>
        
<%--<div style="margin-left: 30%; margin-right: 0%; padding-top: 1%;">--%>


      
       
     
&nbsp;&nbsp;<br/>
   
                 <br/>
<div style="display: block; margin-left: 250px;">

        <asp:GridView ID="GridView1" runat="server"
            onrowdeleting="GridView1_RowDeleting" onrowcommand="GridView1_RowCommand" 
            ShowFooter="True" CellPadding="4" GridLines="Horizontal" 
            onrowcancelingedit="GridView1_RowCancelingEdit" 
            onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" 
            AllowPaging="True" AutoGenerateColumns="False"
            ShowHeaderWhenEmpty="True" BackColor="White" BorderColor="#336666" 
            BorderStyle="Double" BorderWidth="3px">
            
            
            <Columns>

            <asp:TemplateField HeaderText="Operation">
                    <EditItemTemplate>
                        <asp:Button ID="tnupdate" runat="server" CommandName="Update" Text="Update" />
                        &nbsp;
                        <asp:Button ID="btncancal" runat="server" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnfooterinsert" runat="server" CommandName="Insertfooter1" 
                            Text="Inssert" Width="72px" />
                        <asp:Button ID="btnfootercler" runat="server" CommandName="Clearfooter1" 
                            Text="Clear" Width="63px" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Button ID="btnedit" runat="server" CommandName="Edit" Height="25px" 
                            Text="Edit" Width="50px" />
                        <asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Pataint No">
                    <EditItemTemplate>
                        <asp:Label ID="lbleid" runat="server" Text='<%# Bind("pataintno") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tstfooterid" runat="server" MaxLength="5" Width="80px"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblid" runat="server" Text='<%# bind("pataintno") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="tstefname" runat="server" Text='<%# bind("Firstname") %>' 
                            Width="80px"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tstfooterfname" runat="server" Width="80px"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblfname" runat="server" Text='<%# bind("Firstname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="tstelname" runat="server" Text='<%# bind("Lastname") %>' 
                            Width="80px"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="testfootrlname" runat="server" Width="80px"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbllname" runat="server" Text='<%# bind("Lastname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Age">
                    <EditItemTemplate>
                        <asp:TextBox ID="tsteage" runat="server" Text='<%# bind("Age") %>' 
                            Width="80px"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="testfooterage" runat="server" Width="80px"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblage" runat="server" Text='<%# bind("Age") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <EditItemTemplate>
                        <asp:TextBox ID="tsteaddress" runat="server" Text='<%# bind("Address") %>' 
                            Width="80px"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="testfooteradres" runat="server" Width="80px"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbladres" runat="server" Text='<%# bind("Address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="tsteemail" runat="server" Text='<%# bind("Email") %>' 
                            Width="80px"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="testmail" runat="server" Width="80px"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblmail" runat="server" Text='<%# bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Phone">
                     <EditItemTemplate>
                         <asp:TextBox ID="tstephno" runat="server" Text='<%# Bind("Phno") %>' 
                             Width="80px"></asp:TextBox>
                     </EditItemTemplate>
                     <FooterTemplate>
                         <asp:TextBox ID="tstfooterphno" runat="server" Width="80px"></asp:TextBox>
                     </FooterTemplate>
                     <ItemTemplate>
                         <asp:Label ID="lblphno" runat="server" Text='<%# Bind("Phno") %>'></asp:Label>
                     </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField HeaderText="Operation">
                    <EditItemTemplate>
                        <asp:Button ID="tnupdate" runat="server" CommandName="Update" Text="Update" />
                        &nbsp;
                        <asp:Button ID="btncancal" runat="server" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnfooterinsert" runat="server" CommandName="Insertfooter1" 
                            Text="Inssert" Width="72px" />
                        <asp:Button ID="btnfootercler" runat="server" CommandName="Clearfooter1" 
                            Text="Clear" Width="63px" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Button ID="btnedit" runat="server" CommandName="Edit" Height="25px" 
                            Text="Edit" Width="50px" />
                        <asp:Button ID="btndelete" runat="server" CommandName="Delete" Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>--%>
               
            </Columns>
            <EmptyDataTemplate>
                Add User Data<br />
                <table class="tblrgstr">
                    <tr>
                        <td>
                            Pataint No</td>
                        <td>
                            First Name</td>
                        <td>
                            Last Name</td>
                        <td>
                            Age</td>
                        <td>
                            Address</td>
                        <td>
                            Email</td>
                        <td>
                            Phone</td>
                        <td>
                            Operation</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="testpid" runat="server" MaxLength="6" Width="80px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tstfname" runat="server" Width="80px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tstlname" runat="server" Width="80px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="testage" runat="server" Width="80px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tstadres" runat="server" Width="80px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tstemail" runat="server" Width="80px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="tstphonno" runat="server" Width="80px"></asp:TextBox>
                            </td>
                        <td>
                            <asp:Button ID="btninsert" runat="server" CommandName="insertfooter" 
                                Text="Insert" Width="50" />
                            <asp:Button ID="btnclear" runat="server" CommandName="clearfooter" 
                                Text="Clear" />
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
    &nbsp;
    



     

     </div>
    
    

</div>
</asp:Content>
