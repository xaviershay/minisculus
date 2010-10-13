require 'spec_helper'
require 'cracker'

describe Cracker, '#crack' do
  it "returns an array of positions and messages that decode the message to include the code words" do
    message = MarkIV.new.encode("hello there", 1, 2)
    result = subject.crack(message, %w(hello))
    result.should include({:message => "hello there", :positions => [1,2]})
    result.length.should == MarkIV::CHARACTER_SET.length
  end
end
