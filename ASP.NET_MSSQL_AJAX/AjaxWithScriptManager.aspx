<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxWithScriptManager.aspx.cs" Inherits="ASP.NET_MSSQL_AJAX.AjaxWithScriptManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
           <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <div>
        Your Name :
        <asp:TextBox ID="txtUserName" runat="server" ></asp:TextBox>
            <input id="btnGetTime" type="button" value="Show Current Time" onclick="ShowCurrentTime()" />
        </div>
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/AjaxCall.aspx">LinkButton</asp:LinkButton>
        </form>
   

    <script type="text/javascript">
        function ShowCurrentTime() {
            PageMethods.GetCurrentTime(document.getElementById("<%=txtUserName.ClientID%>").value, OnSuccess);
        }
        function OnSuccess(response, userContext, methodName) {
            alert(response);
            console.log(response)
        }
    </script>
</body>
</html>
