module ApplicationHelper
  # Este helper personalizado garante que o template só irá ser renderizado caso a condição seja atendida
  # record representa a variável que tem como valor o artigo a ser renderizado
  def render_if(condition, template, record)
    # Este render já é o helper padrão de renderização
    render template, record if condition
  end
end
