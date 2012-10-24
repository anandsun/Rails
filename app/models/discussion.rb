class Discussion < ActiveRecord::Base
  attr_accessible :message, :topic, :user_id
  belongs_to :user
end
