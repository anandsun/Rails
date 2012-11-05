class StrongPasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A.+[a-zA-Z].+\z/ and value =~ /\A.+[^a-zA-Z].+\z/
      record.errors[attribute] << (options[:message] || "is too simple (must contain alphabetic and non-alphabetic characters).")
    end
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, 
  :password_confirmation, :remember_me
  has_many :discussions, :through => :posts
  has_many :searches
  has_many :posts
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A.+@.+\z/, :message => "email address must contain '@'" }
  validates :password, :presence => true
  validates :password, :strongPassword => true
end
