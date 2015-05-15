require 'minitest/autorun'
require 'minitest/pride'
require './employee.rb'
require './department.rb'

class EmployeeReview < Minitest::Test

  def test_employee_object
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    assert dave
  end

  def test_department_object
    logistics = Department.new("Logistics")
    assert logistics
  end

  def test_add_employee_to_department
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    logistics = Department.new("Logistics")
    logistics.add_employee(dave)
    assert_equal [dave], logistics.employees
  end

  def test_employee_takes_4
    assert_raises(ArgumentError) do
      Employee.new("karl", "karl@karl.com", "545-454-5555")
    end
  end

  def test_access_employee_email_phone_salary
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    assert_equal "dave@dave.com", dave.email
    assert_equal "336-336-3636", dave.phone
    assert_equal 70000, dave.salary

  end

  def test_get_employee_and_dept_name
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    logistics = Department.new("Logistics")
    assert_equal "Dave", dave.name
    assert_equal "Logistics", logistics.name
  end


  def test_add_total_salary
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    karl = Employee.new(name: "karl", email: "karl@karl.com", phone: "545-454-5555", salary: 50000)
    logistics = Department.new("Logistics")
    logistics.add_employee(dave)

    assert_equal 70000, logistics.total_salary

    logistics.add_employee(karl)
    assert_equal 120000, logistics.total_salary
  end

  def test_add_review
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)

    assert dave.add_review("Dave is a bad worker")
  end

  def test_review_must_be_string
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)

    assert dave.add_review("Dave is a bad worker")
    refute dave.add_review(["no", "thanks"])

  end

  def test_get_employee_review
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    dave.add_review("Dave is a bad worker")

    assert "Dave is a bad worker", dave.review_text
  end

  def test_employee_review_satisifactory
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    dave.positive_review(true)
    karl = Employee.new(name: "karl", email: "karl@karl.com", phone: "545-454-5555", salary: 50000)
    karl.positive_review(false)

    assert dave.review
    refute karl.review
  end

  def test_give_raise
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    assert dave.give_raise(5000)
  end

  def test_decide_raise
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    dave.positive_review(true)
    karl = Employee.new(name: "karl", email: "karl@karl.com", phone: "545-454-5555", salary: 50000)
    karl.positive_review(false)

    assert dave.give_raise(5000.82)
    refute karl.give_raise(200)
  end

  def test_give_dept_raise
    logistics = Department.new("Logistics")

    refute logistics.give_raise(10000)

    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    dave.positive_review(false)
    logistics.add_employee(dave)

    refute logistics.give_raise(100.02)

    karl = Employee.new(name: "karl", email: "karl@karl.com", phone: "545-454-5555", salary: 50000)
    karl.positive_review(true)
    logistics.add_employee(karl)

    assert logistics.give_raise(100.02)

  end

  def test_employee_in_dept_raise
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    dave.positive_review(true)
    karl = Employee.new(name: "karl", email: "karl@karl.com", phone: "545-454-5555", salary: 50000)
    karl.positive_review(false)
    mark = Employee.new(name: "Mark", email: "mark@mark.com", phone: "545-444-5555", salary: 30000)
    mark.positive_review(true)
    logistics = Department.new("Logistics")
    logistics.add_employee(karl)
    logistics.add_employee(dave)
    logistics.add_employee(mark)
    logistics.give_raise(10000.24)

    assert_in_delta 75000.12, dave.salary, 0.01
    assert_in_delta 50000, karl.salary, 0.01
    assert_in_delta 35000.12, mark.salary, 0.01
  end

  def test_email_validation
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    karl = Employee.new(name: "karl", email: "karl@karl.om", phone: "545-454-5555", salary: 50000)
    mark = Employee.new(name: "Mark", email: "markmark.com", phone: "545-444-5555", salary: 30000)

    assert_equal "dave@dave.com", dave.email
    assert_equal nil, karl.email
    assert_equal nil, mark.email

  end

  def test_phone_validation
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "444-333-33d333", salary: 70000)
    karl = Employee.new(name: "karl", email: "karl@karl.om", phone: "545-454-5555", salary: 50000)
    mark = Employee.new(name: "Mark", email: "markmark.com", phone: "545-4434-5555", salary: 30000)

    assert_equal nil, mark.phone
    assert_equal nil, dave.phone
    assert_equal "545-454-5555", karl.phone
  end

  def test_complete_example
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "444-333-33d333", salary: 70000)
    karl = Employee.new(name: "karl", email: "karl@karl.om", phone: "545-454-5555", salary: 50000)
    mark = Employee.new(name: "Mark", email: "markmark.com", phone: "545-4434-5555", salary: 30000)

    logistics = Department.new("Logistics")
    customer_service = Department.new("Customer Service")

    logistics.add_employee(dave)

    customer_service.add_employee(karl)
    customer_service.add_employee(mark)
    karl.positive_review(false)
    mark.positive_review(true)

    customer_service.give_raise(1000.82)

    assert_in_delta 31000.82, mark.salary, 0.01
    assert_in_delta 50000.00, karl.salary, 0.01

    assert_in_delta 81000.82, customer_service.total_salary, 0.01

    joey = Employee.new(name: "joey", email: "joey@joe.net", phone: "444-333-3333", salary: 30000)

    customer_service.add_employee(joey)

    assert_in_delta 111000.82, customer_service.total_salary, 0.01

  end

  def test_dept_give_raise_with_block
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    dave.positive_review(true)
    karl = Employee.new(name: "karl", email: "karl@karl.com", phone: "545-454-5555", salary: 50000)
    karl.positive_review(false)
    mark = Employee.new(name: "Mark", email: "mark@mark.com", phone: "545-444-5555", salary: 30000)
    mark.positive_review(true)
    logistics = Department.new("Logistics")
    logistics.add_employee(karl)
    logistics.add_employee(dave)
    logistics.add_employee(mark)

    logistics.give_raise(5132.55) do |employee|
      employee.salary < 50000
    end

    assert_in_delta 35132.55, mark.salary, 0.01
    assert_in_delta 50000, karl.salary, 0.01
  end

  def test_raise_without_restriction
    dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
    dave.positive_review(true)
    karl = Employee.new(name: "karl", email: "karl@karl.com", phone: "545-454-5555", salary: 50000)
    karl.positive_review(false)

    dave.give_raise_without_restriction(100.87)
    karl.give_raise_without_restriction(188.12)

    assert_in_delta 70100.87, dave.salary, 0.01
    assert_in_delta 50188.12, karl.salary, 0.01

  end



end
