class PetitionsController < ApplicationController
  def index
  end

  def mypetitions
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

end
