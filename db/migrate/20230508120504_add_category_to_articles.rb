class AddCategoryToArticles < ActiveRecord::Migration[6.1]
  def change
    # adiciona referência de categorias nos articles, não podendo ser nulo e deve ser chave estrangeira
    add_reference :articles, :category, null: false, foreign_key: true
  end
end
