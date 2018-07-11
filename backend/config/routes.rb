Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'quizzes' => 'quizzes#show'
    end
  end
  namespace :api do
    namespace :v1 do
      get 'users/:username' => 'users#show'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
