#encoding: utf-8
class Qualificacao < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :cliente_id, :restaurante_id, :nota, :valor_gasto
  validates_presence_of :nota, :message => " - deve ser preenchido"
  validates_presence_of :valor_gasto, :message => " - deve ser preenchido"
  validates_numericality_of :nota, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10, :message => " - deve ser uma nota entre 0 e 10"
  validates_numericality_of :valor_gasto, :greater_than => 0, :message => " - deve ser um número maior que 0"
  validates_presence_of :cliente_id, :restaurante_id
  validates_associated :cliente, :restaurante
  belongs_to :cliente
  belongs_to :restaurante
  has_many :comentarios, :as => :comentavel
end
