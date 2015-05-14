class Employee
  attr_reader :name, :email, :phone, :salary, :review_text, :review

  def initialize(name:, email:, phone:, salary:)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @review_text = ""
    @review = ""
  end

  def add_review(review_text)
    review_text += review_text if review_text.class == String
  end

  def positive_review?(bool)
    review = bool
  end

end
