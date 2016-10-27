class HypervisorAction
  def initialize(hostname, user, options={})
    @hostname = hostname
    @user = user
    @password = options[:password]
  end

  def test_connection
    begin
      Net::SSH.start("#{@hostname}", "#{@user}", :password => "#{@password}", :timeout => 10) do |ssh|
        #
        # TODO: Setup SSH Keys
        #
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
