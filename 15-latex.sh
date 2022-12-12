# 本脚本（不）是用来运行的
sudo pacman -S texlive-most texlive-lang
# 在vscode的用户配置中添加如下内容
{
    "latex-workshop.latex.autoBuild.run": "never",
    "latex-workshop.showContextMenu": true,
    "latex-workshop.intellisense.package.enabled": true,
    "latex-workshop.message.error.show": false,
    "latex-workshop.message.warning.show": false,
    "latex-workshop.latex.tools": [
        {
            "name": "xelatex",
            "command": "xelatex",
            "args": [
                "-synctex=1",
                "-interaction=nonstopmode",
                "-file-line-error",
                "%DOCFILE%"
            ]
        },
        {
            "name": "biber",
            "command": "biber",
            "args": [
                "%DOCFILE%"
            ]
        }
    ],
    "latex-workshop.latex.recipes": [
        {
            "name": "XeLaTeX",
            "tools": [
                "xelatex"
            ]
        },
        {
            "name": "xelatex -> biber -> xelatex*2",
            "tools": [
                "xelatex",
                "biber",
                "xelatex",
                "xelatex"
            ]
        },
    ],
    "latex-workshop.latex.clean.fileTypes": [
        "*.aux",
        "*.bbl",
        "*.blg",
        "*.idx",
        "*.ind",
        "*.lof",
        "*.lot",
        "*.out",
        "*.toc",
        "*.acn",
        "*.acr",
        "*.alg",
        "*.glg",
        "*.glo",
        "*.gls",
        "*.ist",
        "*.fls",
        "*.log",
        "*.fdb_latexmk"
    ],
    "latex-workshop.latex.autoClean.run": "onFailed",
    "latex-workshop.latex.recipe.default": "lastUsed",
    "latex-workshop.view.pdf.internal.synctex.keybinding": "double-click"
}
# 其他插件
{
    "haskell.manageHLS": "GHCup",
    "haskell.hlint.executablePath": "/home/sakura/.cabal/bin/hlint",

    "clangd.arguments": [
        "--background-index",
        "--compile-commands-dir=build", //compile_command.json相对路径，cmake默认生成在build，自行配置
        "-j=20",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
        "--cross-file-rename",
        "--enable-config",
        "--fallback-style=WebKit",
        "--pretty",
        "--clang-tidy"
    ],

    "matlab.mlintpath" : "/home/sakura/Lys/matlab/bin/glnxa64/mlint",
    "matlab.matlabpath": "/home/sakura/Lys/matlab/bin/matlab"
}