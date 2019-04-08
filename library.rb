class Library

  def initialize(inventory)
    @inventory = inventory
  end

  attr_reader :inventory

  def find_book_by_title(search_title)
    for book in @inventory
      return book if book[:title] == search_title
    end
    return nil
  end

  def find_rental_details_by_title(search_title)
    for book in @inventory
      return book[:rental_details] if book[:title] == search_title
    end
    return nil
  end

  def add_book(new_title)
    new_book = {
      title: new_title,
      rental_details: {
        student_name: "",
        date: ""
      }
    }
    @inventory.push(new_book)
  end

  def add_book_details(title, student_name, date)
      if find_book_by_title(title) != nil
        @inventory[title.index][:rental_details][:student_name] = student_name
        @inventory[title.index][:rental_details][:date] = date
      end
  end
end
