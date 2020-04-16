<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditPlayer.aspx.cs" Inherits="HockeyJeremiahMacDougall2.EditPlayer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <strong>Edit Player: </strong>
    <table style="text-align: left">
        <tr>
            <td style="width: 200px; text-align: right;">
<asp:Label ID="lblSearch" runat="server" Text="Search: "></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="txtSearch" runat="server" Height="30px"></asp:TextBox>
    &nbsp;<asp:Button ID="btnSearch" runat="server" BackColor="#660066" ForeColor="White" Height="30px" OnClick="btnSearch_Click" Text="Search" CausesValidation="False" Width="90px" />
    <asp:RequiredFieldValidator ID="SearchValidator" runat="server" ErrorMessage="Name Required!" ControlToValidate="txtSearch" ForeColor="Yellow" ValidationGroup="CheckDetails"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:RadioButtonList ID="rdoPlayerList" runat="server" OnSelectedIndexChanged="rdPlayerList_SelectedIndexChanged" AutoPostBack="True" RepeatDirection="Horizontal">
    </asp:RadioButtonList>
    <br />
    <table>
        <tr>
            <td aria-valuemin="h" style="width: 200px; text-align: right; height: 45px;">
    <asp:Label ID="lblPlayerName" runat="server" Text="Player Name: "></asp:Label>
            </td>
            <td aria-valuemin="h" style="text-align: left; height: 45px;">
    <asp:TextBox ID="txtPlayerName" runat="server" Height="30px"></asp:TextBox>
    &nbsp;<asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="Player Name Required!" ControlToValidate="txtPlayerName" ForeColor="Yellow" ValidationGroup="CheckDetails"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td aria-valuemin="h" style="width: 200px; text-align: right;">
    <asp:Label ID="lblJerseyNo" runat="server" Text="Jersey Number: "></asp:Label>
            </td>
            <td aria-valuemin="h" style="text-align: left">
    <asp:TextBox ID="txtJerseyNo" runat="server" Height="30px"></asp:TextBox>
    &nbsp;<asp:RequiredFieldValidator ID="JerseyValidator" runat="server" ErrorMessage="Jersey Number Required" ControlToValidate="txtJerseyNo" ForeColor="Yellow" ValidationGroup="CheckDetails"></asp:RequiredFieldValidator>
            </td>
        </tr>
        </table>
    <br />
    <asp:Button ID="Update" runat="server" Text="Update" BackColor="#660066" ForeColor="White" Height="30px" OnClick="Update_Click" ValidationGroup="CheckDetails" Width="90px" />
&nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete" BackColor="#660066" ForeColor="White" Height="30px" OnClick="btnDelete_Click" Width="90px" />
    &nbsp;
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <br />
</asp:Content>
