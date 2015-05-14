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

end
