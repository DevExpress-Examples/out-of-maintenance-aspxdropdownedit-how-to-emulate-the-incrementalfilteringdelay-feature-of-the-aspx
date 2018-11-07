<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTimer" tagprefix="dxt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">
        var timerCounter = 0;
        var filterTimeout = 2;

        function ProcessTick() {
            timerCounter += 1;
            if (timerCounter == filterTimeout && dropdown.GetText() != '') {
                grid.PerformCallback(dropdown.GetText());

            }
        }

        function ProcessKeyDown() {

            timer.SetEnabled(false);
            timerCounter = 0;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <dx:aspxdropdownedit ID="ASPxDropDownEdit1" runat="server" ClientInstanceName="dropdown">
        <DropDownWindowTemplate>
            <dx:aspxgridview ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="AccessDataSource1" KeyFieldName="ProductID" 
                ClientInstanceName="grid" oncustomcallback="ASPxGridView1_CustomCallback">
                <columns>
                   
                    <dx:gridviewdatatextcolumn FieldName="ProductName" VisibleIndex="1">
                    </dx:gridviewdatatextcolumn>
                  
                </columns>
                <clientsideevents EndCallback="function(s,e){ dropdown.ShowDropDown();dropdown.AdjustDropDownWindow();}" />
            </dx:aspxgridview>
        </DropDownWindowTemplate>
        <clientsideevents KeyDown="function(s, e) {ProcessKeyDown()}" KeyUp="function(s, e) {timer.SetEnabled(true);}" />
    </dx:aspxdropdownedit>
    <asp:accessdatasource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/nwind.mdb" 
        SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice] FROM [Products]">
    </asp:accessdatasource>
    </div>
    <dxt:aspxtimer ID="ASPxTimer1" runat="server" ClientInstanceName="timer" 
        Interval="1000" Enabled="False">
        <clientsideevents tick="function(s, e) {ProcessTick();}" />
    </dxt:aspxtimer>
    </form>
</body>
</html>

