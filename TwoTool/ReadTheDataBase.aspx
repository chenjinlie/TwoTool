<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ReadTheDataBase.aspx.cs" Inherits="TwoTool.ReadTheDataBase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #conn {
            width: 95%;
            margin: 0px auto;
        }

        #databasename {
            width: 95%;
            margin: 0px auto;
        }

        #conndatermine {
            width: 90%;
            margin: 0px auto;
        }
    </style>
    <script type="text/javascript">
        function database() {
            var con = $("#conn").val();
            var databasename = $("#databasename").val();
            var user = $("#user").val();
            var pwd = $("#pwd").val();
            $.ajax({
                type: "POST",
                url: "Ajax/DataTable.ashx",
                data: { con: con, databasename: databasename, user: user, pwd: pwd },
                success: function (table) {
                    $("#tbox").css("display", "none");
                    $("#database").css("display", "block");
                    document.getElementById("database").innerHTML = table;
                }
            })
        }
    </script>
    <div clas="demo-type-example">
        <div class="col-xs-1">
        </div>
        <div class="col-xs-10" id="tbox">
            <div class="tile">
                <%--<h3 class="tile-title">输入数据库地址</h3>
                <p>Enter the database connection string</p>
                <input class="form-control" id="conn" type="search" value placeholder="server=xxxxx;database=xxxxxx;uid=xxxx;pwd=xxxxxxx" />--%>

                <h3 class="tile-title" style="margin-top: 20px;">输入数据库名字</h3>
                <p>Enter the database connection string</p>
                <input class="form-control" id="databasename" type="search" value placeholder="数据库名字" />

                <h3 class="tile-title">输入数据库地址</h3>
                <p>Enter the database connection string</p>
                <input class="form-control" id="conn" type="search" value placeholder="ip" />

                <h3 class="tile-title">输入数据库用户名</h3>
                <p>Enter the database connection string</p>
                <input class="form-control" id="user" type="search" value placeholder="user" />

                <h3 class="tile-title">输入数据库密码</h3>
                <p>Enter the database connection string</p>
                <input class="form-control" id="pwd" type="search" value placeholder="pwd" />


                <div style="height: 200px;"></div>
                <a class="btn btn-primary btn-large btn-block" id="conndatermine" runat="server" onclick="database()">Get Pro</a>
                <%--<asp:Button class="btn btn-primary btn-large btn-block" ID="conndatermine" runat="server" OnClick="conndatermine_Click" Text="Get Pro"></asp:Button>--%>
                <%--<asp:button class="btn btn-primary btn-large btn-block" id="conndatermine" runat="server">Get Pro</asp:button>--%>
            </div>
        </div>
        <div class="col-xs-10" id="database" style="display: none">
        </div>
    </div>
</asp:Content>
