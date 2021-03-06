﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminArchive.aspx.cs" Inherits="CaseCompetitionApp.AdminArchive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class=" center gold">
       Admin Competition Archive
     </h2>
    <h3 class="center">
        Modify Competition Archives and Results
    </h3>

    <hr />
    <div class="row center">
            <div class="col-md-6">
                <asp:Button ID="btnShowArchives" CausesValidation="false" OnClick="btnShowArchives_Click" class="btn btn-default wide grey" runat="server" Text="Archive/Unarchive Competitions  &raquo;" />
            </div>
             <div class="col-md-6">
                <asp:Button ID="btnEditArchives" CausesValidation="false" OnClick="btnEditArchives_Click" class="btn btn-default wide grey" runat="server" Text="Edit Archived Competitions  &raquo;" />
            </div>
    </div>
      <hr style="border: .25px solid rgb(0,0,0)" />

    <div id="archives" runat="server">
        <asp:UpdatePanel runat="server" ID="ArchiveUpdates" UpdateMode="Conditional">
            <ContentTemplate>
    <div class="row">
        <div>
             <div class="col-md-2" style="text-align:right;vertical-align:central">
             <asp:Label ID="lblArchive" style="text-align:right; font-weight:bold; vertical-align:central" runat="server"  CssClass="control-label" Text="Name of Competition: "></asp:Label>
                 </div>
            <div class="col-md-3">
             <asp:TextBox ID="txtCompetition" runat="server" class="ArchBox"></asp:TextBox>
            <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompetition" ErrorMessage="RequiredFieldValidator">Competition Name Required</asp:RequiredFieldValidator>
        </div>
        </div>
       <div>
           <div class="col-md-2" style="text-align:right;vertical-align:central">
              <asp:Label ID="lblDate" style="text-align:right; font-weight:bold; vertical-align:central" runat="server" CssClass="control-label" Text="Date of Competition: "></asp:Label>
               </div>
           <div class="col-md-3">
              <asp:TextBox ID="txtDate" textmode="Date" runat="server" class="ArchBox"></asp:TextBox>
            <br />

              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate" ErrorMessage="RequiredFieldValidator">Competition Date Required</asp:RequiredFieldValidator>
        </div>
       </div>
          <div class="col-md-2">
            <asp:Button ID="BtnArchive" CssClass="btn btn-default" Style="padding-bottom:0px; padding-top:0px; margin-top:0px;text-align:center" runat="server" OnClientClick="return confirm('Are you sure you want to archive the current competition?')" Text="Archive Competition" Height="26px" OnClick="Btn_Archive" />
              <asp:Label ID="lblEmpty" runat="server" CssClass="text-danger" Text=""></asp:Label>
    <asp:AsyncPostBackTrigger ControlID="BtnArchive" EventName="Btn_Archive"/>
          </div>
    </div>
       <hr />

     <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvCompete" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCompetition" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataKeyNames="CompetitionId">
                <Columns>
                    <asp:BoundField DataField="CompetitionName" HeaderText="Competition Name" SortExpression="CompetitionName" ReadOnly="True" >
                    <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CompetitionDate" HeaderText="Competition Date" SortExpression="CompetitionDate" ReadOnly="True" >
                        <ControlStyle CssClass="padding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    
                    
                    <asp:CommandField EditText="Unarchive" ShowEditButton="True" CausesValidation="false" UpdateText="Confirm" >
                    
                    
                        <ControlStyle CssClass="smpadding" />
                        <HeaderStyle CssClass="padding" />
                        <ItemStyle CssClass="smpadding" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#FFDF00" Font-Bold="True" ForeColor="Black" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlCompetition"  runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT CompetitionId, CompetitionName, FORMAT([CompetitionDate], 'MM/dd/yy') AS CompetitionDate FROM [Competition]" UpdateCommand="UpdateCompetition"  OldValuesParameterFormatString="original_{0}" UpdateCommandType="StoredProcedure">
                <UpdateParameters>
                    <asp:Parameter Name="original_CompetitionID" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <br />
</ContentTemplate>
        </asp:UpdatePanel>
</div>
    


