class StrongPasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless (value =~ /\A.+[a-z].+\z/ and value =~ /\A.+[a-z].+\z/ and 
        value =~ /\A.+[^a-zA-Z].+\z/)
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  has_many :discussions
  has_many :searches
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A.+@.+\z/, :message => "email address must contain '@'" }
  validates :password, :presence => true
  validates :password, :length => { :in => 6..20 }, :strongPassword => true
end
