class PetController < Sinatra::Base

    set :views, './app/views'


    get '/hello' do
        "Welcome to my first controller"
    end

    post '/pets/create' do
        data = JSON.parse (request.body.read)
        #rescue block
        begin
        #approach 1 (individual columns)
        # title = data ["title"]
        # description =data["description"]
        # todo = Todo.create(title: title, description: description, createdAt: today)
        # todo.to_json

        #approach 2 (hash of columns)
        today = Time.now
        data["createdAt"] = today
        pet = Pet.create(data)
        [201, pet.to_json]


            
        rescue => exception
            [422, {
                error: exception.message
            }.to_json]
        end
    end

    get '/pets' do

        pets = Pet.all
        [200, pets.to_json]

    end

    get '/view/pets' do
        @pets = Pet.all
        erb :pets

    end

    put 'pets/update/:id' do
        #rescue bloc
        begin
        data = JSON.parse (request.body.read)
        pet_id = params['id'].to_i
        pet = Pet.find(pet_id)
        pet.update(data)
        {message: "Pet updated successfully"}.to_json 
        rescue => e
            {
                error: e.message
            }.to_json
        end

    end

    delete '/pets/destroy/:id' do
        begin
            pet_id = params['id'].to_i
            pet = Pet.find(pet_id)
            pet.destroy
            rescue => e
                {error: e.message}.to_json

            end

    end



end