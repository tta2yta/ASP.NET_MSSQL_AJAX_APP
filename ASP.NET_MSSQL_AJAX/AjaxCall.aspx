<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxCall.aspx.cs" Inherits="ASP.NET_MSSQL_AJAX.AjaxCall" %>

<!DOCTYPE html>  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head runat="server">  
    <title></title>  
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>  
 <script>  
     $(document).ready(function () {  
         $.ajax({  
             type: "POST",  
             url: "AjaxCall.aspx/GetData",  
             contentType: "application/json; charset=utf-8",  
             dataType: "json",  
             success: function (response) {  
                 var names = response.d;  
                 alert(names);  
             },  
             failure: function (response) {  
                 alert(response.d);  
             }  
         });  
     });  
 </script>  
</head>  
<body>  
<form id="frm" method="post">  
    <div id="Content">  
    </div>  
</form>  
</body>  
</html> 
