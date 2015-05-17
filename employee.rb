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
    the_good = [/pleasure/, /implements/, /easy/, /nice/, /competent/, /efficient/,
                /team player/, /hard/, /clear/,
                /friendly/, /fantastic/, /joy/, /clean/,
                /timely/, /professional/, /amazing/,
                /fantastic/, /consistent/, /satisfied/,
                /effective/, /impressed/, /brilliant/,
                /delight/, /delightful/, /distinguished/,
                /energized/, /excellent/, /perfect/,
                /plentiful/, /skilled/, /skillful/,
                /willing/, /wonderful/, /weel/, /zealous/,
                /merit/, /vital/, /valued/, /super/,
                /superb/, /supporting/, /upbeat/,
                /satisfactory/, /trusting/, /terrific/,
                /thorough/, /quality/, /fabulous/,
                /celebrated/, /commend/, /creative/,
                /beneficial/, /benefit/, /lively/]

    the_bad = [/hard/, /uneasy/, /horrible/, /negative/,
                /not/, /difficult/, /confusion/, /less/,
                /inadequate/, /tension/, /terrible/, /late/,
                /sloppy/, /lazy/, /inefficient/,
                /unprofessional/, /but/, /less/,
                /consequences/, /abysmal/, /adverse/,
                /apathetic/, /appaling/, /awful/, /bad/,
                /callous/, /confused/, /damag/, /in/,
                /missing/, /lousy/, /fault/, /fail/,
                /no/, /hostile/, /offense/, /offensive/,
                /severe/, /sorry/, /stress/, /stressful/,
                /vice/, /worthless/, /zero/, /un/, /pess/, /over/,
                /under/, /less/]

    the_ugly = [/(extremely|very)\sbad/, /un+/]
    the_nice = [/(extremely|very)\sgood/, /(very)\sgood/, /out+/]

    the_bad_count = []
    the_good_count = []

    the_bad.each do |re|
      the_bad_count << @review_text[re] if !@review_text[re].nil?
    end

    the_good.each do |re|
      the_good_count << @review_text[re] if !@review_text[re].nil?
    end

    the_ugly.each do |re|
      the_bad_count << @review_text[re] if !@review_text[re].nil?
    end

    the_nice.each do |re|
      the_good_count << @review_text[re] if !@review_text[re].nil?
    end

    if the_bad_count.length > the_good_count.length
      @review_based_on_text = false
    else
      @review_based_on_text = true
    end

  end


end
