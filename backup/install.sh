#!/bin/bash
# -polka-

# Get the current directory
DIR="$( cd "$(dirname "$0" )" && pwd )"

# Link dot files to $HOME
for dotfile in $(find $DIR -maxdepth 1 -type f -name ".*"); do
  ln -fs $dotfile "${HOME}/$(basename $dotfile)"
done

# Link rc files in .bashrc.d
[ -d "${HOME}/.bashrc.d" ] || mkdir "${HOME}/.bashrc.d"
for dotfile in ${DIR}/.bashrc.d/*; do
    ln -fs $dotfile "${HOME}/.bashrc.d/$(basename $dotfile)"
done

# Link files in bin
[ -d "${HOME}/bin" ] || mkdir "${HOME}/bin"
for file in ${DIR}/bin/*; do
    [ -x $file ] || continue
    [[ $(uname) == 'Linux' && $(basename $file) == 'reattach-to-user-namespace' ]] && continue
    ln -fs $file "${HOME}/bin/$(basename $file)"
done

# Link files in lib
[ -d "${HOME}/lib" ] || mkdir "${HOME}/lib"
for file in ${DIR}/lib/*; do
    [ -x $file ] || continue
    ln -fs $file "${HOME}/lib/$(basename $file)"
done

# Remove broken symlinks
find -L "${HOME}" "${HOME}/.bashrc.d" "${HOME}/bin" "${HOME}/lib" "${HOME}/.vim/" -maxdepth 1 -type l | xargs rm 2>/dev/null
