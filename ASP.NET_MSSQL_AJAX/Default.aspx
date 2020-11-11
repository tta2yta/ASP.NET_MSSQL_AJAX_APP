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
      
            <div style="margin-left:20%"><input type="button" id="add" value="add" /><asp:Button ID="addajax" Text="AJAX" runat="server" OnClick="addajax_Click" /></div>
    <%--</form>--%>
        
        <div id="msg"></div>
            </div>

   



    <script src="https://ajax.googleapis.com/ajax/libs/d3js/6.2.0/d3.min.js"></script>
    <script>

       

        $(document).ready(function () {
          //alert("document ready");
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();

            today = yyyy + '-' + mm + '-' + dd;
           //lert(today)
            document.getElementById("txtdob").value = today;


            $('#add').click(function () {
              //alert("Hello")
                const name = document.getElementById("<%=txtname.ClientID%>").value;
                const age = document.getElementById("age").value;
                //var age=$("#age.val();
                const dob = document.getElementById("txtdob").value
                alert(dob);
                const money = document.getElementById("money").value;
             // alert(name + " " + age + " " + dob + " " + money);
                data = {
                    'name': name,
                    'age': age,
                    'dob': dob,
                    'money': money
                };
             // alert(JSON.stringify(data));
                console.log(data);
              //return;
                var pagePath = window.location.pathname + "/method";
                var dataString = "{ 'value':'ab} ";
              //alert(pagePath);

                $.ajax({
                    type: "POST",
                    url: "Default.aspx/method",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ salesManager: data }),
                    dataType: "json",  
                    error:
                        function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Error" + XMLHttpRequest.responseText)
                            console.log(textStatus + " " + XMLHttpRequest.responseText)
                        },
                    success:
                        function (result) {
                            alert(result.d + "Inserted");
                            $('#msg').text(result.d)

                        }

                });


            });
        });
       
        
    </script>

</asp:Content>
