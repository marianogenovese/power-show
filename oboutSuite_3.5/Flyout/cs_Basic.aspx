<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<!--
        Basic example
-->

<html>
	<head>
        <title>Basic</title>
 		<style type="text/css">
			    body {
				    font:11px Verdana;
				    color:#333333;
			    }
			    a {
				    font:11px Verdana;
				    color:#315686;
				    text-decoration:underline;
			    }
			    a:hover {
				    color:crimson;
			    }
		    </style>    
		<script runat="server" language="C#" >
            Flyout Flyout1 = new Flyout();
            void Page_Load(object sender, EventArgs e)
            {
                Flyout1.AttachTo = "ad1";
                Image img = new Image();
                img.ImageUrl = "images/calendar.jpg";
                Flyout1.Controls.Add(img);                
            }		      
            void Page_Init(object o, EventArgs e)
            {
                Flyout1 = new Flyout();
                Flyout1.ID = "Flyout1";

                Page.Controls.Add(Flyout1);
            }    
		</script>        
	</head>
	<body>
	    <a href="Default.aspx?div=cs">� Back to examples</a>
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        
        
        <!-- Create a link-->
        <center>
            <a id="ad1" href="http://www.obout.com/calendar/" style="font-family:Verdana;font-size:8pt;">Calendar</a>	
	    </center>	
        
        
	</body>
</html>
