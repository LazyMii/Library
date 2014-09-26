class ImagesController < ApplicationController
    def index

    end

    def new

    end

    def create

    end

    def show_image
        upload_file = image_params[:file]
        @image = Image.new
        if upload_file != nil
            @image.isbn
            @image.file = upload_file
        end

    end
end
