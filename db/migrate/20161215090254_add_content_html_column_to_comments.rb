class AddContentHtmlColumnToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :content_html, :string
  end
end
