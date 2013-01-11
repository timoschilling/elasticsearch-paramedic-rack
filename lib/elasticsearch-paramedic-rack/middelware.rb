require "rack/static"

module Elasticsearch
  module Paramedic
    module Rack
      class Middelware < ::Rack::Static
        def initialize app
          super app, :root => Elasticsearch::Paramedic::Rack::ROOT, :urls => ["/elasticsearch-paramedic"]
        end

        def call env
          if env["PATH_INFO"] =~ %r"^/elasticsearch-paramedic$"
            return [302, {"Location" => "/elasticsearch-paramedic/", "Content-Type" => "text/plain"}, []]
          elsif env["PATH_INFO"] == "/elasticsearch-paramedic/"
            env["PATH_INFO"] = "/elasticsearch-paramedic/index.html"
          end

          super
        end
      end
    end
  end
end
