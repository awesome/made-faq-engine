require "faq/engine"

module Faq
  mattr_accessor :category_cache_sweeper,
                 :question_cache_sweeper,
                 :engine_routing,
                 :engine_active_admin,
                 :main_image_size,
                 :thumb_image_size

  @@category_cache_sweeper = false
  @@question_cache_sweeper = false
  @@engine_routing = true
  @@engine_active_admin = true
  @@main_image_size = ["172x200#", :jpg]
  @@thumb_image_size = ["70x70", :jpg]

  class Engine < Rails::Engine
    isolate_namespace Faq

    initializer :faq do
      ActiveAdmin.application.load_paths.unshift Dir[Faq::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end
  end

  def self.config(&block)
    yield self if block
    return self
  end
end
