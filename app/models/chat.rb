class Chat < ApplicationRecord
  validates :title, presence: true, length: { maximum: 75 }
  validates :body, presence: true
end
