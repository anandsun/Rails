class Search < ActiveRecord::Base
  attr_accessible :keywords, :user, :searchTopic, :searchMessage, :searchUser
end
