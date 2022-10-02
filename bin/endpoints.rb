require 'sinatra'

class Endpoints

    def home
        get '/' do
            "hello world"
        end
    end
end
