require "elasticsearch-paramedic-rack"

class RackApp
  def call(env)
    status = if env["PATH_INFO"] =~ /^\/elasticsearch-paramedic/
      500
    else
      200
    end
    [status, {"Content-Type" => "text/plain"}, ["ok"]]
  end
end
