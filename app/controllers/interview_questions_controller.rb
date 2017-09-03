class InterviewQuestionsController < ApplicationController
  def create
    question = InterviewQuestion.create(interview_question_params)
    redirect_to company_path(Company.find(interview_question_params[:company_id]).slug)
  end

  private

  def interview_question_params
    params.require(:interview_question).permit(:description, :company_id)
  end
end
