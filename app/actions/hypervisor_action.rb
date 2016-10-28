class HypervisorAction
  def initialize(hostname, user, options={})
    @hostname = hostname
    @user = user
    @password = options[:password]
  end

  def test_connection
    begin
      Net::SSH.start("#{@hostname}", "#{@user}", :password => "#{@password}", :timeout => 10) do |ssh|
        @key_file = File.read(ENV['HOME']+'/.ssh/id_rsa.pub')
        ssh.exec!("echo '#{@key_file}' >> /root/.ssh/authorized_keys")
      end
    rescue Timeout::Error
      false
    rescue Errno::EHOSTUNREACH
      false
    rescue Errno::ECONNREFUSED
      false
    rescue Net::SSH::AuthenticationFailed
      false
    end
  end
end
