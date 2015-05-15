class Employee
  attr_reader :name, :email, :phone, :salary, :review_text, :review

  def initialize(name:, email:, phone:, salary:)
    @email = email if email =~ /[a-z1-9]+@[a-z1-9]+\.[a-z][a-z][a-z]/
    # @phone = phone if phone =~ /
    @name = name
    @phone = phone
    @salary = salary.to_f
    @review_text = ""
    @review = ""
  end

  def add_review(review_text)
    @review_text += review_text if review_text.class == String
  end

  def positive_review?(bool)
    @review = bool
  end

  def give_raise(amount)
    @salary += amount.to_f if @review
  end

end
