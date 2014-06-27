require 'lotus'

module BoilerPlate

  class Application < Lotus::Application
    configure do
      load_paths << 'app'
      routes do
        get '/', to: 'home#index'
      end
    end
  end

end

run BoilerPlate::Application.new
