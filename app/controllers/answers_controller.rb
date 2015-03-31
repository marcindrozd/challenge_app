class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :require_owner, only: [:accept]

  def create
    unless @question.has_accepted_answer?
      @answer = Answer.new(answer_params)
      @answer.user = current_user
      @answer.question = @question

      if @answer.save
        redirect_to question_path(@question), notice: "Answer was successfully created."
      else
        redirect_to question_path(@question), alert: "There was an error when adding answer."
      end
    else
      render[:alert] = "This question already has an accepted answer"
      redirect_to question_path(@question)
    end
  end

  def like
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    like = @answer.likes.create(user: current_user)
    if like.valid?
      flash[:success] = "Like added!"
      @answer.user.add_points(5)
      redirect_to question_path(params[:question_id])
    else
      flash[:alert] = "You have already voted on this item"
      redirect_to :back
    end
  end

  def accept
    @answer = Answer.find(params[:id])
    @answer.accept!
    @answer.user.add_points(25)
    flash[:notice] = "The answer has been accepted"
    redirect_to question_path(@question)
  end

  private

    def set_question
      @question = Question.find(params[:question_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:contents)
    end

    def require_owner
      if @question.user != current_user
        flash[:alert] = "You are not allowed to do that!"
        redirect_to question_path(@question)
      end
    end
end
