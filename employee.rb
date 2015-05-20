require './db_setup.rb'


class Employee <ActiveRecord::Base
  belongs_to :department

  def add_review(review_text)
    self.review_text = review_text if review_text.class == String
  end

  def positive_review(bool)
    self.review = bool
  end

  def give_raise(amount)
    self.salary += amount if self.review
  end

  def give_raise_without_restriction(amount)
    self.salary += amount
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
      the_bad_count << self.review_text[re] if !self.review_text[re].nil?
    end

    the_good.each do |re|
      the_good_count << self.review_text[re] if !self.review_text[re].nil?
    end

    the_ugly.each do |re|
      the_bad_count << self.review_text[re] if !self.review_text[re].nil?
    end

    the_nice.each do |re|
      the_good_count << self.review_text[re] if !self.review_text[re].nil?
    end

    if the_bad_count.length > the_good_count.length
      self.review_based_on_text = false
    else
      self.review_based_on_text = true
    end

  end


end
