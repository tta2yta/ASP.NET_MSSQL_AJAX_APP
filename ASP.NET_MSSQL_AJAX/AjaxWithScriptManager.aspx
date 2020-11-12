﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxWithScriptManager.aspx.cs" Inherits="ASP.NET_MSSQL_AJAX.AjaxWithScriptManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Scripts/Css/style.css" rel="stylesheet" />
</head>
<body>
          <div class="sales-man-form">
              <div><h3>Enter Details About Sales Manager</h3></div> <span>
                  
        <form name="sales-form" method="post" action="" runat="server">
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx">Home</asp:LinkButton></span>
           <div style="display:flex; flex-direction:row">
                 <div style="text-align:right; border:1px red solid; width:30%">
                    <label style=" text-align:right">Enter Sales Manager Name</label>
                </div>
                   <div style="text-align:left; border:1px red solid; width:70%">
                    <asp:TextBox ID="txtname" runat="server" Height="27px" Width="25%"></asp:TextBox><br />
               </div>
              
           </div>

            <div style="display:flex; flex-direction:row">
               <div style="text-align:right; border:1px red solid; width:30%">
                    <label style="text-align:right">Enter Age</label>
               </div> 
                <div style="text-align:left; border:1px red solid; width:70%">
                    <input type="text" name="age" id="age" style="width:25%;height:27px" />
               </div>
               
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
      
            <div style="margin-left:20%"><input type="button" id="add" value="add" onclick="addRecord()" /></div>
    </form>
        
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
            document.getElementById("msg").innerHTML = handleDisplaydata(response);

        }

        function handleDisplaydata(data) {
            let res = "<table border='1'>";
            let kk = "<h3>ppp</h3>";
            for (let rr of data) {
                console.log(rr)
                res += "<tr>"
                res += "<td>" + rr.name + "</td>"
                res += "<td>" + rr.age + "</td>"
                res += "<td>" + rr.dob + "</td>"
                res += "<td>" + rr.money + "</td>"
                res += "</tr>"
            }
            res += "</table>";
            console.log(res)
            return res;
        }
    </script>
</body>
</html>
