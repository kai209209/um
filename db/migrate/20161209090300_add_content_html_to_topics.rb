class AddContentHtmlToTopics < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :content_html, :string
  end
end
