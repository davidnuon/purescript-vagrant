echo "updating cabal"
cabal update
echo "adding ~/.cabal/bin to path"
echo "export PATH=/home/vagrant/.cabal/bin/:$PATH" >> /home/vagrant/.profile
source /home/vagrant/.profile
echo "updating cabal-install"
cabal install cabal cabal-install
echo "installing PureScript"
cabal install purescript
