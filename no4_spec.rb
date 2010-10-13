require 'rspec'
require './no3'

describe MarkIV, '#decode' do
  it 'decodes a one char string' do
    subject.decode("2", 1, 0).should == "1"
  end

  it 'decodes a two char string' do
    subject.decode("25", 1, 0).should == "12"
  end
end
