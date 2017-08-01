class VotesController < ApplicationController


	def create

		if params.include?(:answer_id)

			answer = Answer.find(params[:answer_id])
			answer.votes.create(user: current_user)

			redirect_to root_path


		else
				
			question = Question.find(params[:question_id])
			question.votes.create(user: current_user)

			redirect_to root_path
		end
	
	end
	# def create
	# 	if params.(:votable_type).to_s  == "Question"
	# 		question = Question.find(params[:question_id])
	# 		vote = question.vote.build
	# 		vote.user_id = current_user.id
	# 		vote.save

	# 		redirect_to question

	# 	else
	# 		answer = Answer.find(params[:votable_id])
	# 		vote = answer.vote.build
	# 		vote.user_id = current_user.id
	# 		vote.save

	# 		redirect_to answer.question
			
	# 	end
		
	# end

	def destroy

	  if params.include?(:answer_id)
	  	answer = Answer.find(params[:answer_id])
	  	answer.votes.where(user: current_user).take.try(:destroy)
	  	redirect_to root_path
	  else

	    question = Question.find(params[:question_id])
	    question.votes.where(user: current_user).take.try(:destroy)
	    redirect_to root_path
	 end
	end
end
