require 'rspec'
require 'mark_ii'

describe MarkII, '#encode' do
  let(:chars) { MarkII::CHARACTER_SET }

  it 'returns "STU" for "abc"' do
    subject.encode("abc", 2, 5).should == "STU"
  end

  it 'wraps letters at the start of the character set' do
    subject.encode(chars[0], 0, 1).should == chars[-2]
  end

  it 'wraps letters at the end of the character set' do
    subject.encode(chars[-1], 4, 1).should == chars[1]
  end
end
