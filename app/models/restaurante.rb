#encoding: utf-8
class Restaurante < ActiveRecord::Base  
  attr_accessible :endereco, :especialidade, :nome
  has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_presence_of :nome, :message => "deve ser preenchido"
  validates_presence_of :endereco, :message => "deve ser preenchido"
  validates_presence_of :especialidade, :message => "deve ser preenchido"
  
  validates_uniqueness_of :nome, :message => "nome já existe"
  validates_uniqueness_of :endereco, :message => "endereço já cadastrado"
  
  validate :primeira_letra_maiuscula
  
  has_many :qualificacoes
  has_and_belongs_to_many :pratos
  has_many :comentarios, :as => :comentavel
  private
    def primeira_letra_maiuscula
      errors.add(:nome, "primeira letra deve ser maíuscula") unless nome =~ /[A-Z].*/
    end
end
