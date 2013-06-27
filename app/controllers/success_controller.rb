class SuccessController < ApplicationController
  def index
    petitions = Petition.all
    @successful_petitions = Array.new
    petitions.each do |petition|
      if petition.votes.count >= petition.target
        @successful_petitions << petition
      end
    end
    @successful_petitions
  end
end
