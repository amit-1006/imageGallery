class RootController < ApplicationController
    def home
        @images=Image.all.paginate(page:params[:page],per_page:9)
        render 'home'
    end

    def create
        render 'create'
    end

    def add
        @image=Image.new
        @image.title=params[:title]
        @image.url=params[:url]
        @image.description=params[:description]
        if @image.title=="" || @image.url=="" || @image.description==""
            @message="All fields are mandatory!!"
            render 'create'
        else
            @image.save
            @images=Image.all.paginate(page:params[:page],per_page:9)
            redirect_to('/home')
        end
        
    end

    def show
        @image=Image.find(params[:id])
        @title=@image.title
        @url=@image.url
        @description=@image.description
        #render json:@image
        render "view"
    end

    def editForm
        @image=Image.find(params[:id])
        @title=@image.title
        @url=@image.url
        @description=@image.description
        render "editForm"
    end

    def updateForm
        @image=Image.find(params[:id])
        @image.title=params[:title]
        @image.url=params[:url]
        @image.description=params[:description]
        @image.save
        @images=Image.all.paginate(page:params[:page],per_page:9)
        redirect_to('/home')
    end

    def delete
        @image=Image.find(params[:id])
        @image.destroy
        @images=Image.all.paginate(page:params[:page],per_page:9)
        redirect_to('/home')

    end

    def search
        @query=params[:query]
        @images=Image.where("images.title LIKE ?",["%#{@query}%"]).paginate(page:params[:page],per_page:9)
        render 'home'
    end

end
