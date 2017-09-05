class FilterMembersController < ApplicationController
  def index
    @member_index_presenter = MemberIndexPresenter.new({filter: filter_params})
    render "users/index"
  end

  private

  def filter_params
      params.require(:filter).permit(location_ids: [], company_ids: [])
  end
end
