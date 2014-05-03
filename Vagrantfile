# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure "2" do |config|

  config.berkshelf.enabled = true

  config.ssh.forward_agent = true

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider :virtualbox do |v|
    v.customize [
      "modifyvm", :id,
      "--name",   "PureScript",
      "--memory", "1024",
      "--cpus", `grep "^processor" /proc/cpuinfo | wc -l`.chomp,
      "--ioapic", "on"
    ]
  end

  config.vm.provision :chef_solo do |chef|
    chef.verbose_logging = true
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "purescript"
  end

  config.vm.provision :shell, path: "cabal.sh", privileged: false
end
