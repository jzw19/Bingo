Rails.application.routes.draw do
  root :to => 'game#index'
  match 'game/make_move', to: 'game#make_move', via: :get
  match 'game', to: 'game#index', via: :get

end
