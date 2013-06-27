class User < ActiveRecord::Base
  has_many :authorizations
  has_many :votes
  attr_accessible :name

  def self.create_from_hash!(hash)
    create(:name => hash['info']['name'])
  end
end
