class QuestionsController < ApplicationController
  def family_risks
    params[:answer_list] ? @answer_list = AnswerList.new(answer_list_params) : @answer_list = AnswerList.new
  end

  def useful
    params[:answer_list] ? @answer_list = AnswerList.new(answer_list_params) : @answer_list = AnswerList.new
  end

  def timing
    params[:answer_list] ? @answer_list = AnswerList.new(answer_list_params) : @answer_list = AnswerList.new
  end

  def pros_and_cons
    params[:answer_list] ? @answer_list = AnswerList.new(answer_list_params) : @answer_list = AnswerList.new
  end

  def results
#    binding.pry
    render json: answer_list_params
  end

  private
  def answer_list_params
    params.require(:answer_list).permit(:family_risks, :useful, :timing, :pros_and_cons)
  end
end
