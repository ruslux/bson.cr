module BSON
  class Undefined

    def self.from_bson(bson : IO)
      new
    end

    def to_bson(bson : IO)
      # Do nothing
    end

    def bson_size
      0
    end
    
  end
end