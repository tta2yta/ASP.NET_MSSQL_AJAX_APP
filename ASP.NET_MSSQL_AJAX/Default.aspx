<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASP.NET_MSSQL_AJAX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <label>Enter Sales Manager Name</label><asp:TextBox ID="txtname" runat="server"></asp:TextBox><br />
    <input type="button" value="add" onclick="addrecord" />
    <asp:Button ID="addajax" Text="AJAX" runat="server" OnClick="addajax_Click"/>

    <script src="https://ajax.googleapis.com/ajax/libs/d3js/6.2.0/d3.min.js"></script>
    <script>
        function addrecord() {
            alert("Hello")
        }
    </script>

</asp:Content>
