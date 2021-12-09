class Article < ApplicationRecord
  validates :title, presence: true

  has_rich_text :content
  attribute :likes, :integer, default: 0

  after_create_commit { broadcast_prepend_to :articles }
  after_update_commit { broadcast_replace_to :articles }

  def like!
    Article.transaction do
      update(likes: likes + 1)
    end
  end
end
