Rails.application.routes.draw do
  mount ActiveTranslateSelf::Engine => "/active_translate_self"
  root to: 'application#index'
end
