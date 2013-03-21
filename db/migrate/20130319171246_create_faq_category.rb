class CreateFaqCategory < ActiveRecord::Migration
  def change
    create_table :faq_categories do |t|
      t.string      :title
      t.string      :url
      t.integer     :order, :default => 9999

      t.timestamps
    end

    add_attachment :faq_categories, :image
  end
end
