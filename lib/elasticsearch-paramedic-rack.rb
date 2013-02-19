require "elasticsearch-paramedic-rack/version"
require "elasticsearch-paramedic-rack/middleware"

module Elasticsearch
  module Paramedic
    module Rack
      PATH = "/elasticsearch-paramedic"
      ROOT = File.expand_path("../../public", __FILE__)
    end
  end
end
