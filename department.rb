
class Department
  attr_reader :name, :employees, :total_salary

  def initialize(name)
    @name = name
    @employees = []
    @total_salary = 0
  end

  def add_employee(employee_object)
    @employees << employee_object
    @total_salary += employee_object.salary
  end

  def give_raise(amount)
    amount = amount[1..-1].to_f
    emp_getting_raise = 0
    @employees.each do |e|
      emp_getting_raise += 1 if e.review
    end
    divided_amount = amount / emp_getting_raise unless emp_getting_raise == 0
    @employees.each {|e| e.give_raise(divided_amount)}
    @total_salary += amount if emp_getting_raise > 0
  end

end
