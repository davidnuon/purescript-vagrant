execute "Update apt" do
  command "apt-get update"
end

package "ghc"
package "cabal-install"
package "libncurses5-dev"

execute "Update cabal" do
    command "cabal update"
end

execute "Update cabal to latest version" do
    command "cabal install cabal cabal-install"
end

execute "Install purescript" do
    command "cabal install purescript"
end

execute "Add ~/.cabal/bin to PATH" do
    command "echo 'export PATH=\"~/.cabal/bin/:$PATH\"' >> ~/.bash_profile"
end
