Configuration InstallIIS
{
  param (
	$MachineName,
	$Location
  )
  
  Node ($MachineName)
  {
	#Install the IIS Role
    WindowsFeature IIS
    {
      Ensure = “Present”
      Name = “Web-Server”
    }

    #Install ASP.NET 4.5
    WindowsFeature ASP
    {
      Ensure = “Present”
      Name = “Web-Asp-Net45”
    }

    WindowsFeature WebServerManagementConsole
    {
        Name = "Web-Mgmt-Console"
        Ensure = "Present"
    }
	
	File LandingPage
	{
		DestinationPath = "C:\inetpub\wwwroot\index.html"
		Contents "<html><head></head><body><h1>Welcome to your web server farm in " + $Location + "!</h1></body></html>"
	}
  }
}