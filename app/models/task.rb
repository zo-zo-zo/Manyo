class Task < ApplicationRecord
  validates :title, :content, presence: true
  scope :recent, -> { order(created_at: :desc) }

  enum status: { 未着手: 0, 着手中: 1, 完了: 2 }
  # enum priority: { high: 0, middle: 1, low: 2 }
end
