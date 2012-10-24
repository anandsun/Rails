class Search < ActiveRecord::Base
  attr_accessible :keywords, :user_id, :searchTopic, :searchMessage, :searchUser
  belongs_to :user
end
