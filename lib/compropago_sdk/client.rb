class Client

  API_LIVE_URI = 'https://api.compropago.com/v1/'
  API_SANDBOX_URI = 'https://api.compropago.com/v1/'

  VERSION = '3.0.4'

  attr_accessor :publickey, :privatekey, :live, :deploy_uri, :api

  def initialize(publickey, privatekey, live)
    @publickey = publickey
    @privatekey = privatekey
    @live = live

    if live
      @deploy_uri = API_LIVE_URI
    else
      @deploy_uri = API_SANDBOX_URI
    end

    @api = Service.new self
  end

  def get_user
    @privatekey
  end

  def get_pass
    @publickey
  end

end