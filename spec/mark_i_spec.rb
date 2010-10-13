require 'spec_helper'
require 'mark_i'

describe MarkI, '#encode' do
  let(:chars) { MarkI::CHARACTER_SET }

  it 'returns the given message for a position of 0' do
    subject.encode(chars[0..2].join, 0).should == chars[0..2].join
  end

  it 'shift letters by the given position' do
    subject.encode(chars[0..2].join, 1).should == chars[1..3].join
  end

  it 'wraps letters at the end of the character set' do
    subject.encode(chars[-1], 1).should == chars[0]
  end
end
