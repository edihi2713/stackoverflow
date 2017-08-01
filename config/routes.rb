Rails.application.routes.draw do

  get 'questions/index'

  post 'comments/create' => "comments#create"
  devise_for :users	
  
   post 'answer_votes/:id/vote' => 'votes#create', as: :answer_vote
	 
   delete 'answer_votes/:id/vote' => 'votes#destroy', as: :answer_vote_destroy
  
  resources :questions do 
  	resources :answers
  	resources :comments
  	resources :votes , only: [:create, :destroy]
  end

  root "questions#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
