#! /bin/bash

extensions=(
    "PKief.material-icon-theme"
    "ms-dotnettools.csharp"
    "kreativ-software.csharpextensions"
    "Ionide.Ionide-fsharp"
)

for ext in "${extensions[@]}"
do
    code --install-extension "$ext" --force 
done;
unset ext;