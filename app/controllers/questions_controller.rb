class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
  end

  def show
    @question = Question.find(params["id"])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = 'New question was successfully created.'
      redirect_to @question
    else
      flash.now[:notice] = @question.errors.full_messages.to_sentence
      render :new
    end
  end

  private
    def question_params
      params.require("question").permit("title", "description")
    end
end
