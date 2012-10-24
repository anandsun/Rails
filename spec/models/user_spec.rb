require 'spec_helper'

describe User do
  it "requires a name" do
    subject.password = "f0O"
    subject.email = "bar@gmail.com"
    
    subject.should_not be_valid
    
    subject.name = "baz"
    
    subject.should be_valid
  end
  it "requires an email" do
    subject.name = "foo"
    subject.password = "b@R"
    
    subject.should_not be_valid
    
    subject.email = "baz@gmail.com"
    
    subject.should be_valid
  end
  it "requires a password" do
    subject.name = "foo"
    subject.email = "bar@gmail.com"
    
    subject.should_not be_valid
    
    subject.password = "b@Z"
    
    subject.should be_valid
  end
  it "requires a valid email" do
    subject.name = "foo"
    subject.email = "bar"
    subject.password = "b@Z"
    
    subject.should_not be_valid
    
    subject.email = "bar@gmail.com"
    
    subject.should be_valid
  end
  it "requires a strong password" do
    subject.name = "foo"
    subject.password = "bar"
    subject.email = "baz@gmail.com"
    
    subject.should_not be_valid
    
    subject.password = "barroombrawl"
    
    subject.should be_valid
    
    subject.password = "b@R"
    
    subject.should be_valid
  end
end
