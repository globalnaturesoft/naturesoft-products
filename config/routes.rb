Naturesoft::Products::Engine.routes.draw do
  namespace :admin, module: "admin" do
    resources :products do
      collection do
        put "enable"
        put "disable"
      end
    end
    resources :categories do
      collection do
        put "enable"
        put "disable"
      end
    end
    resources :manufacturers do
      collection do
        put "enable"
        put "disable"
      end
    end
  end
end