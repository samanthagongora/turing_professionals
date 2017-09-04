class MembersController < ApplicationController
  def index
    @members = User.all
  end
end
