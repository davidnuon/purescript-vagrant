execute "Update apt" do
    command "apt-get update"
end

package "git"
package "ghc"
package "cabal-install"
package "libncurses5-dev"
package "nodejs"

include_recipe "nodejs"

execute "Update npm" do
    command "npm update -g npm"
end

execute "Install bower, grunt and gulp" do
    command "npm install -g bower grunt-cli gulp"
end
