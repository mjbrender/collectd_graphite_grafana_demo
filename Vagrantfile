Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.define :server do |srv|
    srv.vm.hostname = "graphite"
    srv.vm.network "private_network", ip: "192.168.33.10"
    srv.vm.network "forwarded_port", guest: 80, host: 8080
    # so snaptel (client) can run from the host system
    srv.vm.network "forwarded_port", guest: 8181, host: 8181
    srv.vm.provision "shell", path: "provision.sh"
  end
end
