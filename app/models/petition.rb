class Petition < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :target, :title, :user_id, :vote
end
