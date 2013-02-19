require "rack/static"

module Elasticsearch
  module Paramedic
    module Rack
      class Middleware < ::Rack::Static
        def initialize app
          super app, :root => Elasticsearch::Paramedic::Rack::ROOT, :urls => [PATH]
        end

        def call env
          case env["PATH_INFO"]
          when PATH
            return [302, {"Location" => "#{PATH}/", "Content-Type" => "text/plain"}, []]
          when "#{PATH}/"
            env["PATH_INFO"] = "#{PATH}/index.html"
          end

          super
        end
      end
    end
  end
end
