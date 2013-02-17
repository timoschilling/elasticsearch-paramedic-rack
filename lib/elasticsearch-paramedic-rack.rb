require "elasticsearch-paramedic-rack/version"
require "elasticsearch-paramedic-rack/middleware"
require "elasticsearch-paramedic-rack/railtie" if defined? Rails

module Elasticsearch
  module Paramedic
    module Rack
      ROOT = File.expand_path("../../public", __FILE__)
    end
  end
end
