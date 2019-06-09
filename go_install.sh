
#!/bin/bash

#set the source path of gvm. $HOME points to '/root'
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source $HOME/.gvm/scripts/gvm
export CGO_ENABLED=0

declare -a versions=( '1.11.10' '1.12.5' )
for version in "${versions[@]}"
  do
    echo "================= Install Go $version ==================="
    export GOROOT_BOOTSTRAP=$GOROOT
    gvm install go$version --prefer-binary
    source /root/.gvm/scripts/gvm
    gvm use go$version
    go install -a std
    go get -u github.com/tools/godep
done
