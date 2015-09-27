
# Configuration of the Vagrant container for Lustrous.

Vagrant.configure(2) do |config|

	# Ubuntu 15.04 (Vivid Vervet), amd64.
	config.vm.box = "ubuntu/vivid64"

	# Automated provisioning, see botstrap.sh for details.
	config.vm.provision :shell, path: "provision/bootstrap.sh"

	# Make VM's web server accessible from the host system.
	config.vm.network :forwarded_port, guest: 80, host: 8888

	# Change VM's name from "default" to "lustrous".
	config.vm.define :lustrous
	config.vm.provider "virtualbox" do |v|
		v.name = "lustrous"
	end

end

