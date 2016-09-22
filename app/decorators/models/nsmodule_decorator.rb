Naturesoft::Nsmodule.class_eval do
  @products = {
    "newest_products" => {
      "label" => "Newest products",
      "options" => {
        "category_id" => nil,
        "number_of_products" => 5,
        "style" => "default"
      }
    },
    "bestseller_products" => {
      "label" => "Bestseller products",
      "options" => {
        "style" => "default"
      }
    },
    "onsales_products" => {
      "label" => "On sales products",
      "options" => {
        "style" => "default"
      }
    }
  }
end