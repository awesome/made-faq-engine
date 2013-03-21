class AddPublishedToCategory < ActiveRecord::Migration
  def change
    add_column :faq_categories, :published, :boolean, :default => true
  end
end
