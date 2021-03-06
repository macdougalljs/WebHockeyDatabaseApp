﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="HockeyJeremiahMacDougall2.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderMain" runat="server">
    <strong>Home</strong><br />
    <asp:GridView ID="grdHomeSummary" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" >
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
<br />
    <table id="tblHighandLow" style="width:100%;">
        <tr>
            <td>
                <asp:Label ID="lblLowestPoints" runat="server"></asp:Label>
            &nbsp;</td>
            <td>
                <asp:Label ID="lblHighestPoints" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblLowestPointsName" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblHighestPointsName" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
