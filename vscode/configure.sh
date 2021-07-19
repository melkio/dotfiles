#! /bin/bash

extensions=(
    "PKief.material-icon-theme"
    "ms-dotnettools.csharp"
    "jchannon.csharpextensions"
    "josefpihrt-vscode.roslynator"
    "hashicorp.terraform"
    "Elmtooling.elm-ls-vscode"
    "ms-vscode-remote.remote-containers"
)

for ext in "${extensions[@]}"
do
    code --install-extension "$ext" --force 
done;
unset ext;