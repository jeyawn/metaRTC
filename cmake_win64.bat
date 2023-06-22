
@echo off
set TARGET_OS=Windows
set TARGET_ARCH=x64

del build /q
mkdir build
cd build
cmake .. -G "Visual Studio 16 2019" -A %TARGET_ARCH% -DTARGET_ARCH=%TARGET_ARCH% -DTARGET_OS=%TARGET_OS%
cmake --build . --config Release --target metademo
cd ..
