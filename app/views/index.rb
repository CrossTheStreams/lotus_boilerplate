module BoilerPlate
  module Views
    module Home

      class Index
        include Lotus::View

        def render
          'Hello'
        end
      end

    end
  end
end
