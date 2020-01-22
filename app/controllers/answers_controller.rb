class AnswersController < ApplicationController
  def create
    @question = Question.find(params["question_id"])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answers = @question.answers

    if @answer.save
      flash[:notice] = 'New answer was successfully added.'
      redirect_to @question
    else
      flash.now[:notice] = @answer.errors.full_messages.to_sentence
      render :'questions/show'
    end
  end

  private
  def answer_params
    params.require("answer").permit("description")
  end
end
