class Category < ApplicationRecord
  # define que uma categoria possui vários artigos
  has_many :articles, dependent: :restrict_with_error
  validates :name, presence: true, length: { minimum: 3 }

  scope :sorted, -> { order(:name) }
end
