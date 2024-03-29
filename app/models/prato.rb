#encoding: utf-8
class Prato < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :nome
  validates_presence_of :nome, :message => " - deve ser preenchido"
  validates_uniqueness_of :nome, :message => " - nome já existe"
  has_and_belongs_to_many :restaurantes
  validate :validate_presence_of_more_than_one_restaurante
  has_one :receita
  private
    def validate_presence_of_more_than_one_restaurante      
      #errors.add("restaurantes", "deve haver ao menos um restaurante") if Restaurante.Any? == false
    end    
end
