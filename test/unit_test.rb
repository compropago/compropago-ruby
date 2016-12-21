require 'minitest/autorun'

# Importar el archivo principal de la gema (lib/scafold_gem)
require 'compropago_sdk'

class MyTest < MiniTest::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Fake test
  def test_fail

    assert false
  end
end