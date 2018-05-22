<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PictureTool.aspx.cs" Inherits="TwoTool.Design.PictureTool" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-xs-1"></div>
    <div class="col-xs-10">
        <asp:Repeater ID="Repeater_item" runat="server" OnItemDataBound="Repeater_item_ItemDataBound" OnItemCommand="Repeater_item_ItemCommand">
            <HeaderTemplate>
                <table class="table table-striped table-hover" style="border: 2px solid #f1f1f1;">
                    <thead>
                        <tr>
                            <th>编号</th>
                            <th>名称</th>
                            <th>宽度（px）</th>
                            <th>高度（px）</th>
                            <th>输入宽度</th>
                            <th>输入高度</th>
                            <th>按钮</th>
                        </tr>
                    </thead>
            </HeaderTemplate>
            <ItemTemplate>
                <tbody>
                    <tr runat="server">
                        <th id="ID" runat="server">
                            <%#Eval("ID") %>
                        </th>
                        <th id="Name" runat="server">
                            <%#Eval("Name") %>
                            <asp:HiddenField ID="hid" runat="server" Value='<%# Eval("Name") %>' />
                        </th>
                        <th id="Width" runat="server">
                            <%#Eval("Width") %>
                        </th>
                        <th id="Height" runat="server">
                            <%#Eval("Height") %>
                        </th>
                        <th id="Input_width" runat="server">
                            <%--<input type="text" runat="server" id="kuan" class="form-control" />--%>
                            <asp:TextBox runat="server" ID="kuan" CssClass="form-control" />
                        </th>
                        <th id="Input_height" runat="server">
                            <%--<input type="text" runat="server" id="gao" class="form-control" />--%>
                            <asp:TextBox runat="server" ID="gao" CssClass="form-control" />
                        </th>
                        <th id="Button" runat="server">
                            <%--<asp:Button runat="server" ID="Btn_Determine" OnClick="Btn_Determine_Click" Text="修改" />--%>

                            <asp:LinkButton ID="lb_Determine" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="update" Text="修改" Class="btn btn-info btn-sm"></asp:LinkButton>
                        </th>
                    </tr>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
