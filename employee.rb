class Employee
  attr_reader :name, :email, :phone, :salary, :review_text, :review, :review_based_on_text

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


  def parse_review
    the_bad = [/hard/, /uneasy/, /horrible/, /negative/, /not/, /difficult/, /confusion/, /less/, /inadequate/, /tension/, /terrible/, /late/, /sloppy/, /lazy/, /inefficient/, /unprofessional/, /but/]
    the_good = [/easy/, /nice/, /competent/, /efficient/, /team player/, /hard/, /clear/, /friendly/, /fantastic/, /joy/, /clean/, /timely/, /professional/, /amazing/, /fantastic/]
    the_bad_count = the_bad.each do |re|
      @review_text.scan(re)
    end
    the_good_count = the_good.each do |re|
      @review_text.scan(re)
    end
    puts the_bad_count
    puts the_good_count
    if the_bad_count.length > the_good_count.length_count
      @review_based_on_text = false
    else
      @review_based_on_text = true
    end
  end


end
