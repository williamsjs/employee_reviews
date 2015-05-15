
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
    emp_getting_raise = 0

    if block_given?
      eligible_employees = []
      @employees.each do |employee|
        if yield(employee)
          eligible_employees << employee
        end
      end
      amount /= eligible_employees.length
      eligible_employees.each do |employee|
        employee.give_raise_without_restriction(amount)
      end

    else
      @employees.each do |e|
        emp_getting_raise += 1 if e.review
      end
      divided_amount = amount / emp_getting_raise unless emp_getting_raise == 0
      @employees.each {|e| e.give_raise(divided_amount)}
      @total_salary += amount if emp_getting_raise > 0
    end

  end

end
