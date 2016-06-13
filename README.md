Cloud9 binary dependencies for windows
====================

The SSH workspace type of Cloud9 IDE allows to connect the IDE to any SSH server.
This repository contains the scripts to install all the required dependencies.

    curl -L https://raw.githubusercontent.com/cloud9ide/sdk-deps-win32/master/install.sh | bash

or

    wget -O - https://raw.githubusercontent.com/cloud9ide/sdk-deps-win32/master/install.sh | bash

    
The above will install `node.js` with precompiled versions of `pty.js` and `sqlite3`.
And will set up Cloud9 to use the bash executable with which the above script was launched. (Cloud9 needs bash, curl, tar, zip, mkdir and rm).

All these are added to `$HOME/.c9` folder
when cloud9 is launched from environment that misses `$HOME` variable it will use 
`$HOMEDRIVE$HOMEPATH` as `$HOME`

Installer for msys can be obtained from https://msys2.github.io/
