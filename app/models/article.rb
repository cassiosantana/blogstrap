class Article < ApplicationRecord
  # validações para o title e body que para o artigo ser salvo
  # é necessário que estes campos estejam preenchidos e com suas
  # quantidades de caracteres mínimos
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }
end
