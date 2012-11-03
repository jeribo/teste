#encoding: utf-8
class RestaurantesController < ApplicationController
  def index
    @restaurantes = Restaurante.order("nome")
  end
  def show
    @restaurante = Restaurante.find(params[:id])
  end
  def last
    @restaurante = Restaurante.last
  end
  def new
    @restaurante = Restaurante.new
  end
  def create
    @restaurante = Restaurante.new(params[:restaurante])
    if @restaurante.save
      redirect_to(:action => "index") 
    else
      render :action => "new"
    end
  end
  def edit
    @restaurante = Restaurante.find(params[:id])
  end
  def update
    @restaurante = Restaurante.find(params[:id])
    if @restaurante.update_attributes(params[:restaurante])      
     redirect_to(:action => "show", :id => @restaurante)
    else
      render :action => "edit"
    end
  end
  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy
    redirect_to(:action => "index")
  end
  def auto_complete_for_restaurante_nome
    #Obtemos os restaurnate que atendem o clietérios
    @restaurante = Restaurante.find(:all,:conditions => ['UPPER(nome) like ?',"%#{params[:cliente][:nome]}%"]);
    #Rendereizr dinamicamente o recurso auto-complete
    render:inline => "<%auto_complete_result(@restaurante,'nome')%>"
  end
end
