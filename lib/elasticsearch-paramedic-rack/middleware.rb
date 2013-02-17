require "rack/static"

module Elasticsearch
  module Paramedic
    module Rack
      class Middleware < ::Rack::Static
        def initialize app
          super app, :root => Elasticsearch::Paramedic::Rack::ROOT, :urls => ["/elasticsearch-paramedic"]
        end

        def call env
          case env["PATH_INFO"]
          when "/elasticsearch-paramedic"
            return [302, {"Location" => "/elasticsearch-paramedic/", "Content-Type" => "text/plain"}, []]
          when "/elasticsearch-paramedic/"
            env["PATH_INFO"] = "/elasticsearch-paramedic/index.html"
          end

          super
        end
      end
    end
  end
end
