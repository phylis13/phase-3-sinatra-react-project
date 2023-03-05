class PetController < AppController

    set :views, './app/views'

    # @method: Display a small welcome message
    get '/hello' do
        "Our very first controller"
    end

    # @method: Add a new TO-DO to the DB
    post '/pets/create' do
        begin
            pet = Pet.create( self.data(create: true) )
            json_response(code: 201, data: pet)
        rescue => e
            json_response(code: 422, data: { error: e.message })
        end
    end

    # @method: Display all todos
    get '/pets' do
        pets = Pet.all
        json_response(data: pets)
    end

    # @view: Renders an erb file which shows all TODOs
    # erb has content_type because we want to override the default set above
    get '/' do
        @pets = Pet.all.map { |pet|
          {
            pet: pet,
            badge: pet_status_badge(pet.status)
          }
        }
        @i = 1
        erb_response :pets
    end

    # @method: Update existing TO-DO according to :id
    put '/pets/update/:id' do
        begin
            pet = Pet.find(self.pet_id)
            pet.update(self.data)
            json_response(data: { message: "Pet updated successfully" })
        rescue => e
            json_response(code: 422 ,data: { error: e.message })
        end
    end

    # @method: Delete TO-DO based on :id
    delete '/pets/destroy/:id' do
        begin
            pet = Pet.find(self.pet_id)
            pet.destroy
            json_response(data: { message: "pet deleted successfully" })
        rescue => e
          json_response(code: 422, data: { error: e.message })
        end
    end


    private

    # @helper: format body data
    def data(create: false)
        payload = JSON.parse(request.body.read)
        if create
            payload["createdAt"] = Time.now
        end
        payload
    end

    # @helper: retrieve to-do :id
    def pet_id
        params['id'].to_i
    end

    # @helper: format status style
    def pet_status_badge(status)
        case status
            when 'CREATED'
                'bg-info'
            when 'ONGOING'
                'bg-success'
            when 'CANCELLED'
                'bg-primary'
            when 'COMPLETED'
                'bg-warning'
            else
                'bg-dark'
        end
    end


end