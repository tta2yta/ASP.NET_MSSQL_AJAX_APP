<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASP.NET_MSSQL_AJAX._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   <label>Enter Sales Manager Name</label><asp:TextBox ID="txtname" runat="server"></asp:TextBox><br />
    <input type="button" id="add" value="add" />
    <asp:Button ID="addajax" Text="AJAX" runat="server" OnClick="addajax_Click"/>

   
  <div>
    <table>
       <tr>
          <td>Enter the year:</td>
          <td>
             <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>
         </td>
      </tr>
      <tr>
         <td colspan="2">
           <asp:Button ID="btnAjax" runat="server" OnClientClick="callAjaxMethod(event)"  Text="Call method using Ajax" />
        </td>
      </tr>
   </table>
  </div>
  <div>
    <table>
      <tr>
         <td>Result:</td>
           <td><asp:TextBox ID="txtIsLeapYear" runat="server"></asp:TextBox></td>
      </tr>
    </table>
  </div>


    <script src="https://ajax.googleapis.com/ajax/libs/d3js/6.2.0/d3.min.js"></script>
    <script>

       

        $(document).ready(function () {
            $('#add').click(function () {
                alert("Hello")
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
