require('pry')

class Project
  attr_accessor :id, :name
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end
end