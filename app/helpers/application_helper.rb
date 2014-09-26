module ApplicationHelper

    def full_title(page_title)
        base_title = "Library"
        if page_title.empty?
            base_title
        else
            "#{base_title} | #{page_title}"
        end
    end

    def get_book_information(isbn)
        json = get_json(isbn)
        result = Hash::new
        result['title'] = json['items'][0]['volumeInfo']['title']
        result['subtitle'] = json['items'][0]['volumeInfo']['subtitle']
        result['authors'] = json['items'][0]['volumeInfo']['authors'].to_s
        result['isbn_10'] = json['items'][0]['volumeInfo']['industryIdentifiers'][0]['identifier']
        result['isbn_13'] = json['items'][0]['volumeInfo']['industryIdentifiers'][1]['identifier']
        begin
            result['image_link'] = json['items'][0]['volumeInfo']['imageLinks']['thumbnail']
        rescue
        end
        result['published_date'] = json['items'][0]['volumeInfo']['publishedDate']
        result
    end

    def get_json(isbn)
        url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn
        uri = URI.parse(url)
        json = Net::HTTP.get(uri)
        return JSON.parse(json)
    end

    def is_isbn13(isbn)
        if isbn[0..3] == "978"
            return true
        else
            return false
        end
    end

    def isbn10_to_13(isbn10)
        isbn13 = "978#{isbn10[0..8]}"
        #チェックデジット計算用
        check_digit = 0
        isbn13.split(//).each_with_index do |chr, idx|
            #Integer#even?はActiveSupportによる拡張
            check_digit += chr.to_i * (idx.even? ? 1 : 3)
        end
        #総和を10で割ったものを10から引き、10の場合は0にする
        check_digit = (10 - (check_digit % 10)) % 10
        return "#{isbn13}#{check_digit}"
    end

    def isbn13_to_10(isbn13)
        isbn10 = isbn13[3..11]
        check_digit = 0
        isbn10.split(//).each_with_index do |chr, idx|
            check_digit += chr.to_i * (10 - idx)
        end
        check_digit = 11 - (check_digit % 11)
        #計算結果が 10 になった場合、10 の代わりに X（アルファベットの大文字）を用いる。
        #また、11 になった場合は、0 となる。
        case check_digit
        when 10 then check_digit = "X"
        when 11 then check_digit = 0
        end
        return "#{isbn10}#{check_digit}"
    end
end
