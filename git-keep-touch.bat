@echo off
chcp 65001
REM git_keep_touch.bat

REM 引数1: 対象のディレクトリ
REM 引数2以降: サブディレクトリを再帰的に処理するオプション（任意）

REM 引数1のディレクトリが存在するか確認
if not exist "%~1" (
    echo 指定されたディレクトリ "%~1" は存在しません。
    exit /b 1
)

REM 引数1のディレクトリに.gitkeepを作成
echo %~1
touch "%~1\.gitkeep"

if "%~2" == "/recursive" (
    REM 再帰的にサブディレクトリを検索して.gitkeepを作成
    for /r "%~1" %%d in (.) do (
        if exist "%%d\" (
            echo Processing directory: %%d
            touch "%%d\.gitkeep"
        )
    )
)

echo 処理が完了しました。
