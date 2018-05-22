 <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TwoTool.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--中间选择部分--%>


    <div id="content" style="width: 98%; margin-left: 1%;">
        <div class="row demo-tiles">
            <div class="col-xs-3">
                <div class="tile">
                    <img src="img/icons/png/cloud_download_72px_1181762_easyicon.net.png" alt="Pensils" class="tile-image" />
                    <h3 class="tile-title">二部工具包</h3>
                    <p>Toolkit</p>
                    <a class="btn btn-primary btn-large btn-block" target="_blank" href="Tool.aspx">Get Pro</a>
                </div>
            </div>
            <div class="col-xs-3">
                <div class="tile">
                    <img src="img/icons/svg/Map.svg" alt="Pensils" class="tile-image" />
                    <h3 class="tile-title">主外键关系</h3>
                    <p>Generating the SQL statement</p>
                    <a class="btn btn-primary btn-large btn-block" target="_blank" href="Generate.aspx">Get Pro</a>
                </div>
            </div>

            <div class="col-xs-3">
                <div class="tile">
                    <img src="img/icons/svg/pencils.svg" alt="Pensils" class="tile-image">
                    <h3 class="tile-title">读取数据库结构</h3>
                    <p>Read the database</p>
                    <a class="btn btn-primary btn-large btn-block" target="_blank" href="ReadTheDataBase.aspx">Get Pro</a>
                </div>
            </div>

            <div class="col-xs-3">
                <div class="tile">
                    <img src="img/icons/svg/compas.svg" alt="Compas" class="tile-image big-illustration">
                    <h3 class="tile-title">地图选点工具</h3>
                    <p>Map selection tool</p>
                    <a class="btn btn-primary btn-large btn-block" href="#">Get Pro</a>
                </div>
            </div>


            <div class="col-xs-3">
                <div class="tile">
                    <img src="img/icons/png/time_128px_1201398_easyicon.net.png" alt="Compas" class="tile-image big-illustration">
                    <h3 class="tile-title">绩效可视化工具</h3>
                    <p>Performance visualization tools </p>
                    <a class="btn btn-primary btn-large btn-block" href="Ac.aspx">Get Pro</a>
                </div>
            </div>

            <div class="col-xs-3">
                <div class="tile">
                    <img src="img/icons/png/time_128px_1201398_easyicon.net.png" alt="Compas" class="tile-image big-illustration">
                    <h3 class="tile-title">修改图片长宽高</h3>
                    <p>Performance visualization tools </p>
                    <a class="btn btn-primary btn-large btn-block" href="Design/PictureTool.aspx">Get Pro</a>
                </div>
            </div>

            <div class="col-xs-3">
                <div class="tile">
                    <img src="img/icons/svg/loop.svg" alt="Infinity-Loop" class="tile-image">
                    <h3 class="tile-title">更多功能待开发</h3>
                    <p>Moe functions</p>
                    <a class="btn btn-primary btn-large btn-block" href="#">Get Pro</a>
                </div>
            </div>



            <div class="col-xs-3">
                <div class="tile tile-hot">
                    <img src="img/icons/svg/ribbon.svg" alt="ribbon" class="tile-hot-ribbon">
                    <img src="img/icons/svg/chat.svg" alt="Chat" class="tile-image">
                    <h3 class="tile-title">联系我们</h3>
                    <p>Your likes, shares and comments helps us.</p>
                    <a class="btn btn-primary btn-large btn-block" href="#">Get Pro</a>
                </div>
            </div>

        </div>
    </div>
    <%--中间选择部分完成--%>
</asp:Content>
