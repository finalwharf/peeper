Rails.application.routes.draw do
  get  '/:username' => 'users#index', :as => :user
  get  '/info/:username' => 'users#info', :as => :user_info
  root :to => redirect('/casetabs')
end
