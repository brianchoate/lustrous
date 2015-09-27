
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

	# Mount the VCL directory in "/home/vagrant/vcl" so that
	# it is easier to access.
	config.vm.synced_folder "vcl/", "/home/vagrant/vcl",
		owner: "vagrant", group: "vagrant"

	# Mount the provisioner's directory to in "/provision"
	# so that it stands out of the way.
	config.vm.synced_folder "provision/", "/provision",
		owner: "root", group: "root"

	# Disable the default share so that it stands out of the way.
	config.vm.synced_folder "./", "/vagrant",
		disabled: true

end

