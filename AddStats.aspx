<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddStats.aspx.cs" Inherits="HockeyJeremiahMacDougall2.AddStats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <strong>&nbsp;Add Stats:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </strong>
<asp:DropDownList ID="ddlPlayerNames" runat="server" OnSelectedIndexChanged="ddlPlayerNames_SelectedIndexChanged" Height="30px">
    </asp:DropDownList>
    <br />
    <br />
    <table style="width: 100%; text-align: left;">
        <tr>
            <td style="line-height: 40px; width: 200px; text-align: right; height: 46px;">
    <asp:Label ID="lblMatches" runat="server" Text="Matched Played: "></asp:Label>
            </td>
            <td style="text-align: left; vertical-align: middle; height: 46px;"><asp:TextBox ID="txtPlayed" runat="server" style="margin-bottom: 0px" CausesValidation="True" Height="30px"></asp:TextBox>
                <asp:CustomValidator ID="PlayedValidator" runat="server" ControlToValidate="txtPlayed" ErrorMessage="Out Of Range" OnServerValidate="PlayedValidator_ServerValidate" ValidationGroup="CheckDetails" ForeColor="Yellow" ValidateEmptyText="True"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="line-height: 40px; width: 200px; text-align: right;">
    <asp:Label ID="Label1" runat="server" Text="Matches Won: "></asp:Label>
            </td>
            <td style="text-align: left; vertical-align: middle;"><asp:TextBox ID="txtMatchesWon" runat="server" Height="30px" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                <asp:RangeValidator ID="WonValidator2" runat="server" ControlToValidate="txtMatchesWon" ErrorMessage="Out Of Range" MaximumValue="99" MinimumValue="0" ValidationGroup="CheckDetails" ForeColor="Yellow"></asp:RangeValidator>
            &nbsp;</td>
        </tr>
        <tr>
            <td style="line-height: 40px; width: 200px; text-align: right;">
    <asp:Label ID="lblAssists" runat="server" Text="Assists: "></asp:Label>
            </td>
            <td style="text-align: left; vertical-align: middle;"><asp:TextBox ID="txtAssists" runat="server" Height="30px" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                <asp:RangeValidator ID="AssistValidator" runat="server" ControlToValidate="txtAssists" ErrorMessage="Out Of Range" MaximumValue="99" MinimumValue="0" ValidationGroup="CheckDetails" ForeColor="Yellow"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td style="line-height: 40px; width: 200px; text-align: right;">
                <asp:Label ID="lblGoals" runat="server" Text="Goals"></asp:Label>
            </td>
            <td style="text-align: left; vertical-align: middle;"><asp:TextBox ID="txtGoals" runat="server" Height="30px" CausesValidation="True" AutoPostBack="True"></asp:TextBox>
                <asp:RangeValidator ID="GoalValidator" runat="server" ControlToValidate="txtGoals" ErrorMessage="Out Of Range" MaximumValue="99" MinimumValue="0" ValidationGroup="CheckDetails" ForeColor="Yellow"></asp:RangeValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnAdd" runat="server" Text="Add" BackColor="#660066" ForeColor="White" Height="30px" Width="90px" OnClick="btnAdd_Click" ValidationGroup="CheckDetails" />
    &nbsp;&nbsp;
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
    <asp:CustomValidator ID="CustomWonVSPlayed" runat="server" ControlToValidate="txtMatchesWon" ErrorMessage="The games won is greater than the games played!" OnServerValidate="PlayedValidator_ServerValidate" ValidationGroup="CheckDetails" ForeColor="Yellow"></asp:CustomValidator>
    <br />
</asp:Content>
