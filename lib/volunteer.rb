require('pry')

class Volunteer
  attr_accessor :id, :name
  
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :id => id}))
    end
    volunteers
  end

  def save

  end
end
