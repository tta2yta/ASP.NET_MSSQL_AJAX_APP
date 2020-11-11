<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASP.NET_MSSQL_AJAX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="sales-man-form">
       <%-- <form name="sales-form" method="post" action="">--%>
            <div><h3>Enter Details About Sales Manager</h3></div>
           <div>
                <label style="width:15%; text-align:right">Enter Sales Manager Name</label><asp:TextBox ID="txtname" runat="server" Height="27px" Width="25%"></asp:TextBox><br />
           </div>

            <div>
                <label style=" width:15%; text-align:right">Enter Age</label><input type="text" name="age" id="age" style="width:25%;height:27px" />
            </div>
            <div>
                <label style=" width:15%; text-align:right">Enter Date of Birth</label><asp:TextBox ID="txtdob" runat="server" Height="27px" Width="25%"></asp:TextBox>
            </div>
            <div>
                <label style=" width:15%; text-align:right">Enter Income</label><input type="text" name="money" id="money" style="width:25%;height:27px" />
            </div>
      
            <div style="margin-left:20%"><input type="button" id="add" value="add" /><asp:Button ID="addajax" Text="AJAX" runat="server" OnClick="addajax_Click" /></div>
    <%--</form>--%>
            </div>

   



    <script src="https://ajax.googleapis.com/ajax/libs/d3js/6.2.0/d3.min.js"></script>
    <script>

       

        $(document).ready(function () {
            $('#add').click(function () {
                alert("Hello")
                const name = document.getElementById("<%=txtname.ClientID%>").value;
                alert(name);
                return;
                var pagePath = window.location.pathname + "/method";
                var dataString = "{ 'value':'ab} ";
                alert(pagePath);

                $.ajax({
                    type: "POST",
                    url: "Default.aspx/method",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",  
                    error:
                        function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Error" + errorThrown);
                            console.log(textStatus + " " + XMLHttpRequest.responseText)
                        },
                    success:
                        function (result) {
                            alert(result + "lll");

                        }

                });


            });
        });
       
        
    </script>

</asp:Content>
