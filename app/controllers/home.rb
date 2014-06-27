module BoilerPlate

  module Controllers
    module Home
      include Lotus::Controller

      action 'Index' do
        def call(params)
        end
      end
    end
  end

end
