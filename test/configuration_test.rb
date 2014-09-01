require "test_helper"

class ConfigurationTest < MiniTest::Test
  def test_must_set_the_conf_vars
    assert_equal Compropago.api_url, "https://api.compropago.com/v1"

    Compropago.api_url = "https://api.compropago.com/v2"
    Compropago.api_key = "MyToken"
    assert_equal Compropago.api_url, "https://api.compropago.com/v2"
    assert_equal Compropago.api_key, "MyToken"
  end
end
