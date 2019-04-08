require('minitest/autorun')
require('minitest/rg')
require_relative('../library')

class TestLibrary < MiniTest::Test

  def setup
    @example = [
      {
        title: "Lord of the Rings",
        rental_details:
        {
          student_name: "Jeff",
          date: "08/04/19"
        }
      },
      {
        title: "Men at Arms",
        rental_details:
        {
          student_name: "Jon",
          date: "11/09/01"
        }
      },
      {
        title: "The Book of Mormon",
        rental_details:
        {
          student_name: "James",
          date: "17/06/20"
        }
      }
    ]


  end


  def test_get_books
    books = Library.new(@example)
    assert_equal(@example, books.inventory)
  end

  def test_find_book_by_title__book_exists
    books = Library.new(@example)
    result = books.find_book_by_title("Men at Arms")
    assert_equal(@example[1], result)
  end

  def test_find_book_by_title__book_does_not_exist
    books = Library.new(@example)
    result = books.find_book_by_title("words")
    assert_equal(nil, result)
  end

  def test_find_rental_details_by_title__book_exists
    books = Library.new(@example)
    result = books.find_rental_details_by_title("The Book of Mormon")
    assert_equal(@example[2][:rental_details], result)
  end

  def test_find_rental_details_by_title__book_does_not_exist
    books = Library.new(@example)
    result = books.find_rental_details_by_title("more words")
    assert_equal(nil, result)
  end

  def test_add_book
    books = Library.new(@example)
    books.add_book("Harry Potter")
    result = books.find_book_by_title("Harry Potter")
    assert_equal("Harry Potter", result[:title] )
  end

  def test_add_book_details
    books = Library.new(@example)
    books.add_book_details("Harry Potter", "Andrew", "01/01/01")
    result = books.find_book_by_title("Harry Potter")
    assert_equal(@example[3], result)
  end

end
