chcp 65001
@echo off &PUSHD %~dp0 &TITLE 裁剪 LiteIDE
mode con cols=120 lines=35

set LITEIDE_LIB_DIR=%~dp0\lib\liteide
set LITEIDE_SHARE_DIR=%~dp0\share\liteide

:menu
cls
echo.
echo          LiteIDE 裁剪脚本
echo ============================================================================
echo.
echo	本脚本用于裁剪 LiteIDE 的部分功能缩减空间将其用于其他用途 (例如简易 Python 编辑器)
echo 本脚本仅支持 Windows 系统 (32-Bit 和 64-Bit)，运行此脚本将剔除以下文件：
echo.
echo 【1】 LiteIDE 的 Go 语言支持
echo 【2】 LiteIDE 的欢迎页面
echo.
echo 请在执行前确认是否需要 Go 支持，执行后需重新下载原版覆盖。
echo.
echo 【1】裁剪 LiteIDE Win64 Qt5 版本
echo.
echo 【2】裁剪 LiteIDE Win32 Qt4 版本 
echo.
echo ============================================================================

set /p user_input=选择操作：
if %user_input%==1 goto liteide_win64
if %user_input%==2 goto liteide_win32
if not %user_input%=="" goto none

rem 裁剪 LiteIDE Win64
:liteide_win64
rem 删除相关工具
cd %~dp0\bin
del /f /s /q dlv.exe
del /f /s /q gocode.exe
del /f /s /q gomodifytags.exe
del /f /s /q gotools.exe

rem 删除部分插件
cd %LITEIDE_LIB_DIR%\plugins
del /f /s /q dlvdebugger.dll
del /f /s /q golangast.dll
del /f /s /q golangcode.dll
del /f /s /q golangdoc.dll
del /f /s /q golangedit.dll
del /f /s /q golangfmt.dll
del /f /s /q golangpackage.dll
del /f /s /q golangplay.dll
del /f /s /q golangpresent.dll
del /f /s /q welcome.dll

rem 删除部分配置文件
cd %LITEIDE_SHARE_DIR%\liteapp\template
rmdir /s /q goarticle
rmdir /s /q gocmd
rmdir /s /q gocmdex
rmdir /s /q gopkg
rmdir /s /q gopkgex
rmdir /s /q goslide
rmdir /s /q gosrc
del /f /s /q file.sub
(echo empty & echo luasrc & echo mdsrc) >> file.sub
del /f /s /q project.sub
(echo.) >> project.sub

cd %LITEIDE_SHARE_DIR%\litebuild
del /f /s /q gomod.xml
del /f /s /q goplus.xml
del /f /s /q gosrc.xml
del /f /s /q command\go.api

cd %LITEIDE_SHARE_DIR%\packages
rmdir /s /q go
rmdir /s /q gopresent

cd %LITEIDE_SHARE_DIR%\
rmdir /s /q welcome

echo 执行完毕！
echo. & pause
goto menu

rem 裁剪 LiteIDE Win32
:liteide_win32
rem 删除相关工具
cd %~dp0\bin
del /f /s /q dlv.exe
del /f /s /q gocode.exe
del /f /s /q gomodifytags.exe
del /f /s /q gotools.exe

rem 删除部分插件
cd %LITEIDE_LIB_DIR%\plugins
del /f /s /q dlvdebugger.dll
del /f /s /q golangast.dll
del /f /s /q golangcode.dll
del /f /s /q golangdoc.dll
del /f /s /q golangedit.dll
del /f /s /q golangfmt.dll
del /f /s /q golangpackage.dll
del /f /s /q golangplay.dll
del /f /s /q golangpresent.dll
del /f /s /q welcome.dll

rem 删除部分配置文件
cd %LITEIDE_SHARE_DIR%\liteapp\template
rmdir /s /q goarticle
rmdir /s /q gocmd
rmdir /s /q gocmdex
rmdir /s /q gopkg
rmdir /s /q gopkgex
rmdir /s /q goslide
rmdir /s /q gosrc
del /f /s /q file.sub
(echo empty & echo luasrc & echo mdsrc) >> file.sub
del /f /s /q project.sub
(echo.) >> project.sub

cd %LITEIDE_SHARE_DIR%\litebuild
del /f /s /q gomod.xml
del /f /s /q goplus.xml
del /f /s /q gosrc.xml
del /f /s /q command\go.api

cd %LITEIDE_SHARE_DIR%\packages
rmdir /s /q go
rmdir /s /q gopresent

cd %LITEIDE_SHARE_DIR%\
rmdir /s /q welcome

echo 执行完毕！
echo. & pause
goto menu

rem 如果输入其他
:none
echo.
echo 选择无效，请按任意键返回菜单！
echo. & pause
goto menu