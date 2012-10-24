require 'spec_helper'

describe User do
  it "requires a name" do
    subject.password = "f0Obar"
    subject.email = "baz@gmail.com"
    
    subject.should_not be_valid

    subject.name = "bar"

    subject.should be_valid
  end

  it "requires an email" do
    subject.name = "foo"
    subject.password = "f0Obar"
    
    subject.should_not be_valid

    subject.email = "baz@gmail.com"

    subject.should be_valid
  end

  it "requires a password" do
    subject.name = "foo"
    subject.email = "baz@gmail.com"
    
    subject.should_not be_valid

    subject.password = "f0Obar"

    subject.should be_valid
  end

  it "requires valid email" do
    subject.name = "foo"
    subject.email = "bar"
    subject.password = "f0Obar"
 
    subject.should_not be_valid

    subject.email = "baz@gmail.com"

    subject.should be_valid
  end

  it "requires a valid password" do
    subject.name = "foo"
    subject.email = "bar@gmail.com"
    subject.password = "baz"
 
    subject.should_not be_valid

    subject.password = "f0Obar"

    subject.should be_valid
  end

  it "requires unique name" do
    User.create(:name => "foo", :email => "baz1@gmail.com", :password => "f0Obar")
    subject = User.new(:name => "foo", :email => "baz2@gmail.com", :password => "f0Obar")
    subject.should_not be_valid
    subject.errors[:name].should include("has already been taken")
  end

  it "requires unique email" do
    User.create(:name => "foo1", :email => "baz@gmail.com", :password => "f0Obar")
    subject = User.new(:name => "foo2", :email => "baz@gmail.com", :password => "f0Obar")
    subject.should_not be_valid
    subject.errors[:email].should include("has already been taken")
  end

end
