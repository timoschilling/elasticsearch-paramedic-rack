require 'minitest/autorun'

require 'rails'

require "elasticsearch-paramedic-rack/middleware"
require "elasticsearch-paramedic-rack/railtie"

class RailtieTest < Minitest::Unit::TestCase
  def railtie
    Elasticsearch::Paramedic::Rack::Railtie
  end

  def test_name
    assert_equal "elasticsearch_paramedic_rack", railtie.railtie_name
  end

  def test_initializer_middleware_name
    assert_equal "elasticsearch_paramedic_rack.add_middleware", railtie.initializers.first.name
  end

  def test_initializer_middleware_set_middleware
    mock = MiniTest::Mock.new
    mock.expect :middleware, mock
    mock.expect :use, true, [Elasticsearch::Paramedic::Rack::Middleware]
    railtie.initializers.first.block.call mock
  end
end
