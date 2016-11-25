class PersonController < ApplicationController

    # GET /person
    def index
        @people = Person.all

        respond_to do |f|
            f.html
            f.json { render :json => @people }
        end
    end

    # GET /person/1
    def show
        @person = Person.find(params[:id])

        respond_to do |f|
            f.html
        end
    end

    # GET /person/new
    def new
        @person = Person.new

        respond_to do |f|
            f.html
        end
    end

    # POST /person
    def create
        @person = Person.create(person_params)

        if @person.save
            respond_to do |f|
                f.html { redirect_to action: 'index' }
            end
        else
            render 'new'
        end
    end

    # DELETE /person/1
    def destroy
        @person = Person.find(params[:id])
        @person.destroy

        respond_to do |f|
            f.html { redirect_to action: 'index' }
        end
    end

    private
        def person_params
            params.require(:person).permit(:name, :age)
        end
end
