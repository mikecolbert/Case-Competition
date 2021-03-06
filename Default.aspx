﻿<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CaseCompetitionApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="center gold" >CyHawk Case Competition</h1>
    <div class="jumbotron center">
        
        <asp:Image ID="Image1" runat="server" />
    </div>

    <br />
    <div>
        <h2 class="center">The CyHawk Case Competition is an annual event hosted by the University of Iowa and Iowa State University.</h2>
    </div>
    <br />

    <div class="row">
       
        <div class=" center col-md-4">
            <h2 class="center">Meet the Judges</h2>
            <p class="center">
                List of This Year's Judges and Their Companies
            </p>
            <p>                
                 <a class="btn btn-default grey"  href="../JudgeInfo" style=" font-size: 16px">View Judges &raquo;</a>
            </p>
        </div>
        <div class="center col-md-4">
            <h2 class="center">Meet the Competitors</h2>
            <p class="center">
                List of This Year's Teams
            </p>
            <p>                
                <a class="btn btn-default grey"  href="../TeamInfo" style=" font-size: 16px">View Teams &raquo;</a>            
            </p>
        </div>
        <div class="center col-md-4">
            <h2 class="center">Competition Archive</h2>
            <p class="center">
                Access Previous Competitions and Results
            </p>
             <p>                
                <a class="btn btn-default grey"  href="../Archive" style=" font-size: 16px">View Archive &raquo;</a>            
            </p>
           
        </div> 
    </div>

</asp:Content>
