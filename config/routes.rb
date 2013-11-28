Rails.application.routes.draw do
  match "fakebook/cache/store" => "fakebook/cache#store", :via => :post
end
