require('minitest/autorun')
require('minitest/rg')
require_relative('../codeclan_student')

class TestCodeclanStudent < MiniTest::Test

  def test_get_student_name
    student = CodeclanStudent.new("James", "E30")
    assert_equal("James", student.get_student_name)
  end

  def test_get_student_cohort
    student = CodeclanStudent.new("Jon", "E30")
    assert_equal("E30", student.get_student_cohort)
  end

  def test_set_student_name
    student = CodeclanStudent.new("James", "E30")
    student.set_student_name("Chuck")
    assert_equal("Chuck", student.get_student_name)
  end

  def test_set_student_cohort
    student = CodeclanStudent.new("James", "E30")
    student.set_student_cohort("E45")
    assert_equal("E45", student.get_student_cohort)
  end

  def test_speak
    student = CodeclanStudent.new("James", "E30")
    assert_equal("I can talk", student.speak)
  end

  def test_favourite_language
    student = CodeclanStudent.new("James", "E30")
    favourite_language = student.favourite_language("Ruby")
    assert_equal("I love Ruby", favourite_language)
  end
end
