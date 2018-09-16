# dotvim

```
git clone --recursive  https://github.com/Jiangxumin/dotvim.git ${HOME}/.vim 
ln -s ${HOME}/.vim/vimrc  ${HOME}/.vimrc

```

```
sudo apt-get install build-essential cmake
sudo apt-get install python-dev 

git clone --depth 1 --recursive https://github.com/Valloric/YouCompleteMe.git \
		$HOME/.vim/bundle/YouCompleteMe

cd $HOME/.vim/bundle/YouCompleteMe
cd crfasrnn
git submodule update --init --recursive

./install.py --clang-completer  # c/c++
./install.py --gocode-completer # go
./install.py --all
```
