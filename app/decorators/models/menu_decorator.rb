if Naturesoft::Core.available?("menus")
  Naturesoft::Menus::Menu.class_eval do
    @products = {
      "categories_products" => {
        "label" => "Categories / Products List",
        "controller" => "/naturesoft/products/categories",
        "action" => "list",
        "params" => {
          "id" => nil,
          "manufacturer_id" => nil,
        }
      }
    }
  end
end