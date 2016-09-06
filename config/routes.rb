Naturesoft::Products::Engine.routes.draw do
  namespace :admin, module: "admin", path: "admin/products" do
    resources :products do
      collection do
        put "enable"
        put "disable"
        delete "delete"
      end
    end
    resources :properties do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
    resources :categories do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
    resources :manufacturers do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
    resources :labels do
      collection do
        put "enable"
        put "disable"
        delete "delete"
        get "select2"
      end
    end
  end
end