if defined?(ActiveAdmin) and Faq.config.engine_active_admin
  ActiveAdmin.register Faq::Category do
    controller do
      cache_sweeper Faq.config.category_cache_sweeper if Faq.config.category_cache_sweeper
      defaults      :finder => :find_by_url
    end

    menu            :label => "Categories", :parent => "FAQs", :priority => 1

    scope           :all
    scope           :with_questions

    filter          :title

    index do
      column        :title
      column        :created_at
      column        :updated_at

      default_actions
    end

    form do |f|
      f.inputs "Category" do
        f.input     :title

        f.input     :image,
                    :hint => f.template.image_tag(f.object.image.url(:thumb))

        f.input     :order,
                    :hint => "The display order on the FAQ page"
      end

      f.buttons
    end
  end
end
