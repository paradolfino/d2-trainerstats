require 'uri'

module Encode
   def code(params)
        return URI.encode(params)
   end
end