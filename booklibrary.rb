class Book
    attr_accessor :id,:title,:author,:description
    def initialize(id,title,author,description)
        @id=id
        @title=title
        @author=author
        @description=description
    end

  def to_s
    "ID: #{id}, Title: #{title}, Author: #{author}, Description: #{description}"
  end

end


class Book_library
    def initialize
        @books=[]
        @next_id=1
    end
    
    def add_books(title,author,description)
      book=Book.new(@next_id,title,author,description)
      @books<<book
      @next_id+=1
    end

    def find_book_by_id(id)
        @books.find{|book| book.id==id}
    end

    def get_all_books
        @books
    end

    def update_book(id,title,author,description)
        book=find_book_by_id(id)
        return unless book
        book.title=title
        book.author=author
        book.description=description
    end
    
    def delete_book_by_id(id)
        book=find_book_by_id(id)
        @books.delete(book)
    end
    def display_menu
        puts "Book Library Menu:"
        puts "1. Add a book"
        puts "2. View all books"
        puts "3. Find a book by ID"
        puts "4. Update a book"
        puts "5. Delete a book"
        puts "0. Exit"
        puts "Enter your choice:"
    end
    def menu
        loop do
          display_menu
          num=gets.chomp.to_i
            case num
             when 1
                puts "Enter the book details:"
                print "Title: "
                title = gets.chomp
                print "Author: "
                author = gets.chomp
                print "Description: "
                description= gets.chomp

                book = add_books(title, author, description)
                 puts "Book added: #{book}"
             when 2
                puts "All Books:"
                get_all_books.each { |book| puts book }
                
             when 3
                print "Enter the book ID: "
                id = gets.chomp.to_i
                book = find_book_by_id(id)
                puts book ? "Found book: #{book}" : "Book not found."
             when 4
                print "Enter the book ID to update: "
                id = gets.chomp.to_i
                book = find_book_by_id(id)
                if book
                  puts "Enter the updated details:"
                  print "Title: "
                  title = gets.chomp
                  print "Author: "
                  author = gets.chomp
                  print "Genre: "
                  genre = gets.chomp
                  update_book(id, title, author, genre)
                  puts "Book updated: #{book}"
                else
                  puts "Book not found."
                end
             when 5
                print "Enter the book ID to delete: "
                id = gets.chomp.to_i
                if find_book_by_id(id)
                  delete_book_by_id(id)
                  puts "Book deleted."
                else
                  puts "Book not found."
                end
             when 0
                puts 'exit'
             break
             else
                puts 'invalid number'
            end
        end
    end
end

library = Book_library.new
library.menu
