GUEST_HOME = '/home/vagrant' unless defined?(GUEST_HOME)
USER_HOME = '~/' unless defined?(USER_HOME)

def copy_ssh_keys(config, guest_home = GUEST_HOME)
  host_ssh_dir = File.expand_path(File.join(USER_HOME, '.ssh'))
  if File.directory?(host_ssh_dir)
    {"#{host_ssh_dir}/id_rsa" => "600", "#{host_ssh_dir}/id_rsa.pub" => '644'}.each do |file, mode|
      dest = File.join(guest_home, '.ssh', File.basename(file))
      config.vm.provision :file, source: file, destination: dest
      config.vm.provision :shell, inline: "chmod #{mode} #{dest}"
    end
  end
end
