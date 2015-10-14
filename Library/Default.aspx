<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" Async="true" CodeBehind="Default.aspx.cs" Inherits="Library._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

                <h2 id="find">Find Books</h2>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row" id="search">
                <div class="col-md-4">

                    <p>
                        Author: 
               
                        <asp:DropDownList ID="ddlAuthor" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAuthor_SelectedIndexChanged"></asp:DropDownList>
                    </p>
                </div>
            </div>

            <asp:Repeater ID="repBooks" runat="server">

                <HeaderTemplate>
                    <table class="table table-hover">
                        <tr>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Author</th>
                            <th>Summary</th>
                        </tr>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%# Eval("name") %></td>
                        <td><%# Eval("category.name") %></td>
                        <td><%# Eval("author.name") %></td>
                        <td><%# Eval("summary") %></td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
               
                </FooterTemplate>

            </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
