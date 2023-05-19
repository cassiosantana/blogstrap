# frozen_string_literal: true

# Article Controller
class ArticlesController < ApplicationController
  include Paginable

  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @highlights = Article.filter_by_category(params[:category_id])
                         .descending_order
                         .first(3)

    highlights_ids = @highlights.pluck(:id).join(',')

    # Este código faz estas operações:
    # 1 - busca do banco de dados os artigos na order do primeiro para o ultimo
    # 2 - define que na página atual só devem ser apresentados apenas 2 artigos por página
    @articles = Article.without_highlights(highlights_ids)
                       .filter_by_category(params[:category_id])
                       .descending_order
                       .page(current_page)
  end

  def show; end

  def new
    # define que o novo artigo será vinculado ao usuário atual.
    @article = current_user.articles.new
  end

  def create
    # define que o novo artigo será vinculado ao usuário atual.
    @article = current_user.articles.new(article_params)

    if @article.save
      # o rails entende este código como se estivéssemos mandando redirecionar
      # para o método show, visto que mostraria o próprio article.
      redirect_to @article
    else
      # aqui utilizando o render em vez no redirect pois se a página for
      # redirecionada perderíamos o que já foi digitado. Desta forma com
      # render ele vai renderizar a página mas os parâmetros que já temos
      # continuam para serem reutilizados.
      render :new
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path
  end

  private

  # No rails temos uma forma de pegar os parâmetros e coloca-los de forma
  # direta e salva-los no article, só que por questões de segurança, temos que
  # dizer quais os parâmetros que eu estou permitindo para que caso estejamos
  # alterando um usuário, e não especifiquemos quais os campos que iremos mudar
  # e alguém altere um campo como por exemplo 'admin' e coloque admin como 'true'.
  # Porque no Article.new() qualquer parâmetro que for passado ele irá aceitar.
  # Temos uma forma de nos defender disso no rails que se chama 'strong parameters'.
  def article_params
    # params são os parâmetros fornecidos pelo controller.
    params.require(:article).permit(:title, :body, :category_id)
  end

  def set_article
    @article = Article.find(params[:id])
    # instrução do pundit que aplica as regras definidas lá no article_policy.rb
    # Ele basicamente vai pegar o article que acabou de ser encontrado no código acima,
    # vai mandar para o application_policy.rb para ser utilizado no método initialize
    # o user do initialize será o usuário atual logado, e o record será este que foi definido
    # na instrução authorize.
    authorize @article
  end
end
