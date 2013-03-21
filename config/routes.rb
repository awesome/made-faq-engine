if Faq.config.engine_routing
  Faq::Engine.routes.draw do
    root       :to => 'faq#index',    :as => 'faq'
  end
end
