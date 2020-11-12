﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxWithScriptManager.aspx.cs" Inherits="ASP.NET_MSSQL_AJAX.AjaxWithScriptManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
          <div class="sales-man-form">
       <%-- <form name="sales-form" method="post" action="">--%>
            <div><h3>Enter Details About Sales Manager</h3></div>
           <div>
                <label style="width:15%; text-align:right">Enter Sales Manager Name</label><asp:TextBox ID="txtname" runat="server" Height="27px" Width="25%"></asp:TextBox><br />
           </div>

            <div>
                <label style=" width:15%; text-align:right">Enter Age</label><input type="text" name="age" id="age" style="width:25%;height:27px" />
            </div>
            <div class="calander">
                <div class="calander-la">
                      <label >Enter Date of Birth</label>
                </div>
              
               <%-- <asp:TextBox ID="txtdob" runat="server" Height="27px" Width="25%"></asp:TextBox>--%>
                <div class="calander-lb">
                    <input type="date" id="txtdob" name="birthdaytime" value="2020-07-02" />
                   <%--%--  <asp:Calendar ID="txtdob" runat="server" SelectedDate="11/11/2020 13:30:28"></asp:Calendar>--%>
                  </div>
            </div> 
            <div>
                <label style=" width:15%; text-align:right">Enter Income</label><input type="text" name="money" id="money" style="width:25%;height:27px" />
            </div>
      
            <div style="margin-left:20%"><input type="button" id="add" value="add" onclick="addRecord()" /><asp:Button ID="addajax" Text="AJAX" runat="server" OnClick="addajax_Click" /></div>
    <%--</form>--%>
        
        <div id="msg"></div>
            </div>
   

    <script type="text/javascript">
        function addRecord() {
            const name = document.getElementById("<%=txtname.ClientID%>").value
            const age = document.getElementById("age").value
            const dob = documnet.getElementById("txtdob").value
            const money = document.getElementById("money").value()
            data = {
                'name': name,
                'age': age,
                'dob': dob,
                'money': money
            };
            PageMethods.method(JSON.stringify(data), OnSuccess)
         

        }
        function OnSuccess(response, userContext, methodName) {
            alert(response);
            console.log(response)
        }
    </script>
</body>
</html>
