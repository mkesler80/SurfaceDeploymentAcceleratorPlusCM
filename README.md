# SurfaceDeploymentAccelerator
Surface Deployment Accelerator (SDA) is a script-driven tool to create Windows images (WIM) for test or deployment that closely match the configuration of Bare Metal Recovery (BMR) images, minus certain preinstalled applications like Microsoft Office and the Surface UWP application.

# Need help?
Please use this GitHub Repos issue tracking capability to raise issues or feature requests.

# How to use:
This tool is run via executiong "CreateSurfaceWindowsImage.ps1" as an administrator, and requires access to a Windows ISO file to provide the image to manipulate.  If driver or Windows updates are desired, internet access is required to download.  The script uses the Windows deployment tools from the ADK, so if the latest ADK is not already installed, it will be downloaded and installed during script execution.

Example:
```
.\CreateSurfaceWindowsImage.ps1 -ISO "D:\18362.1.190318-1202.19h1_release_CLIENT_BUSINESS_VOL_x64FRE_en-us.iso" -DestinationFolder "D:\Temp" -Device SurfacePro7 -CreateISO $False
```

The parameters that are available to the script are as follows:
```
-ISO                      Path to a Windows ISO file to use as the imaging source. (required)

-OSSKU                    SKU to build image from. (Pro or Enterprise, default is Pro)

-DestinationFolder        The folder used to place the resulting image files once complete. (required)

-Architecture             The architecture of the image in -ISO, valid values are x64 or ARM64, x64 is the default.  Note that ARM64 support is not complete in this build, please do not file bugs against this at the current time.

-DotNet35                 Install .NET 3.5 in the image, True or False.  True is the default.

-ServicingStack           Download/inject latest servicing stack update, True or False.  True is the default.

-CumulativeUpdate         Download/inject latest cumulative update, True or False.  True is the default.

-CumulativeDotNetUpdate   Download/inject latest cumulative .NET update, True or False.  True is the default

-AdobeFlashUpdate         Include latest Adobe Flash Player Security update, True or False.  True is the default.

-Office365                Download/install the latest Office 365 ProPlus Monthly C2R package, True or False.  True is the default.

-Device                   Enter Surface device type to download and inject latest drivers for.  Possible values  SurfacePro4, SurfacePro5, SurfacePro6, SurfacePro7, SurfaceLaptop, SurfaceLaptop2, SurfaceLaptop3, SurfaceBook, SurfaceBook2, SurfaceBook3, SurfaceStudio, SurfaceStudio2, SurfaceGo, SurfaceGoLTE, SurfaceGo2.  If this parameter is not specified, SurfacePro7 is used.

-CreateUSB                Create bootable USB installation when finished, True or False.  True is the default.  Not setting this to False will require user input at the end of the script (to choose the USB drive).  Make sure to set to False if automation is desired.

-CreateISO                Create bootable ISO file when finished, True or False.  True is the default.

-WindowsKitInstall        Enter target location of Windows ADK installation.  If not specified, the path "${env ProgramFiles(x86)}\Windows Kits\10\Assessment and Deployment Kit" will be used.

-BitsTransfer             Use BITS to download files rather than System.NET.  Requires Internet Explorer to have been run once (and the IE first run wizard gone through) on the machine running the script, however.

-InstallWIM               Edit Install.wim file, True or False.  True is default.  This set to False will skip install.wim processing and only create a new boot.wim (assuming BootWIM is not also False, of course).

-BootWIM                  Edit boot.wim, True or False.  True is default.  This set to False will skip boot.wim processing and only create a new install.wim/swm (assuming InstallWIM is not also False, of course).

-KeepOriginalWIM          Keep customized unsplit WIM even if resulting image size is greater than 4GB (images over 4GB are split into SWM by default), True or False.  True is default.

-UseLocalDriverPath       Use a local path instead of downloading device drivers during initial setup, True or False.  False is the default.  Setting this variable will keep the $Device type, but not attempt any driver download or verification.

-LocalDriverPath          Path used by $UseLocalDriverPath, empty by default.  If you pass $UseLocalDriverPath as True, you MUST set this variable as well or the script will not have drivers to inject.
```
