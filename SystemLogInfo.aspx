<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SystemLogInfo.aspx.cs" Inherits="SystemLogInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" />
    <table align="center" class="auto-style2" dir="rtl">
        <tr>
            <td style="border: thin double #808080; text-align: right;">
                <table align="center" class="auto-style2" dir="rtl">
                    <tr>
                        <td >
                            <asp:Label ID="Label2" runat="server" Text="مشاهده وقایع ثبت شده در سیستم" CssClass="labelTitle"></asp:Label>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [TblBazrasi] WHERE [CodeB] = @original_CodeB AND [CodeShobeh] = @original_CodeShobeh AND (([RoozINS] = @original_RoozINS) OR ([RoozINS] IS NULL AND @original_RoozINS IS NULL)) AND (([MahINS] = @original_MahINS) OR ([MahINS] IS NULL AND @original_MahINS IS NULL)) AND (([SalINS] = @original_SalINS) OR ([SalINS] IS NULL AND @original_SalINS IS NULL)) AND (([RoozSabt] = @original_RoozSabt) OR ([RoozSabt] IS NULL AND @original_RoozSabt IS NULL)) AND (([MahSabt] = @original_MahSabt) OR ([MahSabt] IS NULL AND @original_MahSabt IS NULL)) AND (([SalSabt] = @original_SalSabt) OR ([SalSabt] IS NULL AND @original_SalSabt IS NULL)) AND (([shobeh] = @original_shobeh) OR ([shobeh] IS NULL AND @original_shobeh IS NULL)) AND (([ostan] = @original_ostan) OR ([ostan] IS NULL AND @original_ostan IS NULL)) AND (([shahr] = @original_shahr) OR ([shahr] IS NULL AND @original_shahr IS NULL)) AND (([Houzeh] = @original_Houzeh) OR ([Houzeh] IS NULL AND @original_Houzeh IS NULL)) AND (([LogB] = @original_LogB) OR ([LogB] IS NULL AND @original_LogB IS NULL))" InsertCommand="INSERT INTO [TblBazrasi] ([CodeShobeh], [RoozINS], [MahINS], [SalINS], [RoozSabt], [MahSabt], [SalSabt], [shobeh], [ostan], [shahr], [Houzeh], [LogB]) VALUES (@CodeShobeh, @RoozINS, @MahINS, @SalINS, @RoozSabt, @MahSabt, @SalSabt, @shobeh, @ostan, @shahr, @Houzeh, @LogB)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT        CodeB As 'کد بازرسی', SalINS+'/'+MahINS+'/'+RoozINS AS 'تاریخ بازرسی', ostan AS 'استان', shahr AS 'شهر',  Houzeh AS 'حوزه قضائی',CodeShobeh AS 'کد شعبه', shobeh AS 'نام شعبه',SalSabt+'/'+ MahSabt+'/'+RoozSabt AS 'تاریخ ثبت', LogB AS 'کاربر ثبت کننده' FROM   TblBazrasi" UpdateCommand="UPDATE [TblBazrasi] SET [CodeShobeh] = @CodeShobeh, [RoozINS] = @RoozINS, [MahINS] = @MahINS, [SalINS] = @SalINS, [RoozSabt] = @RoozSabt, [MahSabt] = @MahSabt, [SalSabt] = @SalSabt, [shobeh] = @shobeh, [ostan] = @ostan, [shahr] = @shahr, [Houzeh] = @Houzeh, [LogB] = @LogB WHERE [CodeB] = @original_CodeB AND [CodeShobeh] = @original_CodeShobeh AND (([RoozINS] = @original_RoozINS) OR ([RoozINS] IS NULL AND @original_RoozINS IS NULL)) AND (([MahINS] = @original_MahINS) OR ([MahINS] IS NULL AND @original_MahINS IS NULL)) AND (([SalINS] = @original_SalINS) OR ([SalINS] IS NULL AND @original_SalINS IS NULL)) AND (([RoozSabt] = @original_RoozSabt) OR ([RoozSabt] IS NULL AND @original_RoozSabt IS NULL)) AND (([MahSabt] = @original_MahSabt) OR ([MahSabt] IS NULL AND @original_MahSabt IS NULL)) AND (([SalSabt] = @original_SalSabt) OR ([SalSabt] IS NULL AND @original_SalSabt IS NULL)) AND (([shobeh] = @original_shobeh) OR ([shobeh] IS NULL AND @original_shobeh IS NULL)) AND (([ostan] = @original_ostan) OR ([ostan] IS NULL AND @original_ostan IS NULL)) AND (([shahr] = @original_shahr) OR ([shahr] IS NULL AND @original_shahr IS NULL)) AND (([Houzeh] = @original_Houzeh) OR ([Houzeh] IS NULL AND @original_Houzeh IS NULL)) AND (([LogB] = @original_LogB) OR ([LogB] IS NULL AND @original_LogB IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CodeB" Type="Int32" />
                        <asp:Parameter Name="original_CodeShobeh" Type="String" />
                        <asp:Parameter Name="original_RoozINS" Type="String" />
                        <asp:Parameter Name="original_MahINS" Type="String" />
                        <asp:Parameter Name="original_SalINS" Type="String" />
                        <asp:Parameter Name="original_RoozSabt" Type="String" />
                        <asp:Parameter Name="original_MahSabt" Type="String" />
                        <asp:Parameter Name="original_SalSabt" Type="String" />
                        <asp:Parameter Name="original_shobeh" Type="String" />
                        <asp:Parameter Name="original_ostan" Type="String" />
                        <asp:Parameter Name="original_shahr" Type="String" />
                        <asp:Parameter Name="original_Houzeh" Type="String" />
                        <asp:Parameter Name="original_LogB" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CodeShobeh" Type="String" />
                        <asp:Parameter Name="RoozINS" Type="String" />
                        <asp:Parameter Name="MahINS" Type="String" />
                        <asp:Parameter Name="SalINS" Type="String" />
                        <asp:Parameter Name="RoozSabt" Type="String" />
                        <asp:Parameter Name="MahSabt" Type="String" />
                        <asp:Parameter Name="SalSabt" Type="String" />
                        <asp:Parameter Name="shobeh" Type="String" />
                        <asp:Parameter Name="ostan" Type="String" />
                        <asp:Parameter Name="shahr" Type="String" />
                        <asp:Parameter Name="Houzeh" Type="String" />
                        <asp:Parameter Name="LogB" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CodeShobeh" Type="String" />
                        <asp:Parameter Name="RoozINS" Type="String" />
                        <asp:Parameter Name="MahINS" Type="String" />
                        <asp:Parameter Name="SalINS" Type="String" />
                        <asp:Parameter Name="RoozSabt" Type="String" />
                        <asp:Parameter Name="MahSabt" Type="String" />
                        <asp:Parameter Name="SalSabt" Type="String" />
                        <asp:Parameter Name="shobeh" Type="String" />
                        <asp:Parameter Name="ostan" Type="String" />
                        <asp:Parameter Name="shahr" Type="String" />
                        <asp:Parameter Name="Houzeh" Type="String" />
                        <asp:Parameter Name="LogB" Type="String" />
                        <asp:Parameter Name="original_CodeB" Type="Int32" />
                        <asp:Parameter Name="original_CodeShobeh" Type="String" />
                        <asp:Parameter Name="original_RoozINS" Type="String" />
                        <asp:Parameter Name="original_MahINS" Type="String" />
                        <asp:Parameter Name="original_SalINS" Type="String" />
                        <asp:Parameter Name="original_RoozSabt" Type="String" />
                        <asp:Parameter Name="original_MahSabt" Type="String" />
                        <asp:Parameter Name="original_SalSabt" Type="String" />
                        <asp:Parameter Name="original_shobeh" Type="String" />
                        <asp:Parameter Name="original_ostan" Type="String" />
                        <asp:Parameter Name="original_shahr" Type="String" />
                        <asp:Parameter Name="original_Houzeh" Type="String" />
                        <asp:Parameter Name="original_LogB" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" CssClass="labelItemsLot" DataKeyNames="کد بازرسی" DataSourceID="SqlDataSource1" PageSize="40" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="کد بازرسی" HeaderText="کد بازرسی" InsertVisible="False" ReadOnly="True" SortExpression="کد بازرسی" />
                        <asp:BoundField DataField="تاریخ بازرسی" HeaderText="تاریخ بازرسی" ReadOnly="True" SortExpression="تاریخ بازرسی" />
                        <asp:BoundField DataField="استان" HeaderText="استان" SortExpression="استان" />
                        <asp:BoundField DataField="شهر" HeaderText="شهر" SortExpression="شهر" />
                        <asp:BoundField DataField="حوزه قضائی" HeaderText="حوزه قضائی" SortExpression="حوزه قضائی" />
                        <asp:BoundField DataField="کد شعبه" HeaderText="کد شعبه" SortExpression="کد شعبه" />
                        <asp:BoundField DataField="نام شعبه" HeaderText="نام شعبه" SortExpression="نام شعبه" />
                        <asp:BoundField DataField="تاریخ ثبت" HeaderText="تاریخ ثبت" ReadOnly="True" SortExpression="تاریخ ثبت" />
                        <asp:BoundField DataField="کاربر ثبت کننده" HeaderText="کاربر ثبت کننده" SortExpression="کاربر ثبت کننده" />
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
        <tr>
            <td style="border: thin double #808080; text-align: center;">
                <asp:Button ID="btnReturn2" runat="server" CssClass="label" OnClick="btnReturn2_Click" Text="بازگشت" />
            </td>
        </tr>
    </table>
</asp:Content>