<div id="editarchive" runat="server">
     

   <div id="empty" runat="server" class="center">
      <asp:Label ID="Label1" Font-Size="X-Large" runat="server" Text="There is no data archived"></asp:Label>
         <br />
         <br />
    </div>

    
    <div class="row">
        <div class="col-md-12">
           <asp:RequiredFieldValidator ID="rfvDate" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDate" CssClass="text-danger">Date Required</asp:RequiredFieldValidator>
            <asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataKeyNames="CompetitionID">
                <Columns>
                    <asp:BoundField DataField="CompetitionId" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="CompetitionId" >
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CompetitionName" HeaderText="Competition Name" SortExpression="CompetitionName" >
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Competition Date" SortExpression="CompetitionDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDate" TextMode="Date" runat="server" Text='<%# Bind("CompetitionDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# Bind("CompetitionDate") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="padding Shorter" />
                        <ItemStyle CssClass="padding" />
                    </asp:TemplateField>
                    <asp:CommandField SelectText="View Details" ShowSelectButton="True" ShowEditButton="True" >
                        <ControlStyle CssClass="smpadding" />
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="smpadding" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#FFDF00" Font-Bold="True" ForeColor="Black" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT CompetitionId, CompetitionName, FORMAT([CompetitionDate], 'MM/dd/yy') AS CompetitionDate FROM [Competition]" UpdateCommand="UPDATE [Competition] SET [CompetitionName] = @CompetitionName, [CompetitionDate]=@CompetitionDate WHERE [CompetitionID] = @original_CompetitionID" OldValuesParameterFormatString="original_{0}">
                 <DeleteParameters>
                    <asp:Parameter Name="original_CompetitionID" Type="String" />
                 </DeleteParameters>
                 <UpdateParameters>
                    <asp:Parameter Name="CompetitionID" Type="String" />
                    <asp:Parameter Name="CompetitionName" Type="String" />
                    <asp:Parameter Name="CompetitionDate" Type="String" />
                 </UpdateParameters></asp:SqlDataSource>
        </div>
    </div>
    <br />
     <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvJudge" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataSourceID="SqlJudge" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataKeyNames="JudgeID">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" >
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" >
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" >
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CompanySite" HeaderText="Site" SortExpression="CompanySite" >
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding" />
                        </asp:BoundField>
                    <asp:TemplateField HeaderText="ID" SortExpression="CompetitionID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CompetitionID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CompetitionID") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle CssClass="padding Shorter" />
                        <ItemStyle CssClass="padding" />
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" >
                        <ControlStyle CssClass="smpadding" />
                    <ItemStyle CssClass="smpadding" />
                        </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#FFDF00" Font-Bold="True" ForeColor="Black" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlJudge" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Judges] WHERE ([CompetitionID] = @CompetitionID)" UpdateCommand="UPDATE [Judges] SET [FirstName] = @FirstName, [LastName]=@LastName, [Company]=@Company,[CompanySite]=@CompanySite  WHERE [JudgeID] = @original_JudgeID" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [Judges] where [JudgeID] = @original_JudgeID">
                 <DeleteParameters>
                    <asp:Parameter Name="original_JudgeID" Type="String" />
                 </DeleteParameters>
                 <UpdateParameters>
                    <asp:Parameter Name="JudgeID" Type="String" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Company" Type="String" />
                    <asp:Parameter Name="CompanySite" Type="String" />
                 </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="CompetitionID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-7"> 
            <asp:GridView ID="gvTeam" runat="server" CssClass="Grid" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" AutoGenerateColumns="False" DataSourceID="SqlTeam" DataKeyNames="TeamID">
                <Columns>
                    <asp:BoundField DataField="TeamName" HeaderText="Name" SortExpression="TeamName" ReadOnly="True" >
                    <HeaderStyle CssClass="padding" />
                    <ItemStyle CssClass="padding" />
                    </asp:BoundField>
                    <asp:BoundField DataField="School" HeaderText="School" SortExpression="School" >
                    <HeaderStyle CssClass="padding Shorter"/>
                    <ItemStyle CssClass="padding Shorter" />
                        </asp:BoundField>
                    <asp:BoundField DataField="Ranking" HeaderText="Rank" SortExpression="Ranking" >
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding Shorter"/>
                        </asp:BoundField>
                    <asp:BoundField DataField="CompetitionID" HeaderText="ID" SortExpression="CompetitionID" >
                    <HeaderStyle CssClass="padding Shorter"/>
                    <ItemStyle CssClass="padding Shorter" />
                        </asp:BoundField>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" >
                        <ControlStyle CssClass="smpadding" />
                    <ItemStyle CssClass="smpadding" />
                        </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#FFDF00" Font-Bold="True" ForeColor="Black" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlTeam" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [TEAM] WHERE ([CompetitionID] = @CompetitionID) order by -ranking desc" UpdateCommand="UPDATE [TEAM] SET [School] = @School, [CompetitionId] = @CompetitionID , [Ranking] = @Ranking WHERE [TeamID] = @original_TeamID" OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [TEAM] where [TeamID] = @original_TeamID">
                     <DeleteParameters>
                        <asp:Parameter Name="original_TeamID" Type="String" />
                     </DeleteParameters>
                     <UpdateParameters>
                        <asp:Parameter Name="Ranking" Type="String" />
                        <asp:Parameter Name="CompetitionID" Type="String" />
                        <asp:Parameter Name="RoomNumber" Type="String" />
                     </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="CompetitionID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        <div class="col-md-5">
            <asp:GridView ID="gvMembers" runat="server" CssClass="Grid" AutoGenerateColumns="False" Width="100%" DataKeyNames="MemberID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" DataSourceID="SQLMembers">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" >
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding Shorter" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" >
                    <HeaderStyle CssClass="padding Shorter" />
                    <ItemStyle CssClass="padding Shorter" />
                        </asp:BoundField>
                    <asp:CommandField ShowEditButton="True" >
                        <ControlStyle CssClass="smpadding" />
                    <ItemStyle CssClass="smpadding" />
                        </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#FFDF00" Font-Bold="True" ForeColor="Black" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <asp:SqlDataSource ID="SQLMembers" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Members] WHERE ([TeamID] = @TeamID)" UpdateCommand="UPDATE [Members] SET [FirstName] = @FirstName, [LastName] =@LastName WHERE [MemberID] = @original_MemberID  " OldValuesParameterFormatString="original_{0}" DeleteCommand="DELETE FROM [Members] where [MemberID] = @original_MemberID">
                     
                  <DeleteParameters>
                    <asp:Parameter Name="original_MemberID" Type="String" />
                 </DeleteParameters>
                 <UpdateParameters>
                    <asp:Parameter Name="MemberID" Type="String" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                 </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvTeam" Name="TeamID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        </div>

</div>



      <div class="stickydiv">
         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Hub.aspx" CssClass="hyperlink" >Return to Hub</asp:HyperLink>
    </div>

</asp:Content>
