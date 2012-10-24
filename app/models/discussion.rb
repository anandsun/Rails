class Discussion < ActiveRecord::Base
  attr_accessible :message, :topic, :user
  belongs_to :user
end
