Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/new'
  get 'users/show'
  #root 'posts#index'
  #get 'posts', controller: 'posts', action: 'edit', id: 1
  #get 'posts' => 'posts#edit',id: 1
  #get 'home', to: 'post#show', constraints: {id: /[A-Z]\d{5}/}
  #get :home => 'posts#index'
  #get home: 'posts#index'

  #get 'posts(/:id)', to: 'posts#show'  --if /posts/1 is searched it will not find an action named 1 so
                                        #it will go to action show and use 1 as id in params[:id]

  #an example
  #get 'photos/:id/:user_id', to: 'photos#show' --if we pass /photos/1/2 then 1 will be params[:id] and
                                                # and 2 will me params[:user_id]
  #get 'photos/:id/with_user/:user_id', to: 'photos#show'
  #This route would respond to paths such as /photos/1/with_user/2. In this case, params would be { controller: 'photos', action: 'show', id: '1', user_id: '2' }.

  #get 'exit', to: 'sessions#destroy', as: :logout
  #This will create logout_path and logout_url as named route helpers in your application. Calling logout_path will return /exit

  #match 'photos', to: 'photos#show', via: [:get, :post]
                        #OR
  #get 'photos', to: 'photos#show'
  #post 'photos', to: 'photos#show'

  #resources :magzine do
 #   resources :photos, only: [:index, :new, :create]
 # end
  #resources :photos, only: [:show, :edit, :update, :destroy]
  
  resources :magzine , shallow: true do
    resources :photos
  end
  resources :posts, path: '' do
    #put :default_body on: :member
            #OR
    member do
      put :default_body
    end
    #delete :delete_all on: :collection
              #OR
    collection do
      delete :delete_all
    end
  end
end
