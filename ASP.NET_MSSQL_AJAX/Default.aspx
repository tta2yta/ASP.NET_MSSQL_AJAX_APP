<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASP.NET_MSSQL_AJAX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="sales-man-form">
          <h2>ASP.NET with JQUERY(Ajax) to insert and retrieve Record</h2>
              <div><h3>Enter Details About Sales Manager</h3></div>
                  
        
            
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/AjaxWithScriptManager.aspx">Script Manager</asp:LinkButton>
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
           <div style="display:flex; flex-direction:row">
                <div style="text-align:right; border:1px red solid; width:30%">
                      <label >Enter Date of Birth</label>
                </div>
              
               <%-- <asp:TextBox ID="txtdob" runat="server" Height="27px" Width="25%"></asp:TextBox>--%>
                 <div style="text-align:left; border:1px red solid; width:70%">
                    <input type="date" id="txtdob" name="birthdaytime" value="2020-07-02" />
                   <%--%--  <asp:Calendar ID="txtdob" runat="server" SelectedDate="11/11/2020 13:30:28"></asp:Calendar>--%>
                  </div>
            </div> 
            <div style="display:flex; flex-direction:row">
                <div style="text-align:right; border:1px red solid; width:30%">
                    <label style=" width:15%; text-align:right">Enter Income</label>
                    </div>
                 <div style="text-align:left; border:1px red solid; width:70%">
                      <input type="text" name="money" id="money" style="width:25%;height:27px" />
                     </div>
               
            </div>
      
            <div style=" display:flex; flex-direction:row; border:1px blue solid;">
                <input type="button" id="add" style="margin-left: 40%;" value="add" onclick="addRecord()" />

            </div>
    
        
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
                //var age=$("#age).val();
                const dob = document.getElementById("txtdob").value
               
                const money = document.getElementById("money").value;
                if (name == "" || age == "" || money == "" || dob == "") {
                    alert("Please Enter a Value in the field");
                    return;
                }
                data = {
                    'name': name,
                    'age': age,
                    'dob': dob,
                    'money': money
                };
             // alert(JSON.stringify(data));
                console.log(data);
              //return;
                var pagePath = window.location.pathname + "/addRecord";
                var dataString = "{ 'value':'ab} ";
              //alert(pagePath);

                $.ajax({
                    type: "POST",
                    url: "Default.aspx/addRecord",
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
                            console.log(result.d)
                            res = handleDisplaydata(result.d)
                            $('#msg').html(res)

                        }

                });


            });

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
        });
       
        
    </script>

</asp:Content>
