class AnswersController < ApplicationController
	def create

		question = Question.find(params[:question_id])

		if params[:body].present?
			redirect_to question, alert: 'Answer can not be blank.'
		else
			question.answers.create(answers_params)
			redirect_to question
		end
		
	
	end

	private
		def answers_params
			params.require(:answer).permit(:body).merge(user: current_user)
		end
end

