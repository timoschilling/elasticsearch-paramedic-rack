module Elasticsearch
  module Paramedic
    module Rack
      class Railtie < Rails::Railtie
        railtie_name :elasticsearch_paramedic_rack

        initializer "elasticsearch_paramedic_rack.add_middleware" do |app|
          app.middleware.use Elasticsearch::Paramedic::Rack::Middleware
        end
      end
    end
  end
end
