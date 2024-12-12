<%@ Page Title="" Language="C#" MasterPageFile="~/user/DefaultUser.Master" AutoEventWireup="true" CodeBehind="ConsultaUser.aspx.cs" Inherits="Biblio.UI.user.ConsultaUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/StyleUser.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gv1" runat="server" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="EmailUsuario" HeaderText="Email Do Usuário" />
            <asp:BoundField DataField="SenhaUsuario" HeaderText="Senha Do Usuário" />
        </Columns>
    </asp:GridView>
    <br />
    <br />

    <%--filter--%>
    <ul>
        <li>
            <asp:TextBox ID="txtFiltro" runat="server" placeholder="Filtrar por Gênero:" MaxLength="150"></asp:TextBox>

            <asp:Button ID="btnFilter" runat="server" Text="Filter" OnClick="btnFilter_Click" />
            <asp:Button ID="btnClearFilter" runat="server" Text="Clear Filter" OnClick="btnClearFilter_Click" />

            <asp:Label ID="lblFilter" runat="server" Text=""></asp:Label>
        </li>
    </ul>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

    <%--gridView--%>
    <%-- Repeater de filmes --%>
    <div class="card-container">
        <asp:Repeater ID="rptLivro" runat="server" OnItemCommand="rptLivro_ItemCommand">
            <ItemTemplate>
                <div class="card">
                    <!-- Título do filme -->
                    <h3><%# Eval("TituloLivro") %></h3>
                    <p>Editora: <%# Eval("EditoraLivro") %></p>
                    <p>Autor: <%# Eval("AutorLivro") %></p>
                    <p>Data de publicação: <%# Eval("DtPubli", "{0:dd/MM/yyyy}") %></p>
                    <p>Sinopse: <%# Eval("SinopseLivro") %></p>


                    <!-- Gênero -->
                    <p>Gênero: <%# Eval("GeneroId") %></p>

                    <!-- Imagem do filme -->
                    <img class="card-img" src="<%# ResolveUrl(Eval("UrlLivro").ToString()) %>" alt="Imagem do Livro" />

                    <!-- PDF -->
                    <div id="DivPDF" runat="server">
                        <%-- Verifica se o UrlPDF existe e cria um link de download --%>
                        <asp:HyperLink ID="hlDownloadPDF" runat="server"
                            Text="Baixar PDF"
                            NavigateUrl='<%# Eval("UrlPDF") %>'
                            Visible='<%# !string.IsNullOrEmpty(Eval("UrlPDF").ToString()) %>'
                            Target="_blank">
                        </asp:HyperLink>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

