require 'spec_helper'

describe Discussion do
  it "has topic" do
    subject.message = "Blah blah blah"
    subject.should_not be_valid
    
    subject.topic = "1"
    
    subject.should_not be_valid

    subject.topic = "Blah Blah? blah."
    
    subject.should be_valid
  end

  it "has message" do
    subject.topic = "Blah blah blah"
    subject.should_not be_valid
    
    subject.message = "3"
    
    subject.should_not be_valid

    subject.message = "Blah Blah? blah."
    
    subject.should be_valid
  end

end
