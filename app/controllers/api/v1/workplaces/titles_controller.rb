class Api::V1::Workplaces::TitlesController < ApplicationController
  def index
    render json: Workplace.title_counts
  end
end
