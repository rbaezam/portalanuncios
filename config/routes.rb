Portalanuncios::Application.routes.draw do

  root :to => "sitio#index"

  match 'portal_empresas' => "portal_empresas#index", :as => "portal_empresas"

  match '/registrarse' => 'usuarios#new', :as => 'registrarse'
  match '/iniciar_sesion' => 'sesiones#new', :as => 'iniciar_sesion'
  match '/cerrar_sesion' => 'sesiones#destroy', :as => 'cerrar_sesion'

  match '/empresas/portal' => 'portal_empresas#index', :as => 'portal_empresas'
  match '/usuarios/usuario_incorrecto' => 'usuarios#usuario_incorrecto', :as => 'usuario_incorrecto'

  # Rutas AJAX
  match '/ciudades/obtener_por_estado' => 'ciudades#obtener_por_estado', :as => 'obtener_ciudades_por_estado'
  match '/subcategorias/obtener_por_categoria' => 'subcategorias#obtener_por_categoria', :as => 'obtener_subcategorias_por_categoria'

  resources :anuncios
  resources :usuarios do
    member do
      get 'cambiar_password'
      post 'realizar_cambio_password'
    end
  end
  resources :empresas
  resources :sesiones

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
