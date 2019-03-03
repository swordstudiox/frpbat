echo=1/*
goto windows
 
linux(){
curl -# -o $0 https://github.com/swordstudiox/frpbat/raw/master/frp.bat
clear
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo "::                                                                          ::"
echo "::     æ¬¢è¿Žä½¿ç”¨linux & mac ç³»ç»Ÿçš„frpå¯åŠ¨è„šæœ¬ï¼Œ                              ::"
echo "::     æœ¬è„šæœ¬ç”± â˜†å¤¢å¹»ç…‹æ¶³â˜† ç¼–å†™ï¼Œå¦‚æœ‰ç–‘é—®è¯·è”ç³»æœ¬äººï¼ http://www.lu8.win  ::"
echo "::     æœ¬è„šæœ¬ç”±swordä¿®æ”¹ä¼˜åŒ–ï¼Œåšå®¢åœ°å€ï¼š https://agint.me                   ::"
echo "::     å…è´¹frpå†…ç½‘ç©¿é€æœåŠ¡å™¨åœ°å€ï¼š https://freenat.win                      ::"
echo "::     é¡¹ç›®åœ°å€ï¼š https://github.com/swordstudiox/frp_bat                   ::"
echo "::     è½¬è½½è¯·ä¸è¦åˆ é™¤æœ¬ä¿¡æ¯ï¼                                               ::"
echo "::                                                                          ::"
echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""   
echo " è¯·é€‰æ‹©ä½ è¦çš„æ“ä½œï¼š"
echo "     1ã€æ­å»ºè‡ªå·±çš„frpsæœåŠ¡å™¨"
echo "     2ã€é…ç½®å¹¶è¿è¡Œfrpcå®¢æˆ·ç«¯"
echo "     3ã€é€€å‡º"
echo ""
echo ""
read num
case "$num" in
	[1] )
		rm -rf frps_linux.bat	
		curl -# -o frps_linux.bat https://github.com/swordstudiox/frpbat/raw/master/linux/frps_linux.bat
		sh frps.bat			
		;;
	[2] )
		rm -rf frpc_linux.bat	
		curl -# -o frpc_linux.bat https://github.com/swordstudiox/frpbat/raw/master/linux/frpc_linux.bat		
		sh frpc.bat			
		;;
	[3] )
			exit			
		;;
		*) echo "é€‰æ‹©é”™è¯¯ï¼Œé€€å‡º";;
	esac
	} 
linux
exit

:windows

@echo off
title frpÅäÖÃ½Å±¾ V1.0-20190302 
COLOR 02
cls

cd %~dp0
rem cscript -nologo -e:jscript "%~f0" "http://www.lu8.win/downloads/curl/curl.exe" "curl.exe" 
rem cscript -nologo -e:jscript "%~f0" "https://file.agint.me/frpbat/others/curl.exe" "curl.exe" 


rem curl -s http://www.lu8.win/downloads/frp/frp-version>frp-version.bat
certutil.exe -urlcache -split -f https://github.com/swordstudiox/frpbat/raw/master/frpbat_version frpbat_version.bat

call frpbat_version.bat
del frpbat_version.bat
set client=20190301
if %server% EQU %client% ( 
rem del curl.exe 
) else ( 
echo ×îÐÂ°æ±¾£º%server%
echo ¼´½«¸üÐÂ 
rem curl -o %~nx0 -# http://www.lu8.win/downloads/frp/frp.bat 1>nul
del frp.bat
certutil.exe -urlcache -split -f https://github.com/swordstudiox/frpbat/raw/master/frp.bat
rem curl -o %~nx0 -# https://file.agint.me/frpbat/frp.bat 1>nul
echo ¸üÐÂÍê³É 
%~nx0
)

goto moshi

:moshi
cls
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.::                                                                          ::
ECHO.::     »¶Ó­Ê¹ÓÃWindowsÆ½Ì¨µÄfrpÆô¶¯½Å±¾£¬                                   ::
ECHO.::     ±¾½Å±¾ÓÉ ¡î‰ô»ÃŸ“›ï¡î ±àÐ´£¬ÈçÓÐÒÉÎÊÇëÁªÏµ±¾ÈË£¡ http://www.lu8.win  ::
ECHO.::     ±¾½Å±¾ÓÉswordÐÞ¸ÄÓÅ»¯£¬²©¿ÍµØÖ·£º https://agint.me                   :: 
ECHO.::     Ãâ·ÑfrpÄÚÍø´©Í¸·þÎñÆ÷µØÖ·£º https://freenat.win                      ::
ECHO.::     ÏîÄ¿µØÖ·£º https://github.com/swordstudiox/frp_bat                   ::
ECHO.::     ×ªÔØÇë²»ÒªÉ¾³ý±¾ÐÅÏ¢£¡                                               ::
ECHO.::                                                                          ::
ECHO.::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
ECHO.
ECHO.

echo  ÇëÑ¡ÔñÄãÒªµÄ²Ù×÷£º
echo      1¡¢´î½¨×Ô¼ºµÄfrps·þÎñÆ÷
echo      2¡¢ÅäÖÃ²¢ÔËÐÐfrpc¿Í»§¶Ë
echo      3¡¢ÍË³ö
set num=0
set /p num=
if %num%==1 goto frps
if %num%==2 goto frpc
if %num%==3 exit

:frps
set frp=frps_win
goto start

:frpc
set frp=frpc_win
goto start

:start
cd %~dp0
del %frp%.bat
if exist %frp% goto run
cscript -nologo -e:jscript "%~f0" "https://github.com/swordstudiox/frpbat/raw/master/windows/%frp%.bat" "%frp%.bat"  
goto run


:run
call %frp%.bat
exit
*/ 
var iLocal,iRemote,xPost,sGet;  
iLocal =WScript.Arguments(1);   
iRemote = WScript.Arguments(0);   
iLocal=iLocal.toLowerCase();  
iRemote=iRemote.toLowerCase();  
xPost = new ActiveXObject("WinHttp"+String.fromCharCode(0x2e)+"WinHttpRequest.5.1"); 
xPost.Open("GET",iRemote,0);  
xPost.Send(); 
sGet = new ActiveXObject("ADODB"+String.fromCharCode(0x2e)+"Stream");  
sGet.Mode = 3;  
sGet.Type = 1;   
sGet.Open();   
sGet.Write(xPost.responseBody);  
sGet.SaveToFile(iLocal,2);   
