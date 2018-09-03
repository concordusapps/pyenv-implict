# pyenv-implict
> Allow pyenv to guess the python version from the program name.

## Install

Installing **pyenv-implict** as a pyenv plugin will give you access to the provided behavior.

```sh
$ git clone git://github.com/concordusapps/pyenv-implict.git $(pyenv root)/plugins/pyenv-implict
```

## Usage

```sh
$ pyenv install 2.7.5
$ pyenv install 3.3.2

$ pyenv version
system (set by ...)

$ python2.7 --version
Python 2.7.5

$ pyenv shell 3.3.2
$ pyenv version
3.3.2 (set by PYENV_VERSION environment variable)

$ python2 --version
Python 2.7.5
```

## License
Unless otherwise noted, all files contained within this project are liensed under the MIT opensource license. See the included file LICENSE or visit [opensource.org][] for more information.

[opensource.org]: http://opensource.org/licenses/MIT
