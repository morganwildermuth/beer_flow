class QuestionsController < ApplicationController
  def create
    @question = Question.new(params[:question])
    @question.save
    redirect_to question_path(@question)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def new
    @question = Question.new
    @questions = Question.all
  end

  def index
    if !(current_user.nil?)
      @questions = Question.all
      if @questions.empty?
        redirect_to new_question_path and return
      end
    else
      redirect_to new_session_path and return
    end
  end
end
