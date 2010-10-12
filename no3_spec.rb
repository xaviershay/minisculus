require 'rspec'
require './no3'

describe MarkIV, '#encode' do
  let(:chars) { MarkIV::CHARACTER_SET }

  it 'returns "3" for "1"' do
    subject.encode("1", 0, 0).should == "3"
  end
end
