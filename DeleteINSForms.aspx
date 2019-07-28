<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteINSForms.aspx.cs" Inherits="DeleteINSForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <table align="center" class="auto-style2" dir="rtl">
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td style="text-align: right">
                            <asp:Label ID="Label2" runat="server" Text="حذف فرم های بازرسی" CssClass="labelTitle"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:Button ID="btnReturn" runat="server" CssClass="label" OnClick="btnReturn_Click" Text="بازگشت" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [CodeB], [SalINS], [MahINS], [RoozINS], [ostan], [shahr], [CodeShobeh], [shobeh], [Houzeh], [LogB] FROM [TblBazrasi]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [TblBazrasi] WHERE [CodeB] = @original_CodeB AND (([SalINS] = @original_SalINS) OR ([SalINS] IS NULL AND @original_SalINS IS NULL)) AND (([MahINS] = @original_MahINS) OR ([MahINS] IS NULL AND @original_MahINS IS NULL)) AND (([RoozINS] = @original_RoozINS) OR ([RoozINS] IS NULL AND @original_RoozINS IS NULL)) AND (([ostan] = @original_ostan) OR ([ostan] IS NULL AND @original_ostan IS NULL)) AND (([shahr] = @original_shahr) OR ([shahr] IS NULL AND @original_shahr IS NULL)) AND [CodeShobeh] = @original_CodeShobeh AND (([shobeh] = @original_shobeh) OR ([shobeh] IS NULL AND @original_shobeh IS NULL)) AND (([Houzeh] = @original_Houzeh) OR ([Houzeh] IS NULL AND @original_Houzeh IS NULL)) AND (([LogB] = @original_LogB) OR ([LogB] IS NULL AND @original_LogB IS NULL))" InsertCommand="INSERT INTO [TblBazrasi] ([SalINS], [MahINS], [RoozINS], [ostan], [shahr], [CodeShobeh], [shobeh], [Houzeh], [LogB]) VALUES (@SalINS, @MahINS, @RoozINS, @ostan, @shahr, @CodeShobeh, @shobeh, @Houzeh, @LogB)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [TblBazrasi] SET [SalINS] = @SalINS, [MahINS] = @MahINS, [RoozINS] = @RoozINS, [ostan] = @ostan, [shahr] = @shahr, [CodeShobeh] = @CodeShobeh, [shobeh] = @shobeh, [Houzeh] = @Houzeh, [LogB] = @LogB WHERE [CodeB] = @original_CodeB AND (([SalINS] = @original_SalINS) OR ([SalINS] IS NULL AND @original_SalINS IS NULL)) AND (([MahINS] = @original_MahINS) OR ([MahINS] IS NULL AND @original_MahINS IS NULL)) AND (([RoozINS] = @original_RoozINS) OR ([RoozINS] IS NULL AND @original_RoozINS IS NULL)) AND (([ostan] = @original_ostan) OR ([ostan] IS NULL AND @original_ostan IS NULL)) AND (([shahr] = @original_shahr) OR ([shahr] IS NULL AND @original_shahr IS NULL)) AND [CodeShobeh] = @original_CodeShobeh AND (([shobeh] = @original_shobeh) OR ([shobeh] IS NULL AND @original_shobeh IS NULL)) AND (([Houzeh] = @original_Houzeh) OR ([Houzeh] IS NULL AND @original_Houzeh IS NULL)) AND (([LogB] = @original_LogB) OR ([LogB] IS NULL AND @original_LogB IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CodeB" Type="Int32" />
                        <asp:Parameter Name="original_SalINS" Type="String" />
                        <asp:Parameter Name="original_MahINS" Type="String" />
                        <asp:Parameter Name="original_RoozINS" Type="String" />
                        <asp:Parameter Name="original_ostan" Type="String" />
                        <asp:Parameter Name="original_shahr" Type="String" />
                        <asp:Parameter Name="original_CodeShobeh" Type="String" />
                        <asp:Parameter Name="original_shobeh" Type="String" />
                        <asp:Parameter Name="original_Houzeh" Type="String" />
                        <asp:Parameter Name="original_LogB" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SalINS" Type="String" />
                        <asp:Parameter Name="MahINS" Type="String" />
                        <asp:Parameter Name="RoozINS" Type="String" />
                        <asp:Parameter Name="ostan" Type="String" />
                        <asp:Parameter Name="shahr" Type="String" />
                        <asp:Parameter Name="CodeShobeh" Type="String" />
                        <asp:Parameter Name="shobeh" Type="String" />
                        <asp:Parameter Name="Houzeh" Type="String" />
                        <asp:Parameter Name="LogB" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="SalINS" Type="String" />
                        <asp:Parameter Name="MahINS" Type="String" />
                        <asp:Parameter Name="RoozINS" Type="String" />
                        <asp:Parameter Name="ostan" Type="String" />
                        <asp:Parameter Name="shahr" Type="String" />
                        <asp:Parameter Name="CodeShobeh" Type="String" />
                        <asp:Parameter Name="shobeh" Type="String" />
                        <asp:Parameter Name="Houzeh" Type="String" />
                        <asp:Parameter Name="LogB" Type="String" />
                        <asp:Parameter Name="original_CodeB" Type="Int32" />
                        <asp:Parameter Name="original_SalINS" Type="String" />
                        <asp:Parameter Name="original_MahINS" Type="String" />
                        <asp:Parameter Name="original_RoozINS" Type="String" />
                        <asp:Parameter Name="original_ostan" Type="String" />
                        <asp:Parameter Name="original_shahr" Type="String" />
                        <asp:Parameter Name="original_CodeShobeh" Type="String" />
                        <asp:Parameter Name="original_shobeh" Type="String" />
                        <asp:Parameter Name="original_Houzeh" Type="String" />
                        <asp:Parameter Name="original_LogB" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" CssClass="labelItems" DataKeyNames="CodeB" DataSourceID="SqlDataSource1" GridLines="Horizontal" PageSize="40" Width="100%">
                    <Columns>
                        <asp:CommandField DeleteText="حذف اطلاعات" ShowDeleteButton="True" />
                        <asp:BoundField DataField="CodeB" HeaderText="کد بازرسی" InsertVisible="False" ReadOnly="True" SortExpression="CodeB" />
                        <asp:BoundField DataField="SalINS" HeaderText="سال بازرسی" SortExpression="SalINS" />
                        <asp:BoundField DataField="MahINS" HeaderText="ماه بازرسی" SortExpression="MahINS" />
                        <asp:BoundField DataField="RoozINS" HeaderText="روز بازرسی" SortExpression="RoozINS" />
                        <asp:BoundField DataField="ostan" HeaderText="استان" SortExpression="ostan" />
                        <asp:BoundField DataField="shahr" HeaderText="شهر" SortExpression="shahr" />
                        <asp:BoundField DataField="CodeShobeh" HeaderText="کد شعبه" SortExpression="CodeShobeh" />
                        <asp:BoundField DataField="shobeh" HeaderText="نام شعبه" SortExpression="shobeh" />
                        <asp:BoundField DataField="Houzeh" HeaderText="حوزه قضائی" SortExpression="Houzeh" />
                        <asp:BoundField DataField="LogB" HeaderText="کاربر ثبت کننده" SortExpression="LogB" />
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
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:Button ID="btnReturn2" runat="server" CssClass="label" OnClick="btnReturn2_Click" Text="بازگشت" />
            </td>
        </tr>
    </table>
</asp:Content>

