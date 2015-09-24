
# Configuration of the Vagrant container for Lustrous.

Vagrant.configure(2) do |config|

	# Ubuntu 15.04 (Vivid Vervet), amd64.
	config.vm.box = "ubuntu/vivid64"

	# Automated provisioning, see botstrap.sh for details.
	config.vm.provision :shell, path: "bootstrap.sh"

end

