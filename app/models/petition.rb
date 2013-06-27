class Petition < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :target, :title, :user_id, :vote
  has_many :votes, :dependent => :destroy
  validates :title, :presence => true,
            :length => {:minimum => 5}
  validates :body, :presence => true,
            :length => {:minimum => 5}
  validates :target, :presence => true,
            :length => {:minimum => 1}
  validates :user_id, :presence => true
end
