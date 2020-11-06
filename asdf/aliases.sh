#! /bin/sh

# change directory and set dotnet core environment
function dc() {
    cd "$1"
    
    if asdf current dotnet-core > /dev/null 2>&1 ; then
        version=$(asdf current dotnet-core | sed 's/^dotnet-core\s*\(\S*\).*$/\1/')
        base=$(asdf where dotnet-core $version)

        export MSBuildSDKsPath=$base/sdk/$version/Sdks
    else
        echo "No dotnet-core version set. Type `asdf list-all dotnet-core` for all versions."
    fi
}