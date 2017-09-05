class OrderMembersController < ApplicationController
  def index
    @member_index_presenter = MemberIndexPresenter.new({order: order_params[:direction]})
    render "users/index"
  end

  private

  def order_params
    params.require(:order).permit(:direction)
  end
end
