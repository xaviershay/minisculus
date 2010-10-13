require 'rspec'
require './no3'

describe MarkIV, '#encode' do
  let(:chars) { MarkIV::CHARACTER_SET }

  it 'encodes a one char string' do
    subject.encode("1", 1, 0).should == "2"
  end

  it 'encodes a two char string' do
    subject.encode("12", 1, 0).should == "25"
  end
end
