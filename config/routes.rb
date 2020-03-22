Rails.application.routes.draw do
  root  'tasks#index'
  resources :tasks do
    collection do
      # get :search, on: :collection
      # step3追加
      post :confirm
    end
  end
end
