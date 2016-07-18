class Client
  @@version = '2.0.0'

  @@api_live_uri = 'http://api.compropago.com/v1/'
  @@api_sandbox_uri = 'http://api.compropago.com/v1/'

  attr_reader :version
  attr_accessor :api

  # @param [String] publickey
  # @param [String] privatekey
  # @param [Bolean] live
  # @param [String] contained   => nil
  def initialize(publickey, privatekey, live, contained = nil)
    @publickey = publickey
    @privatekey = privatekey
    @live = live

    @contained = (contained != nil && contained.is_a?(String) )? contained : "SDK; ruby-gem #{@version}"

    @deploy_uri = live ? @@api_live_uri : @@api_sandbox_uri

    @api = Service.new(self)
  end


  # @return [String]
  def get_user
    @privatekey
  end


  # @return [String]
  def get_pass
    @publickey
  end


  # @return [Bolean]
  def get_mode
    @live
  end


  # @return [String]
  def get_uri
    @deploy_uri
  end


  # @return [String]
  def get_contained
    @contained
  end
end