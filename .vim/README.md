Vim Configuration
======

Open Vim and type ":PluginInstall" to install plugins.

Don't forget to clone the Vundle submodule (`git submodule update --init`).

### Compile YCM

Requirements: cmake, python (3.6, 64-bit), visual studio, rust, nodejs/npm

```shell
cd ~/.vim/bundle/YouCompleteMe
python install.py --tern-completer --racer-completer --msvc 14
```
