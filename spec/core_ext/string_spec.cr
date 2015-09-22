require "../spec_helper"

describe String do
  
  describe "#to_bson" do
    
    it "encodes in the right format" do

      str = "hello"
      io = str.to_bson.rewind

      size = Int32.from_bson(io)
      size.should eq(str.bytesize + 1)

      io.next_bytes(size - 1).map(&.chr).join("").should eq(str)

      io.read_byte.should eq(0) # null ending
    end

    it "can be decoded as BSON again" do
      str = "hello world"
      String.from_bson(str.to_bson.rewind).should eq(str)
    end

  end

end