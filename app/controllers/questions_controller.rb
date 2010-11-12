class QuestionsController < ApplicationController
  def index
    @question = Question.new
    @questions = Question.all
  end
  
  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Question added, thanks!"
      redirect_to questions_path
    else
      @questions = Question.all
      render :index
    end
  end
end
