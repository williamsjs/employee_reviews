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
    @review_text += review_text if review_text.class == String
  end

  def positive_review?(bool)
    @review = bool
  end

  def give_raise(amount)
    @salary += amount if @review
  end

  def is_a_valid_email?(email)
  (email =~ /^(([A-Za-z0-9]*\.+*_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\+)|([A-Za-z0-9]+\+))*[A-Z‌​a-z0-9]+@{1}((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,4}$/i)
  end



end
