class HypervisorSetupTask
  def initialize(hypervisor)
    @hypervisor = hypervisor
    setup
  end

  def setup
    Net::SSH.start("#{@hypervisor.hostname}", "root", :timeout => 10) do |ssh|
      if @hypervisor.locked == false
        @hypervisor.update_attributes(locked: true)
        #
        # TODO: Setup HV
        #
        @hypervisor.update_attributes(locked: false)
      end
    end
  end
end
