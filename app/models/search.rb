class Search < ActiveRecord::Base
  attr_accessible :keywords, :user, :searchTopic, :searchMessage, :searchUser
  belongs_to :user
end
