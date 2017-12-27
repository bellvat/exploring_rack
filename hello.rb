class MyApp
  attr_accessor :request
  
  def initialize(request)
    @request = request
  end
  
  def body
    content = "#{request.env}"
    layout(content)
  end

  def layout(content)
    %{<!DOCTYPE html>
<html lang="en">
      <head> 
             <meta charset="utf-8">
             <title>Welcome to your Rack!</title>
      </head>
      <body>
        <h1> Welcome to your App! </h1>
        <p> #{content} </p>
      </body>
     </html>}
  end 

end

class MyApp::Rack
  def call(env)
    request = Rack::Request.new(env)
    myapp = MyApp.new(request)

    [200, {'Content-type'=> 'text/html'},[myapp.body] ]
  end
end
