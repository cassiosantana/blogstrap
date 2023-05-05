# frozen_string_literal: true

# Article Controller
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @highlights = Article.order(created_at: :desc).first(3)

    # obtém um objeto com parâmetros da requisição da url
    current_page = (params[:page] || 1).to_i

    # Este código faz estas operações:
    # 1 - busca do banco de dados os artigos na order do primeiro para o ultimo
    # 2 - define que na página atual só devem ser apresentados apenas 2 artigos por página
    @articles = Article.order(created_at: :desc).page(current_page).per(2)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

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
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
