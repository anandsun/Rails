class Discussion < ActiveRecord::Base
  attr_accessible :message, :topic, :user
end
