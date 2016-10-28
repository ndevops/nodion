class HypervisorSetupTask
  def initialize(hypervisor)
    @hypervisor = hypervisor
    setup
  end

  def setup
    Net::SSH.start("#{@hypervisor.hostname}", "root", :timeout => 10) do |ssh|
      if @hypervisor.locked == false
        @hypervisor.update_attributes(locked: true)

        ssh.exec!("sudo apt-get install kvm libvirt-bin sasl2-bin -y")
        ssh.exec!("sed -i '/libvirtd_opts/s/^#//g' /etc/default/libvirt-bin")
        ssh.exec!("sed -i -r 's/libvirtd_opts=\"\"/libvirtd_opts=\"-d -l\"/' /etc/default/libvirt-bin")
        ssh.exec!("sed -i '/listen_tls/s/^#//g' /etc/libvirt/libvirtd.conf")
        ssh.exec!("sed -i '/listen_tcp/s/^#//g' /etc/libvirt/libvirtd.conf")
        ssh.exec!("sudo service libvirt-bin restart")
        #sudo saslpasswd2 -a libvirt nodion

        @hypervisor.update_attributes(locked: false)
      end
    end
  end
end
