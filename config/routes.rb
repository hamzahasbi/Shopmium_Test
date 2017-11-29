Rails.application.routes.draw do
  get 'positions_controller/index'

  get 'positions_controller/new'

  get 'positions_controller/delete'

  get 'positions_controller/edit'

  post 'positions_controller/update'

  post 'positions_controller/add'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
