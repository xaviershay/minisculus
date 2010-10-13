require 'spec_helper'
require 'mark_iv'

describe MarkIV, '#encode' do
  it 'encodes a one char string' do
    subject.encode("1", 1, 0).should == "2"
  end

  it 'encodes a two char string' do
    subject.encode("12", 1, 0).should == "25"
  end

  it 'decodes a one char string' do
    subject.decode("2", 1, 0).should == "1"
  end

  it 'decodes a two char string' do
    subject.decode("25", 1, 0).should == "12"
  end
end
