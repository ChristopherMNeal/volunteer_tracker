require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require 'pg'

DB = PG.connect({:dbname => "volunteer_tracker"})

get ('/') do
  redirect to('/projects')
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post('/projects') do
  title = params[:title]
  project = Project.new({:title => title, :id => nil})
  project.save
  redirect to('/projects')
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  erb(:edit_project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.update({:title => params[:title], :id => @project.id})
  redirect to('/projects')
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @project.delete
  redirect to('/projects')
end

get('/projects/:id/volunteers/:volunteer_id') do
  @project = Project.find(params[:id].to_i)
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  erb(:volunteer)
end

post('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i)
  volunteer = Volunteer.new({:name => params[:volunteer_name], :project_id => @project.id, :id => nil})
  volunteer.save
  erb(:project)
end