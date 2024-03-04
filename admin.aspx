<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="MyPortfolio.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
    body{

        background-color:#FCD299;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <h1>Edit Education</h1>

                <asp:GridView ID="GvEducation" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ID"
                 showHeaderWhenEmpty="true"
                 OnRowCommand="GvEducation_RowCommand"
                 OnRowEditing="GvEducation_RowEditing" OnRowCancelingEdit="GvEducation_RowCancelingEdit"
                 OnRowUpdating="GvEducation_RowUpdating" OnRowDeleting="GvEducation_RowDeleting"
                  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">

    <FooterStyle BackColor="White" ForeColor="#000066" />
    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
    <RowStyle ForeColor="#000066" />
    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#007DBB" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#00547E" />

    <Columns>

          <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
                <asp:Label Text='<%# Eval("Date") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDate" Text='<%# Eval("Date") %>' runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtDateFooter" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>
           <asp:TemplateField HeaderText="Degree">
            <ItemTemplate>
                <asp:Label Text='<%# Eval("Degree") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDegree" Text='<%# Eval("Degree") %>' runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtDegreeFooter" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>
          <asp:TemplateField HeaderText="Institution">
            <ItemTemplate>
                <asp:Label Text='<%# Eval("Institution") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtInstitution" Text='<%# Eval("Institution") %>' runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtInstitutionFooter" runat="server" />
            </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
            <ItemTemplate>
                <asp:Label Text='<%# Eval("Description") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDescription" Text='<%# Eval("Description") %>' runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtDescriptionFooter" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField>
            <ItemTemplate>
                <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                <asp:ImageButton ImageUrl="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:ImageButton ImageUrl="~/images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                <asp:ImageButton ImageUrl="~/images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:ImageButton ImageUrl="~/images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Addnew" Width="20px" Height="20px" />
            </FooterTemplate>
        </asp:TemplateField>   
      </Columns>
     </asp:GridView>
             <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />

             <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
        
            </center>
        </div>

        <div>
            <center>
                <h1>Edit Olympiad</h1>
                <asp:GridView ID="GvOlympiad" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ID"
    showHeaderWhenEmpty="true"
     OnRowCommand="GvOlympiad_RowCommand"
    OnRowEditing="GvOlympiad_RowEditing"  OnRowCancelingEdit="GvOlympiad_RowCancelingEdit"
    OnRowUpdating="GvOlympiad_RowUpdating" OnRowDeleting="GvOlympiad_RowDeleting"
    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">

    <FooterStyle BackColor="White" ForeColor="#000066" />
    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
    <RowStyle ForeColor="#000066" />
    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#007DBB" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#00547E" />

    <Columns>

        <asp:TemplateField HeaderText="Date">
            <ItemTemplate>
                <asp:Label Text='<%# Eval("Date") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDate" Text='<%# Eval("Date") %>' runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtDateFooter" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Title">
            <ItemTemplate>
                <asp:Label Text='<%# Eval("Title") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtTitle" Text='<%# Eval("Title") %>' runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtTitleFooter" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Position">
            <ItemTemplate>
                <asp:Label Text='<%# Eval("Position") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtPosition" Text='<%# Eval("Position") %>' runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtPositionFooter" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Description">
            <ItemTemplate>
                <asp:Label Text='<%# Eval("Description") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtDescription" Text='<%# Eval("Description") %>' runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtDescriptionFooter" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField>
            <ItemTemplate>
                <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                <asp:ImageButton ImageUrl="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:ImageButton ImageUrl="~/images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                <asp:ImageButton ImageUrl="~/images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:ImageButton ImageUrl="~/images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Addnew" Width="20px" Height="20px" />
            </FooterTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
                <asp:Label ID="lblSuccessMessage2" Text="" runat="server" ForeColor="Green" />

                <asp:Label ID="lblErrorMessage2" Text="" runat="server" ForeColor="Red" />
        

            </center>
        </div>

        <div>
            <center>
                <h1>Edit Skills</h1>

                <asp:GridView ID="GvSkills" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="SkillId"
    showHeaderWhenEmpty="true"
    OnRowCommand="GvSkills_RowCommand"  OnRowCancelingEdit="GvSkills_RowCancelingEdit"
    OnRowUpdating="GvSkills_RowUpdating" OnRowDeleting="GvSkills_RowDeleting"
    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">

    <FooterStyle BackColor="White" ForeColor="#000066" />
    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
    <RowStyle ForeColor="#000066" />
    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#007DBB" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#00547E" />

    <Columns>

        <asp:TemplateField HeaderText="SkillName">
            <ItemTemplate>
                <asp:Label Text='<%# Eval("SkillName") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtSkillName" Text='<%# Eval("SkillName") %>' runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtSkillNameFooter" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="SkillPercentage">
            <ItemTemplate>
                <asp:Label Text='<%# Eval("SkillPercentage") %>' runat="server" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="txtSkillPercentage" Text='<%# Eval("SkillPercentage") %>' runat="server" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtSkillPercentageFooter" runat="server" />
            </FooterTemplate>
        </asp:TemplateField>

        <asp:TemplateField>
            <ItemTemplate>
                <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                <asp:ImageButton ImageUrl="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:ImageButton ImageUrl="~/images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                <asp:ImageButton ImageUrl="~/images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />
            </EditItemTemplate>
            <FooterTemplate>
                <asp:ImageButton ImageUrl="~/images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Addnew" Width="20px" Height="20px" />
            </FooterTemplate>
        </asp:TemplateField>

    </Columns>
  </asp:GridView>
            
                <asp:Label ID="lblSuccessMessage1" Text="" runat="server" ForeColor="Green" />

                <asp:Label ID="lblErrorMessage1" Text="" runat="server" ForeColor="Red" />

            </center>
        </div>

        <br />
        <br />
        <br />
        <div>
            <center>
                <asp:Label ID="lblUserDetails" runat="server" Text=""></asp:Label>
                <br />
                <br />

                <asp:Button runat="server" ID="MainpageB" Text="Go home" CssClass="Button" Style="width: 80px; height: 30px; font-size: 15px;" OnClick="MainpageB_Click"/> 
    <br />
    <br />
        <asp:Button runat="server" ID="Button1" Text="Logout" CssClass="Button" Style="width: 80px; height: 40px; font-size: 15px;" OnClick="Button1_Click"/> </center>
            <br />
            <br />
</div>


    </form>
</body>
</html>
