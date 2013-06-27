class Vote < ActiveRecord::Base
  attr_accessible :petition_id, :user_id
end
