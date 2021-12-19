class Webserver < Sinatra::Base
    set :views, File.dirname(__FILE__) + "/webserver/views"
  
    get "/" do  
      erb :index
    end
end