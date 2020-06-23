Rails.application.routes.draw do
  mount Defra::Ruby::Features::Engine => "/defra-ruby-features"
end
