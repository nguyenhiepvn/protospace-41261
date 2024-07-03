class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :users
  belongs_to :prototypes
end
