module Boilerplate
  module Views
    module Home

      class Index
        include Boilerplate::View
        layout :application


        def omg
          ["o","m","g"]
        end

      end

    end
  end
end

