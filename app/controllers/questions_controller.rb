class QuestionsController < ApplicationController
	before_action :authenticate_user!, except:  [:index,:show]



  def index
    @search = Question.search(params[:q])
  	@questions = @search.result
  end

   def new
    @question = Question.new
  end


  def show
  	@question = Question.find(params[:id])
  end


 def create
   @question = Question.new(question_params)
   @question.user_id = current_user.id

   if @question.save
     redirect_to questions_path, notice: "La pregunta fue publicado con éxito"
   else
     @errors = @question.errors
     render :new
   end
 end


 def edit
 	@question = Question.find(params[:id])
 end

  def update
    respond_to do |format|
    	@question = Question.find(params[:id])
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Se actualizó correctamente la pregunta.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  	@question = Question.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_path, notice: 'Se eliminó la pregunta.' }
    end
  end


 private
   def question_params
     params.require(:question).permit(:title, :body)
   end

end
