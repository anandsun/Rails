class Discussion < ActiveRecord::Base
  attr_accessible :message, :topic, :user_id
  belongs_to :user
  has_many :users, :through => :posts
  has_many :posts
  scope :created_by, lambda { |user|
    where("user_id = ?", user.id)
  }
  validates :topic, :presence => true, :length => { :minimum => 5 }
  validates :message, :presence => true, :length => { :minimum => 5 }
end
