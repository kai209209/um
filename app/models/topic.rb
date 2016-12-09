class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments

  before_save :change_content_markdown

  private

  def change_content_markdown
    self.content_html = Um::Markdown.render(self.content)
  end
end
