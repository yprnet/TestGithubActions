@chcp 65001
@cd /d %~dp0

:: 设置Qt版本
SET QT_VERSION=6.8.2

:: 设置MinGW版本代号
SET MinGW_VERSION=mingw1420_64_UCRT

:: 设置编译器
SET PATH=D:\a\TestGithubActions\mingw64\bin;%PATH%
g++ -v

:: 设置Qt文件夹路径
SET QT_PATH=D:\a\TestGithubActions\Qt

::----------以下无需修改----------

:: 设置Qt源代码目录
SET SRC_QT="%QT_PATH%\%QT_VERSION%\qt-everywhere-src-%QT_VERSION%"

:: 设置安装文件夹目录
SET INSTALL_DIR="%QT_PATH%\%QT_VERSION%-static\%MSVC_VERSION%"

:: 设置build文件夹目录
SET BUILD_DIR="%QT_PATH%\%QT_VERSION%\build-%MSVC_VERSION%"

:: 根据需要进行全新构建
rmdir /s /q "%BUILD_DIR%"
:: 定位到构建目录：
mkdir "%BUILD_DIR%" && cd /d "%BUILD_DIR%"

:: configure
::call %SRC_QT%\configure.bat -static -static-runtime -release -prefix %INSTALL_DIR% -nomake examples -nomake tests -skip qtwebengine -opensource -confirm-license -qt-libpng -qt-libjpeg -qt-zlib -qt-pcre -qt-freetype -schannel -platform win32-msvc

:: 编译(不要忘记点)
::cmake --build . --parallel

:: 安装(不要忘记点)
::cmake --install .

:: 临时使用，后续需删除
rmdir /s /q %INSTALL_DIR%\bin
mkdir %INSTALL_DIR%\bin

::复制qt.conf
copy %~dp0\qt.conf %INSTALL_DIR%\bin

::@pause
@cmd /k cd /d %INSTALL_DIR%
