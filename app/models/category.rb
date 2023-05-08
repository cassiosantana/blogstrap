class Category < ApplicationRecord
  # define que uma categoria possui vários artigos
  has_many :articles
  validates :name, presence: true, length: { minimum: 3 }
end
