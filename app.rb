# code by W3NDO (https://github.com/W3NDO)

#This is a work timer. It takes stock of how much time I spend at work. IDK how else to explain that

require "sinatra/base"
require 'json'


class Application < Sinatra::Base
    def set_start_time(id)
        times = JSON.parse(File.read("./tmp/start_time.txt"))
        if times[id]
            return times[id]
        else
            times[id] = Time.now
            File.write("./tmp/start_time.txt", JSON.dump(times) )
            times[id]
        end
        File.write("./tmp/start_time.txt", "#{{id.to_sym => Time.now}.to_json}" )
    end

    get '/' do
        params[:id] = rand(1000..9999)
        p "params #{params}"
        erb :index, :layout => :default_layout
    end

    post '/' do
        set_start_time(params[:id])
        erb :index, :layout => :default_layout
    end

    get '/history' do
        "history"
    end

end
