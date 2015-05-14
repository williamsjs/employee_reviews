class Employee
  attr_reader :name, :email, :phone, :salary, :review, :satisfactory

  def initialize(name:, email:, phone:, salary:)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review = ""
    @satisfactory = ""
  end

  def add_review(review_text)
    @review += review_text if review_text.class == String
  end

  def satisfactory(bool)
    bool
  end

end
