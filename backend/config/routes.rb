Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'scoreboards' => 'score_boards#create'
    end
  end
  namespace :api do
    namespace :v1 do
      post 'answers' => 'answers#create'
    end
  end
  namespace :api do
    namespace :v1 do
      post 'quizzes' => 'quizzes#show'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'users/:username' => 'users#show'
      get 'scores' => 'users#scores'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
