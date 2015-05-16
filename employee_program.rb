the_bad = [/hard/, /uneasy/, /horrible/, /negative/,
            /not/, /difficult/, /confusion/, /less/,
            /inadequate/, /tension/, /terrible/, /late/,
            /sloppy/, /lazy/, /inefficient/,
            /unprofessional/, /but/, /less/,
            /consequences/, /abysmal/, /adverse/,
            /apathetic/, /appaling/, /awfule/, /bad/,
            /callous/, /confused/, /damag/,
            /missing/, /lousy/, /fault/, /faulty/, /fail/,
            /no/, /hostile/, /offense/, /offensive/,
            /severe/, /sorry/, /stress/, /stressful/,
            /vice/, /worthless/, /zero/, /un/, /pess/]

the_good = [/Xavier/, /SciMed/, /pleasure/, /knocks/, /tasks/, /assigned/, /implements/, /easy/, /nice/, /competent/, /efficient/,
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
            /thorough/, /quality/, /fabulout/,
            /celebrated/, /commend/, /creative/,
            /beneficial/, /benefit/, /lively/]

text = "Xavier SciMed pleasure knocks blah blah blah"

the_good_count = []

the_good.each do |re|
  the_good_count << text[re] if !text[re].nil?
end

puts the_good_count
