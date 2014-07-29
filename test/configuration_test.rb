require "test_helper"

class ConfigurationTest < MiniTest::Unit::TestCase
  def test_must_set_the_conf_vars
    Compropago.configure do |config|
      config.api_key = "MyToken"
    end
    assert_equal Compropago.configuration.api_url, "https://api.compropago.com/v1"
    assert_equal Compropago.configuration.api_key, "MyToken"
  end
end
