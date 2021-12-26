require('pry')

class Volunteer
  attr_accessor :id, :name
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_
  end

  def save

  end
end
