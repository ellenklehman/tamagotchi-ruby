require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each() { |file| require file }

get '/' do
  @pet = Tamagotchi.new()
  erb(:index)
end

post '/pets' do
  name = params['name']
  @pet = Tamagotchi.new({name: name})
  if @pet.save()
    redirect to("/pets/#{@pet.id}")
  else
    erb(:index)
  end
end

get '/pets/:id' do
  id = params["id"].to_i()
  @pet = Tamagotchi.find(id)
  if @pet.is_alive
    erb(:pet)
  else
    erb(:dead)
  end
end

post '/check' do
  id = params["id"].to_i()
  @pet = Tamagotchi.find(id)
  @pet.time_passes()
  redirect to("pets/check/#{@pet.id}")
end

get '/pets/check/:id' do
  id = params["id"].to_i()
  @pet = Tamagotchi.find(id)
  erb(:check)
end

post '/feed' do
  id = params["id"].to_i()
  @pet = Tamagotchi.find(id)
  @pet.feed()
  redirect to("/pets/#{@pet.id}")
end

post '/play' do
  id = params["id"].to_i()
  @pet = Tamagotchi.find(id)
  @pet.play()
  redirect to("/pets/#{@pet.id}")
end

post '/sleep' do
  id = params["id"].to_i()
  @pet = Tamagotchi.find(id)
  @pet.sleep_time()
  redirect to("/pets/#{@pet.id}")
end
