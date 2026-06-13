@echo off
:: 切换代码页为UTF-8，以防原始文件名包含特殊字符
chcp 65001 >nul

set "OUTPUT_FILE=yuanname.txt"
:: 设置要处理的图片文件扩展名，用空格隔开
set "IMAGE_EXT=*.png *.jpg *.jpeg *.gif *.bmp"

echo 正在获取当前文件夹下的图片列表...

:: 使用 dir 命令获取文件名，/b 表示只输出文件名，/on 表示按名称排序
:: 将输出结果重定向到 yuanname.txt 文件
dir /b /on %IMAGE_EXT% > "%OUTPUT_FILE%"

echo.
echo ========================================================
echo  已成功生成旧文件名列表: %OUTPUT_FILE%
echo ========================================================
echo.
echo  下一步: 
echo  1. 请准备好您的新名字列表，并保存为 newname.txt。
echo  2. 确保 newname.txt 中的名字数量和 yuanname.txt 一致。
echo  3. 运行 "2-执行批量重命名.bat" 脚本。
echo.
pause