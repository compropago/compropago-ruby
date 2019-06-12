class Client

  API_URL = 'https://api.compropago.com/v1/'

  VERSION = '4.0.1'

  attr_accessor :publickey, :privatekey, :live, :deploy_uri, :api

  def initialize(publickey, privatekey, live)
    @publickey = publickey
    @privatekey = privatekey
    @live = live
    @deploy_uri = API_URL
    @api = Service.new self
  end

  def get_user
    @privatekey
  end

  def get_pass
    @publickey
  end

end