class Discussion < ActiveRecord::Base
  attr_accessible :message, :topic, :user_id
  belongs_to :user
  has_many :users, :through => :posts
  has_many :posts
  scope :recent, where("created_at > ?", 30.days.ago) 
end
