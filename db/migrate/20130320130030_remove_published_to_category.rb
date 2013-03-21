class RemovePublishedToCategory < ActiveRecord::Migration
  def change
    remove_column :faq_categories, :published
  end
end
