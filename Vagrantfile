# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'vagrant/util/platform'

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = '2'

# Load files in the support directory
Dir.glob('support/**/*.rb').each {|file| load file }

CPUS = processor_count # from support

# Vagrant configuration
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.ssh.forward_agent = true unless Vagrant::Util::Platform.windows?

  # Berkshelf Provisioner
  config.vm.define 'with-berkshelf', primary: true do |cfg|

    cfg.berkshelf.enabled = true

    cfg.ssh.forward_agent = true

    cfg.vm.box = "precise64"
    cfg.vm.box_url = "http://files.vagrantup.com/precise64.box"

    cfg.vm.provider :virtualbox do |v|
      v.customize [
        "modifyvm", :id,
        "--name",   "PureScript",
        "--memory", "1024",
        "--cpus", `grep "^processor" /proc/cpuinfo | wc -l`.chomp,
        "--ioapic", "on"
      ]
    end

    cfg.vm.provision :chef_solo do |chef|
      chef.verbose_logging = true
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "purescript"
    end

    cfg.vm.provision :shell, path: "scripts/cabal.sh", privileged: false
  end

  # Shell Provisioner
  config.vm.define 'with-shell', autostart: false do |cfg|

    cfg.vm.box = 'ubuntu/trusty64'

    cfg.vm.provision :shell, :path => 'scripts/common.sh'
    cfg.vm.provision :shell, :path => 'scripts/haskell.sh'
    cfg.vm.provision :shell, :path => 'scripts/javascript.sh'
    cfg.vm.provision :shell, :path => 'scripts/purescript.sh'

    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'PureScript (Part Deux)'
      v.memory = 2094
      v.cpus = CPUS
    end

    # from support
    copy_ssh_keys(cfg)
  end
end
