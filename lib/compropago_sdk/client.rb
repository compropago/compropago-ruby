class Client

  attr_accessor :publickey, :privatekey, :live, :deploy_uri, :api

  def initialize(publickey, privatekey, live)
    @publickey = publickey
    @privatekey = privatekey
    @live = live

    if live
      @deploy_uri = CpConfigSdk::API_LIVE_URI
    else
      @deploy_uri = CpConfigSdk::API_SANDBOX_URI
    end

    @api = Service.new self
  end

  def get_user
    @privatekey
  end

  def get_pass
    @publickey
  end

  def get_full_auth
    @privatekey+':'+@publickey
  end

end