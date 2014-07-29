testdir = File.dirname(__FILE__)
$LOAD_PATH.unshift testdir unless $LOAD_PATH.include?(testdir)

libdir = File.dirname(File.dirname(__FILE__)) + '/lib'
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include?(libdir)

require "rubygems"
require "compropago"
require "turn"
require "minitest/unit"
require "minitest/autorun"
require 'webmock/minitest'

class MiniTest::Unit::TestCase
  def setup
  end
end

def load_fixture(name)
  File.new(File.dirname(__FILE__) + "/fixtures/#{name}.json")
end

# GET
def stub_get(path, fixture)
  stub_request(:get, Regexp.new("#{Compropago.configuration.api_url}#{path}")).
    to_return(:body => load_fixture(fixture))
end

# POST
def stub_post(path, fixture, status_code=200)
  stub_request(:post, Regexp.new("#{Compropago.configuration.api_url}#{path}")).
    to_return(:body => load_fixture(fixture), :status => status_code)
end

# PUT
def stub_put(path, fixture)
  stub_request(:put, Regexp.new("#{Compropago.configuration.api_url}#{path}")).
    to_return(:body => load_fixture(fixture))
end


# DELETE
def stub_delete(path)
  stub_request(:delete, Regexp.new("#{Compropago.configuration.api_url}#{path}"))
end


