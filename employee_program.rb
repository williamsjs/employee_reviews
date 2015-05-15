require './employee.rb'
require './department.rb'



dave = Employee.new(name: "Dave", email: "dave@dave.com", phone: "336-336-3636", salary: 70000)
dave.positive_review?(true)
karl = Employee.new(name: "karl", email: "karl@karl.com", phone: "545-454-5555", salary: 50000)
karl.positive_review?(false)
mark = Employee.new(name: "Mark", email: "mark@mark.com", phone: "545-444-5555", salary: 30000)
mark.positive_review?(true)
logistics = Department.new("Logistics")
logistics.add_employee(karl)
logistics.add_employee(dave)
logistics.add_employee(mark)

logistics.give_raise("$10000") do |employee|
  employee.salary < 50000
end
