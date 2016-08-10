Naturesoft::Products::Engine.routes.draw do
  namespace :admin, module: "admin" do
    resources :manufacturers do
      collection do
        put "enable"
        put "disable"
      end
    end
  end
end