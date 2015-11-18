Rails.application.routes.draw do

    get   '/' => 'site#home'
    get   '/contact' => 'site#contact'

    # ESTO NOS CREA AUTOMATED TODAS LAS ROUTES
    # 
    # resources :projects do
    #   resources :entries
    # end
    # 
    # SI QUIERO ESPECIFICAR 
    # 
    
    resources :project, only: [:index, :show, :new, :create] do
      resources :entries, only: [:index, :new, :create]
    end


    # get   '/projects' => 'projects#index'
    # get   '/projects/:id' => 'projects#show'
    # get   '/projects/:project_id/entries' => 'entries#index'
    # get   '/projects/:project_id/entries/new' => 'entries#new'

end
