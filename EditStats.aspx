<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditStats.aspx.cs" Inherits="HockeyJeremiahMacDougall2.EditStats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <p>
        <strong>Edit Stats:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>Search:
        <asp:TextBox ID="txtSearch" runat="server" Height="30px"></asp:TextBox>
&nbsp;<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" BackColor="#660066" CausesValidation="False" ForeColor="White" Height="30px" Width="90px" />
        <asp:RadioButtonList ID="rdoPlayerlist" runat="server" OnSelectedIndexChanged="rdoPlayerlist_SelectedIndexChanged" RepeatDirection="Horizontal" AutoPostBack="True">
        </asp:RadioButtonList>
        &nbsp;<table style="width: 100%; text-align: left; vertical-align: middle; line-height: 40px;">
            <tr>
                <td style="width: 200px; line-height: 40px; text-align: right;">
        <asp:Label ID="lblMatches" runat="server" Text="Matches Played: "></asp:Label>
                </td>
                <td><asp:TextBox ID="txtPlayed" runat="server" style="margin-bottom: 0px" Height="30px" AutoPostBack="True"></asp:TextBox>
                    <asp:RangeValidator ID="PlayValidator" runat="server" ControlToValidate="txtPlayed" ErrorMessage="Enter a number between 0 and 999!" ForeColor="Yellow" MaximumValue="999" MinimumValue="0" ValidationGroup="CheckDetails"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 200px; line-height: 40px; text-align: right;">
        <asp:Label ID="Label1" runat="server" Text="Matches Won: "></asp:Label>
                </td>
                <td><asp:TextBox ID="txtMatchesWon" runat="server" Height="30px" AutoPostBack="True"></asp:TextBox>
                    <asp:RangeValidator ID="WonValidator" runat="server" ControlToValidate="txtMatchesWon" ErrorMessage="Enter a number between 0 and 999!" ForeColor="Yellow" MaximumValue="999" MinimumValue="0" ValidationGroup="CheckDetails"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 200px; line-height: 40px; text-align: right;">
        <asp:Label ID="lblAssists" runat="server" Text="Assists: "></asp:Label>
                </td>
                <td style="height: 40px"><asp:TextBox ID="txtAssists" runat="server" Height="30px" AutoPostBack="True"></asp:TextBox>
                    <asp:RangeValidator ID="AssistValidator" runat="server" ControlToValidate="txtAssists" ErrorMessage="Enter a number between 0 and 999!" ForeColor="Yellow" MaximumValue="999" MinimumValue="0" ValidationGroup="CheckDetails"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 200px; line-height: 40px; text-align: right;">
        <asp:Label ID="lblGoals" runat="server" Text="Goals: "></asp:Label>
                </td>
                <td style="height: 40px"><asp:TextBox ID="txtGoals" runat="server" Height="30px" AutoPostBack="True"></asp:TextBox>
                    <asp:RangeValidator ID="goalsValidator" runat="server" ControlToValidate="txtGoals" ErrorMessage="Enter a number between 0 and 999!" ForeColor="Yellow" MaximumValue="999" MinimumValue="0" ValidationGroup="CheckDetails"></asp:RangeValidator>
                </td>
            </tr>
        </table>
    </p>
<p>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" BackColor="#660066" ForeColor="White" Height="30px" OnClick="btnUpdate_Click" ValidationGroup="CheckDetails" Width="90px" />
        &nbsp;<asp:Button ID="btnDelete" runat="server" Text="Delete" BackColor="#660066" ForeColor="White" Height="30px" OnClick="btnDelete_Click" Width="90px" />
        &nbsp;<asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
    </p>
    </asp:Content>
