<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ElectronicInvoice.aspx.cs" Inherits="ElectronicInvoice_App.ElectronicInvoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Electronic Invoice</title>

    <link href="Styles/GeneralStyles.css" rel="stylesheet" type="text/css" />
</head>
<body class="body">
    <div class="header">
        <div class="header_control">
            <asp:Label ID="Label1" runat="server" Text="Pricesmart"></asp:Label>
        </div>
        <div class="header_control">
        </div>
        <div class="header_control">
            <asp:Label ID="lblClub" runat="server" Text="Club:"></asp:Label>
            <asp:Label ID="lblValueClub" runat="server" Text=""></asp:Label>
        </div>
        <div class="header_control">
        </div>
        <div class="header_control">
            <asp:Label ID="lblUsername" runat="server" Text="Username:"></asp:Label>
            <asp:Label ID="lblValueUsername" runat="server" Text="Jonathan Solano"></asp:Label>
        </div>
    </div>
    <div class="title_message">
        <asp:Label ID="lblMessage" runat="server" Text="Electronic Invoice Data"></asp:Label>
    </div>
    <form id="frmElectronicInvoice" runat="server">
        <div class="title_select">
            <div>
                <asp:Label ID="lblDocumentType" runat="server" Text="Select document type:"></asp:Label>
                <asp:DropDownList ID="ddlDocumentType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlDocumentType_SelectedIndexChanged" DataValueField="Value" DataTextField="Document">
                    <asp:ListItem Value="1">Electronic Invoice</asp:ListItem>
                    <asp:ListItem Value="2">Electronic Export Invoice</asp:ListItem>
                    <asp:ListItem Value="3">Fiscal Credit</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form_control">
            <div>
                <div class="form_control_child">
                    <asp:Label ID="lblMembership" runat="server" Text="Membership:" Width="115px"></asp:Label>
                    <asp:TextBox ID="txtMembership" runat="server"></asp:TextBox>
                </div>
            </div>
            <div>
                <div class="form_control_child">
                    <asp:Label ID="lblIdType" runat="server" Text="ID Type:" Width="115px"></asp:Label>
                    <asp:DropDownList ID="ddlIDType" runat="server" Width="177px" Height="21px" DataValueField="Value" DataTextField="Name">
                        <asp:ListItem Value="01">DUI</asp:ListItem>
                        <asp:ListItem Value="02">NIT</asp:ListItem>
                        <asp:ListItem Value="03">Pasaporte</asp:ListItem>
                        <asp:ListItem Value="04">Carnet de Residente</asp:ListItem>
                        <asp:ListItem Value="05">Otro</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div>
                <div class="form_control_child">
                    <asp:Label ID="lblId" runat="server" Text="ID:" Width="115px"></asp:Label>
                    <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                </div>
            </div>
            <div>
                <div class="form_control_child">
                    <asp:Label ID="lblName" runat="server" Text="Name:" Width="115px"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </div>
            </div>
            <div>
                <div class="form_control_child">
                    <asp:Label ID="lblEmail" runat="server" Text="Email:" Width="115px"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </div>
            </div>
            <div>
                <div class="form_control_child">
                    <asp:Label ID="lblNRC" runat="server" Text="NRC:" Width="115px"></asp:Label>
                    <asp:TextBox ID="txtNRC" runat="server"></asp:TextBox>
                </div>
            </div>
            <div>
                <div class="form_control_child">
                    <asp:Label ID="lblDepartment" runat="server" Text="Department:" Width="115px" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlDepartment" runat="server" Width="177px" Height="21px" DataValueField="Id" DataTextField="Name" Visible="false" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div>
                <div class="form_control_child">
                    <asp:Label ID="lblMunicipality" runat="server" Text="Municipality:" Width="115px" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlMunicipality" runat="server" Width="177px" Height="21px" DataValueField="Id" DataTextField="Name" Visible="false">
                        <asp:ListItem Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form_button">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="BtnSave_Click" Width="80px" />
            </div>
        </div>
    </form>
    <footer>
    </footer>
</body>
</html>
