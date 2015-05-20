require './db_setup.rb'

class Department < ActiveRecord::Base
  has_many :employees

  def add_employee(employee)
    employees << employee
  end

  def give_raise(amount)
    emp_getting_raise = 0

    if block_given?
      eligible_employees = []
      employees.each do |employee|
        if yield(employee)
          eligible_employees << employee
        end
      end
      amount /= eligible_employees.length
      eligible_employees.each do |employee|
        employee.give_raise_without_restriction(amount)
      end

    else
      employees.each do |e|
        emp_getting_raise += 1 if e.review
      end
      divided_amount = amount / emp_getting_raise unless emp_getting_raise == 0
      employees.each {|e| e.give_raise(divided_amount)}
    end
  end

  def salary
    self.salary = employee.salary
  end
end
