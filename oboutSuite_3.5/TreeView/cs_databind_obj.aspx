<%@ Page Language="C#" %>

<%@ Import Namespace="System.Linq" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Example Page - Binding With ObjectDataSource</title>
     <style type="text/css">
        body
        {
            font-family: "Segoe UI" ,Arial,sans-serif;
            font-size: 12px;
        }
    </style>

    <script language="C#" runat="server">
        Tree ObTree = null;
        void Page_Init(object sender, EventArgs e)
        {
            ObTree = new Tree()
            {
                ID = "ObTree",
                CssClass = "vista",
                DataSourceID = "ObjectDataSource1"
            };
            
            ObTree.DataBindings.Add(new NodeBinding()
            {
                DataSourceColumnID = "ID",
                DataSourceColumnParentID = "ParentID",
                TextField = "Name",
                ImageUrlField = "ImagePath",
                Expanded = true
            });

            this.TreePlaceHolder.Controls.Add(ObTree);

        }       
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <br />
		<a class="examples" href="Default.aspx?type=ASPNET">� Back to examples</a>
		<br />
     <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <h2>
        ASP.NET TreeView - Binding With ObjectDataSource</h2>
    <asp:ObjectDataSource ID="ObjectDataSource1" TypeName="Roles" SelectMethod="GetRoles"
        runat="server"></asp:ObjectDataSource>
    <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
