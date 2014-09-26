require 'open-uri'
module BooksHelper
    def image_link_for(image)

        # send_dataはバイナリファイルをブラウザに表示するため
        # http://railsdoc.com/references/send_data
        send_data(image, :type => 'image/jpeg', :disposition => 'inline')
    end
end
