require 'minitest/autorun'

require 'rack/lint'
require 'rack/mock'

require "elasticsearch-paramedic-rack/middleware"

class MiddlewareTest < Minitest::Unit::TestCase
  PATH = Elasticsearch::Paramedic::Rack::PATH

  def middelware
    Rack::Lint.new Elasticsearch::Paramedic::Rack::Middleware.new(RackApp.new)
  end

  def test_root
    res = Rack::MockRequest.new(middelware).get(PATH)
    assert_equal 302, res.status
    assert_equal "#{PATH}/", res.header["Location"]
  end

  def test_root2
    res = Rack::MockRequest.new(middelware).get("#{PATH}/")
    assert_equal 200, res.status
  end

  def test_index
    res = Rack::MockRequest.new(middelware).get("#{PATH}/index.html")
    assert_equal 200, res.status
  end

  def test_js
    res = Rack::MockRequest.new(middelware).get("#{PATH}/js/app.js")
    assert_equal 200, res.status
  end

  def test_css
    res = Rack::MockRequest.new(middelware).get("#{PATH}/css/app.css")
    assert_equal 200, res.status
  end

  def test_404
    res = Rack::MockRequest.new(middelware).get("#{PATH}/foo")
    assert_equal 404, res.status
  end

  def test_app_path
    res = Rack::MockRequest.new(middelware).get("/bar")
    assert_equal 200, res.status
    assert_equal "ok", res.body
  end

  def test_app_root
    res = Rack::MockRequest.new(middelware).get("")
    assert_equal 200, res.status
    assert_equal "ok", res.body
  end

  def test_app_root2
    res = Rack::MockRequest.new(middelware).get("/")
    assert_equal 200, res.status
    assert_equal "ok", res.body
  end
end
