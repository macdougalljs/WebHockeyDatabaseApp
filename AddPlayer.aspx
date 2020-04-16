<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddPlayer.aspx.cs" Inherits="HockeyJeremiahMacDougall2.AddPlayer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <p>
        <strong>Add Player</strong><table style="width:100%;">
            <tr>
                <td style="line-height: 40px; text-align: right; width: 200px">Player Name: </td>
                <td style="text-align: left;">
    <asp:TextBox ID="txtPlayerName" runat="server" Height="30px" Width="27%"></asp:TextBox>
    <asp:RequiredFieldValidator ID="NameValidator" runat="server" ErrorMessage="Name Required!" ControlToValidate="txtPlayerName" ForeColor="Yellow" ValidationGroup="CheckDetails"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="line-height: 40px; text-align: right; width: 200px">Jersey Number: </td>
                <td style="text-align: left;">
    <asp:TextBox ID="txtPlayerJersey" runat="server" Height="30px" Width="27%"></asp:TextBox>
                    <asp:RangeValidator ID="JerseyValidator" runat="server" ControlToValidate="txtPlayerJersey" ErrorMessage="Only range 1..999 accepted!" ForeColor="Yellow" MaximumValue="999" MinimumValue="1" ValidationGroup="CheckDetails"></asp:RangeValidator>
                </td>
            </tr>
        </table>
</p>
<p>
    <asp:Button ID="btnAdd" runat="server" BackColor="#660066" BorderStyle="Solid" ForeColor="White" Height="30px" Text="Add" Width="90px" OnClick="btnAdd_Click" ValidationGroup="CheckDetails" />
&nbsp;<asp:Label ID="lblMessage" runat="server"></asp:Label>
</p>
</asp:Content>
