class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # verificar se o usuário atual tem o mesmo id do usuário que criou o record(article)
    user&.id == record.user.id
  end

  def destroy?
    user&.id == record.user.id
  end
end
