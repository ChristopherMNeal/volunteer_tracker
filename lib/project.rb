require('pry')

class Project
  attr_accessor :id, :title

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_classes = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def save
    returned_id = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = returned_id.first.fetch("id").to_i
  end


end