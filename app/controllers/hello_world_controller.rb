#encoding: utf-8
class HelloWorldController < ApplicationController
  def index
    @restaurantes = Restaurante.order("nome")
    render :text => "Ação padrão"
  end
  def hello
    render :text => "<br> Hello World <br> Teste <br> Gostou Matheus??"
  end
end
