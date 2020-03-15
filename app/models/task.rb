class Task < ApplicationRecord
  validates :title, :content, presence: true
  scope :recent, -> { order(created_at: :desc) }
end
