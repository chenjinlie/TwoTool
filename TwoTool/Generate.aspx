<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Generate.aspx.cs" Inherits="TwoTool.Generate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-xs-2" id="tbox">
        <div class="tile">
            <h3 class="tile-title">输入数据库连接字符串</h3>
            <p>Enter the database connection string</p>
            <input class="form-control" id="conn" type="search" value placeholder="server=xxxxx;database=xxxxxx;uid=xxxx;pwd=xxxxxxx" />
            <h3 class="tile-title" style="margin-top: 20px;">输入数据库名字</h3>
            <p>Enter the database connection string</p>
            <input class="form-control" id="databasename" type="search" value placeholder="数据库名字" />
            <h3 class="tile-title" style="margin-top: 20px;">选择数据库操作</h3>
            <p>Sekect database operatuibs</p>

            <div class="btn-group">
                <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">Default <span class="caret"></span></button>
                <ul role="menu" class="dropdown-menu">
                    <li><a href="#">SELECT</a></li>
                    <li><a href="#">UPDATE</a></li>
                    <li><a href="#">INSERT</a></li>
                    <li class="divider"></li>
                    <li><a href="#">多表连接</a></li>
                </ul>
            </div>
            <div style="height: 200px;"></div>
            <a class="btn btn-primary btn-large btn-block" id="conndatermine" runat="server" onclick="database()">Get Pro</a>

        </div>
    </div>
    <div class="col-xs-10">
        <div class="tile">
        </div>
    </div>
</asp:Content>
