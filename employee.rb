class Employee
  attr_reader :name, :email, :phone, :salary, :review_text, :review, :eligible

  def initialize(name:, email:, phone:, salary:)
    @email = email if email =~ /[a-z1-9]+@[a-z1-9]+\.[a-z][a-z][a-z]/
    @phone = phone if phone =~ /(\d{3})\)?[\s-]?\d{3}[\s-]?\d{4}/
    @name = name
    @salary = salary.to_f
    @review_text = ""
    @review = true
    @review_based_on_text = ""
  end

  def add_review(review_text)
    @review_text += review_text if review_text.class == String
    parse_review
  end

  def positive_review(bool)
    @review = bool
  end

  def give_raise(amount)
    @salary += amount if @review
  end

  def give_raise_without_restriction(amount)
    @salary += amount
  end


  def private parse_review
    bad_count = []
    good_count = []
    the_bad = [/hard/, /uneasy/, /horrible/, /negative/, /not/, /difficult/, /confusion/, /less/, /inadequate/, /tension/, /terrible/, /late/, /sloppy/, /lazy/, /inefficient/]
    the_good = [/easy/, /nice/, /competent/, /efficient/, /team player/, /hard/, /clear/, /friendly/, /fantastic/, /joy/, /clean/, /timely/, /]
    the_bad.each do |re|
      @review_text.scan(re) << bad_count
    end
    puts bad_count
  end


end
