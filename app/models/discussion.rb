class Discussion < ActiveRecord::Base
  attr_accessible :message, :t, :topic, :user
end
