class HypervisorStatusJob < ActiveJob::Base
  def perform
    Hypervisor.where(status: 'online').each do |hv|

      off = hv.update_attributes(status: 'offline')
      begin
        Net::SSH.start("#{hv.hostname}", "root", :timeout => 3) do |ssh|
        end
      rescue Timeout::Error
        off
      rescue Errno::EHOSTUNREACH
        off
      rescue Errno::ECONNREFUSED
        off
      rescue Net::SSH::AuthenticationFailed
        off
      rescue Net::SSH::ConnectionTimeout
        off
      end
    end
  end
end
