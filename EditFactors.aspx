<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditFactors.aspx.cs" Inherits="EditFactors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style3 {
            width: 925px;
        }
        .auto-style4 {
            width: 250px;
        }
        .auto-style6 {
            width: 73px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table align="center" class="auto-style3" dir="rtl">
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="Label93" runat="server" CssClass="labelTitle" Text="ویرایش فاکتورهای بازرسی"></asp:Label>
                        </td>
                        <td style="text-align: left">
                <asp:Button ID="btnReturnHome" runat="server" CssClass="label" OnClick="btnReturnHome_Click" Text="بازگشت" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080" style="text-align: right">
                <asp:ScriptManager ID="SM1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style1" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label17" runat="server" CssClass="label" Text="4- تعداد  اعضاء حاضر در شعبه شورا حین بازرسی از حیث رعایت حدنصاب  قانونی در جلسه رسیدگی؟ "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSAzaINS" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlAzaINS" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <table align="right" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label36" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblAzaINSID" runat="server" CssClass="labelItems" Text="ddlAzaINS"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label37" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblAzaINSValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label38" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAzaINSTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnAzaINSInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnAzaINSInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnAzaINSCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnAzaINSCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSAzaINS" ForeColor="#333333" GridLines="None" Width="700px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                         </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080" style="text-align: right">                 
                <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style1" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label18" runat="server" CssClass="label" Text="5- نحوه ساعت حضور اعضاء و روزهای تشکیل جلسات شورا: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSSaatHozoor" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlSaatHozoor" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <table align="right" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label39" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblSaatHozoorID" runat="server" CssClass="labelItems" Text="ddlSaatHozoor"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label40" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblSaatHozoorValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label41" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSaatHozoorTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSaatHozoorInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnSaatHozoorInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnSaatHozoorCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnSaatHozoorCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView4" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSSaatHozoor" Width="700px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080">
                <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style1" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label19" runat="server" CssClass="label" Text="6- نحوه کنترل پرداخت هزینه دادرسی و تمبر مالیاتی وکالت نامه با توجه به میزان خواسته بر مبنای توافق یا تعرفه قانونی در صورت دخالت وکیل: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSPardakht" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlPardakht" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <table align="right" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label42" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblPardakhtID" runat="server" CssClass="labelItems" Text="ddlPardakht"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label43" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblPardakhtValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label44" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPardakhtTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnPardakhtInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnPardakhtInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnPardakhtCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnPardakhtCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView5" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSPardakht" style="text-align: right" Width="700px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                         </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080" style="text-align: right">
                <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style1" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label20" runat="server" CssClass="label" Text="7- صدور دستور متناسب با درخواست برای تکمیل درخواست توسط خواهان  و تعیین وقت رسیدگی: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSDastoor" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlDastoor" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="right" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label45" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDastoorID" runat="server" CssClass="labelItems" Text="ddlDastoor"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label46" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDastoorValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label47" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDastoorTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnDastoorInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnDastoorInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnDastoorCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnDastoorCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView6" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSDastoor" Width="700px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                            </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel5" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style1" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label21" runat="server" CssClass="label" Text="8- آیا  اهتمام به صلح و سازش در شعبه توسط اعضای شورا بعمل آمده است یا خیر؟ "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSddlSolh" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlSolh" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label48" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblSolhID" runat="server" CssClass="labelItems" Text="ddlSolh"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label49" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblSolhValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label50" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSolhTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSolhInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnSolhInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnSolhCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnSolhCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID,Value" DataSourceID="SDSddlSolh" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CssClass="labelItems" Width="700px">
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                            </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                 <asp:UpdatePanel ID="UpdatePanel6" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style1" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label22" runat="server" CssClass="label" Text="9- انجام استعلامات مورد نیاز یا مطالبه پرونده استنادی احدی از طرفین پرونده یا سوابق استناد و عنداللزوم ارجاع به کارشناس بنا به درخواست طرفین یا رأساً توسط شورا: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSEstelamat" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlEstelamat" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label51" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEstelamatID" runat="server" CssClass="labelItems" Text="ddlEstelamat"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label52" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEstelamatValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label53" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEstelamatTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnEstelamatInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnEstelamatInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnEstelamatCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnEstelamatCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView3" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSEstelamat" Width="700px">
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                             </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel7" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style1" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label23" runat="server" CssClass="label" Text="10- نحوه ی تصمیم گیری در خصوص درخواست های مطروحه از قبیل تأمین خواسته، توقیف عملیات اجرایی و تأخیر اجرای حکم  و تعیین خسارت  احتمالی با توجه به مستندات تقدیمی: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSTasmim" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlTasmim" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label54" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTasmimID" runat="server" CssClass="labelItems" Text="ddlTasmim"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label55" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTasmimValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label56" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTasmimTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnTasmimInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnTasmimInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnTasmimCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnTasmimCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView7" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSTasmim" Width="700px">
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                             </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel8" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label24" runat="server" CssClass="label" Text="11- وضعیت ابلاغ اوراق قضایی خصوصاً ابلاغ وقت رسیدگی یا حصول اطمینان از اطلاع خوانده از وقت رسیدگی توسط اعضای شورا: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSEblagh" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlEblagh" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label57" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEblaghID" runat="server" CssClass="labelItems" Text="ddlEblagh"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label58" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEblaghValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label59" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEblaghTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnEblaghInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnEblaghInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnEblaghCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnEblaghCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView8" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSEblagh" Width="700px">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                             </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel9" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label25" runat="server" CssClass="label" Text="12- بررسی نحوه ی تنظیم صورت جلسه  رسیدگی توسط اعضای شورا و ذکر موارد ضروری مانند حضور طرفین دعوی ،ابلاغ اخطاریه به طرفین یا اطلاع آنها از وقت رسیدگی به طریق ممکن و احراز هویت حاضرین از حیث فراهم بودن یا نبودن موجبات رسیدگی: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSSooratJalaseh" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlSooratJalaseh" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label60" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblSooratJalasehID" runat="server" CssClass="labelItems" Text="ddlSooratJalaseh"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label61" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblSooratJalasehValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label62" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSooratJalasehTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSooratJalasehInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnSooratJalasehInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnSooratJalasehCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnSooratJalasehCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView9" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSSooratJalaseh" Width="700px">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                            </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel10" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label26" runat="server" CssClass="label" Text="13- اظهار نظر در خصوص ایرادات مطروحه از ناحیه اصحاب دعوی  و نمایندگان آنها در موعد مقرر قانونی: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSIradat" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlIradat" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td class="auto-style6">
                            <asp:Label ID="Label63" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblIradatID" runat="server" CssClass="labelItems" Text="ddlIradat"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">
                            <asp:Label ID="Label64" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblIradatValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">
                            <asp:Label ID="Label65" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtIradatTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">&nbsp;</td>
                        <td>
                            <asp:Button ID="btnIradatInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnIradatInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnIradatCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnIradatCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView10" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSIradat" Width="700px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                             </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel11" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label27" runat="server" CssClass="label" Text="14- رعایت مقررات  مربوط در دعاوی طاری(رسیدگی توام،مواعد قانونی و مرجع ذی صلاح) وفق ماده 21 قانون شورای حل اختلاف: "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSTari" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlTari" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label66" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTariID" runat="server" CssClass="labelItems" Text="ddlTari"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label67" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTariValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label68" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTariTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnTariInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnTariInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnTariCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnTariCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView11" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSTari" Width="700px">
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                            </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel12" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label28" runat="server" CssClass="label" Text="15- اعلام نظریه مشورتی توسط اعضای شورا طبق ماده 9 قانون شورا به عمل آمده یا خیر؟  و آیا قاضی شورا  به این موضوع توجه نموده یا خیر؟ "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSMashverat" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlMashverat" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label69" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblMashveratID" runat="server" CssClass="labelItems" Text="ddlMashverat"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label70" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblMashveratValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label71" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMashveratTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnMashveratInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnMashveratInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnMashveratCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnMashveratCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView12" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSMashverat" Width="700px">
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                             </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel13" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label29" runat="server" CssClass="label" Text="16- آیا جایگاه بندهای ماده 107 قانون آیین دادرسی  مدنی و ماده 95 قانون موصوف از حیث صدور قرارهای مندرج در آنها رعایت گردید یا خیر؟ "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSMadeh" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlMadeh" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label72" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblMadehID" runat="server" CssClass="labelItems" Text="ddlMadeh"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label73" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblMadehValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label74" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMadehTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnMadehInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnMadehInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnMadehCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnMadehCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView13" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSMadeh" Width="700px">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                             </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel14" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label30" runat="server" CssClass="label" Text="17- منظم بودن پرونده از حیث برگ شماری و ممهور بودن آنها به مهر شورا :  "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSNazm" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlNazm" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label75" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblNazmID" runat="server" CssClass="labelItems" Text="ddlNazm"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label76" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblNazmValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label77" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNazmTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnNazmInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnNazmInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnNazmCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnNazmCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView14" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSNazm" Width="700px">
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                            </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                 <asp:UpdatePanel ID="UpdatePanel15" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label31" runat="server" CssClass="label" Text="18- آیا صدور دستور تخلیه در اجرای ماده 3 قانون روابط موجر و مستاجر مصوب سال 76 ظرف مهلت مقرر قانونی یک هفته ای از زمان تقدیم دادخواست به مرحله اجرا درآمده است یا خیر؟ "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSTakhliyeh" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlTakhliyeh" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label78" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTakhliyehID" runat="server" CssClass="labelItems" Text="ddlTakhliyeh"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label79" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTakhliyehValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label80" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtTakhliyehTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnTakhliyehInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnTakhliyehInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnTakhliyehCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnTakhliyehCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView15" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSTakhliyeh" Width="700px">
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                             </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                 <asp:UpdatePanel ID="UpdatePanel16" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label32" runat="server" CssClass="label" Text="19- احراز صحت جریان عملیات اجرایی به منظور تایید آن توسط قاضی صادر کننده  صورت گرفته است یا خیر؟ "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSEjraei" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlEjraei" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label81" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEjraeiID" runat="server" CssClass="labelItems" Text="ddlEjraei"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label82" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEjraeiValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label83" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEjraeiTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnEjraeiInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnEjraeiInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnEjraeiCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnEjraeiCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView16" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSEjraei" Width="700px">
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                            </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                 <asp:UpdatePanel ID="UpdatePanel17" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label33" runat="server" CssClass="label" Text="20- آیا نتیجه پرونده های ارجاعی از مراجع قضایی  در اجرای ماده 11 قانون شورا در موعد مقرر حداکثر سه ماهه به مرجع مربوط اعاده می گردد یا خیر؟ "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSPErjaei" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlPErjaei" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label84" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblPErjaeiID" runat="server" CssClass="labelItems" Text="ddlPErjaei"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label85" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblPErjaeiValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label86" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPErjaeiTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnPErjaeiInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnPErjaeiInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnPErjaeiCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnPErjaeiCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView17" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSPErjaei" Width="700px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                              </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel18" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label34" runat="server" CssClass="label" Text="21- آیا صدور گزارش اصلاحی توسط اعضاء و تایید آن توسط قاضی شورا طبق ماده 24 قانون شورا  به عمل آمده است یا خیر؟ "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSEslahi" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlEslahi" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label87" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEslahiID" runat="server" CssClass="labelItems" Text="ddlEslahi"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label88" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEslahiValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label89" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEslahiTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnEslahiInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnddlEslahiInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnEslahiCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnEslahiCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView18" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSEslahi" Width="700px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="کد آیتم" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="مقدار" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="عنوان آیتم" SortExpression="Item" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                             </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border-style: double; border-width: thin; border-color: #808080; text-align: right">
                <asp:UpdatePanel ID="UpdatePanel19" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <fieldset>
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td colspan="2">
                <asp:Label ID="Label35" runat="server" CssClass="label" Text="22- آیا رسیدگی قاضی شورا به پرونده های کیفری از حیث رعایت صلاحیت، نوع تفهیم اتهام، أخذ آخرین دفاع و أخذ تأمین مناسب و رعایت مستندات قانونی در موارد اعمال کیفیات مخففه قانونی به نحو  قانونی  و  صحیح انجام پذیرفته یا خیر؟ "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:SqlDataSource ID="SDSResidegi" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi_Items] WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item" InsertCommand="INSERT INTO [TblBazrasi_Items] ([ID], [Value], [Item]) VALUES (@ID, @Value, @Item)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TblBazrasi_Items] WHERE ([ID] = @ID) ORDER BY [Value]" UpdateCommand="UPDATE [TblBazrasi_Items] SET [Item] = @Item WHERE [ID] = @original_ID AND [Value] = @original_Value AND [Item] = @original_Item">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="Value" Type="String" />
                        <asp:Parameter Name="Item" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="ddlResidegi" Name="ID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Item" Type="String" />
                        <asp:Parameter Name="original_ID" Type="String" />
                        <asp:Parameter Name="original_Value" Type="String" />
                        <asp:Parameter Name="original_Item" Type="String" />
                    </UpdateParameters>
                            </asp:SqlDataSource>
                <table align="center" class="auto-style4" dir="rtl">
                    <tr>
                        <td>
                            <asp:Label ID="Label90" runat="server" CssClass="labelItems" Text="کد آیتم: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblResidegiID" runat="server" CssClass="labelItems" Text="ddlResidegi"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label91" runat="server" CssClass="labelItems" Text="مقدار: "></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblResidegiValue" runat="server" CssClass="labelItems"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label92" runat="server" CssClass="labelItems" Text="عنوان آیتم:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtResidegiTitle" runat="server" CssClass="labelItems"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnResidegiInsert" runat="server" CssClass="labelItems" Text="ثبت" OnClick="btnResidegiInsert_Click" />
&nbsp;&nbsp;
                            <asp:Button ID="btnResidegiCancel" runat="server" CssClass="labelItems" Text="انصراف" OnClick="btnResidegiCancel_Click" />
&nbsp;&nbsp; </td>
                    </tr>
                </table>
                        </td>
                        <td>
                <asp:GridView ID="GridView19" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CssClass="labelItems" DataKeyNames="ID,Value" DataSourceID="SDSResidegi" Width="700px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" ShowDeleteButton="True" ShowEditButton="True" UpdateText="تایید" />
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="Value" HeaderText="Value" ReadOnly="True" SortExpression="Value" />
                        <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                        </td>
                    </tr>
                </table>
                             </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:Button ID="btnReturn2" runat="server" CssClass="label" OnClick="btnReturn2_Click" Text="بازگشت" />
            </td>
        </tr>
        </table>
</asp:Content>

