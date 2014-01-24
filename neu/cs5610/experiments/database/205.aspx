<%@ Page Language="C#" AutoEventWireup="true" CodeFile="205.aspx.cs" Inherits="experiments_database_100_create_developer_table" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../../../css/bootstrap.min.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">

        <h1>Filter Tables with Dropdowns</h1>

        <div class="row">
            <div class="col-xs-6">


        <h2>Applications</h2>
        <p>
            Category:
            <asp:DropDownList 
                ID="DropDownList1" 
                runat="server" 
                DataSourceID="ApplicationDataSource" 
                DataTextField="Category" 
                DataValueField="Category" 
                AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource 
                ID="ApplicationDataSource" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" 
                ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" 
                SelectCommand="SELECT DISTINCT [Category] FROM [Application]">
            </asp:SqlDataSource>

            <asp:GridView
                CssClass="table"
                ID="GridView1" 
                runat="server" 
                AutoGenerateColumns="False" 
                DataKeyNames="Id" 
                DataSourceID="SqlDataSource1" 
                EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="Downloads" HeaderText="Downloads" SortExpression="Downloads" />
                    <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                    <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource 
                ID="SqlDataSource1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" 
                ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" 
                SelectCommand="SELECT Id, Name, Price, Downloads, Category, Created FROM Application WHERE (Category = @param_category)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="param_category" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
            </div>
            <div class="col-xs-6">


        <h2>Developers</h2>
        <p>
            Gender: <asp:DropDownList 
                ID="DropDownList2" 
                runat="server" 
                AutoPostBack="True" 
                DataSourceID="DeveloperDataSource" 
                DataTextField="gender" 
                DataValueField="gender">
            </asp:DropDownList>
            <asp:SqlDataSource 
                ID="DeveloperDataSource" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" 
                ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" 
                SelectCommand="SELECT DISTINCT [gender] FROM [Developer]">
            </asp:SqlDataSource>

            <asp:GridView 
                CssClass="table" 
                ID="GridView2" 
                runat="server" 
                AutoGenerateColumns="False" 
                DataKeyNames="Id" 
                DataSourceID="SqlDataSource2" 
                EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource 
                ID="SqlDataSource2" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbConnectionString1 %>" 
                ProviderName="<%$ ConnectionStrings:dbConnectionString1.ProviderName %>" 
                SelectCommand="SELECT Id, firstName, lastName, email, gender FROM Developer WHERE (gender = @param_gender)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="param_gender" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>

            </div>
        </div>

        <h2>Documentation</h2>

        <div class="row">
            <div class="col-xs-6">
                <h2>Applications</h2>
                <h3>Dropdown Implementation</h3>
                <h4>Data Source</h4>
    <pre>
&lt;asp:SqlDataSource 
  ID=&quot;ApplicationDataSource&quot; 
  runat=&quot;server&quot; 
  ConnectionString=&quot;...&quot; 
  ProviderName=&quot;...&quot; 
  SelectCommand=
    &quot;SELECT DISTINCT [Category] FROM [Application]&quot;&gt;
&lt;/asp:SqlDataSource&gt;</pre>
                <h4>Dropdown</h4>
                <pre>
&lt;asp:DropDownList 
  ID=&quot;DropDownList1&quot; 
  runat=&quot;server&quot; 
  DataSourceID=&quot;ApplicationDataSource&quot; 
  DataTextField=&quot;Category&quot; 
  DataValueField=&quot;Category&quot; 
  AutoPostBack=&quot;True&quot;&gt;
&lt;/asp:DropDownList&gt;</pre>
                <h3>Table Implementation</h3>
                <h4>Data Source</h4>
                <pre>
&lt;asp:SqlDataSource 
  ID=&quot;SqlDataSource1&quot; 
  runat=&quot;server&quot; 
  ConnectionString=&quot;...&quot; 
  ProviderName=&quot;...&quot; 
  SelectCommand=
    &quot;SELECT Id, Name, Price, Downloads, Category, Created 
    FROM Application 
    WHERE (Category = @param_category)&quot;&gt;
  &lt;SelectParameters&gt;
    &lt;asp:ControlParameter 
      ControlID=&quot;DropDownList1&quot; 
      Name=&quot;param_category&quot; 
      PropertyName=&quot;SelectedValue&quot; /&gt;
  &lt;/SelectParameters&gt;
&lt;/asp:SqlDataSource&gt;</pre>

                <h4>GridView</h4>
                <pre>
&lt;asp:GridView
  CssClass=&quot;table&quot;
  ID=&quot;GridView1&quot; 
  runat=&quot;server&quot; 
  AutoGenerateColumns=&quot;False&quot; 
  DataKeyNames=&quot;Id&quot; 
  DataSourceID=&quot;SqlDataSource1&quot; 
  EmptyDataText=&quot;...&quot;&gt;
  &lt;Columns&gt;
    ...
  &lt;/Columns&gt;
&lt;/asp:GridView&gt;</pre>
            </div>
            <div class="col-xs-6">
                <h2>Developers</h2>

                <h3>Dropdown Implementation</h3>

                <h4>Data Source</h4>
                <pre>
&lt;asp:SqlDataSource 
  ID=&quot;DeveloperDataSource&quot; 
  runat=&quot;server&quot; 
  ConnectionString=&quot;...&quot; 
  ProviderName=&quot;...&quot; 
  SelectCommand=
    &quot;SELECT DISTINCT [gender] FROM [Developer]&quot;&gt;
&lt;/asp:SqlDataSource&gt;</pre>

                <h4>Dropdown</h4>
                <pre>
&lt;asp:DropDownList 
  ID=&quot;DropDownList2&quot; 
  runat=&quot;server&quot; 
  AutoPostBack=&quot;True&quot; 
  DataSourceID=&quot;DeveloperDataSource&quot; 
  DataTextField=&quot;gender&quot; 
  DataValueField=&quot;gender&quot;&gt;
&lt;/asp:DropDownList&gt;</pre>

                <h3>Table Implementation</h3>

                <h4>Data Source</h4>
                <pre>
&lt;asp:SqlDataSource 
  ID=&quot;SqlDataSource2&quot; 
  runat=&quot;server&quot; 
  ConnectionString=&quot;...&quot; 
  ProviderName=&quot;...&quot; 
  SelectCommand=
    &quot;SELECT Id, firstName, lastName, email, gender
	FROM Developer
	WHERE (gender = @param_gender)&quot;&gt;
  &lt;SelectParameters&gt;
    &lt;asp:ControlParameter 
	  ControlID=&quot;DropDownList2&quot; 
      Name=&quot;param_gender&quot; 
      PropertyName=&quot;SelectedValue&quot; /&gt;
  &lt;/SelectParameters&gt;
&lt;/asp:SqlDataSource&gt;</pre>

                <h4>GridView</h4>
                <pre>
&lt;asp:GridView 
  CssClass=&quot;table&quot; 
  ID=&quot;GridView2&quot; 
  runat=&quot;server&quot; 
  AutoGenerateColumns=&quot;False&quot; 
  DataKeyNames=&quot;Id&quot; 
  DataSourceID=&quot;SqlDataSource2&quot; 
  EmptyDataText=&quot;...&quot;&gt;
  &lt;Columns&gt;
    ...
  &lt;/Columns&gt;
&lt;/asp:GridView&gt;</pre>
            </div>
        </div>

        <h2>Source</h2>

       	<a target="_blank" href="../../fileview/Default.aspx?~/experiments/database/200.aspx">Main ASPX</a><br/>
    </div>
    </form>
</body>
</html>
