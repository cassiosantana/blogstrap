class Article < ApplicationRecord
  # define que o artigo pertence a categoria
  belongs_to :category
  belongs_to :user

  # validações para o title e body que para o artigo ser salvo
  # é necessário que estes campos estejam preenchidos e com suas
  # quantidades de caracteres mínimos
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10 }

  # configura a quantidade de artigos a ser exibido por página
  paginates_per 10

  # escope serve para tirar a lógica do controller
  scope :descending_order, -> { order(created_at: :desc) }
  scope :without_highlights, ->(ids) { where("id NOT IN(#{ids})") if ids.present? }
  scope :filter_by_category, ->(category) { where category_id: category.id if category.present? }
  scope :filter_by_archive, lambda { |month_year|
    if month_year
      date = Date.strptime(month_year, '%B %Y')
      where created_at: date.beginning_of_month..date.end_of_month
    end
  }
end
