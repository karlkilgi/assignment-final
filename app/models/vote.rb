class Vote < ActiveRecord::Base
  attr_accessible :petition_id, :user_id
  validates_uniqueness_of :user_id, :scope => :petition_id
  validates :petition_id, :presence => true
  validates :user_id, :presence => true
end
