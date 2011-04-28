class Main
  @@answers = {}
  
  def self.show_questions
    self.methods.each do | method |
        if method.match(/^ask_/)
          @@answers[method] = eval("self.#{method}")
        end
    end
  end
  
  def self.answers
    @@answers
  end
  
  private 
  
  def self.ask_hire_me
    puts "Will Headshift hire me? [yes|no]"
    gets.chomp
  end
  
  def self.ask_lots_of_money
    puts "Will Headshift pay me a lots of money to make me rich? [yes|no]"
    gets.chomp
  end
  
  def self.ask_patience_with_my_english_level
    puts "Will Headshift be patient with my English level? [yes|no]"
    gets.chomp
  end

end

if __FILE__ == $PROGRAM_NAME
   Main.show_questions
   # I spent a long time finding how to run rspec from ruby code 
   # like test/unit - Test::Unit::UI::Console::TestRunner.run(MySuite.new(MyTestCase))
   # Unfortunately, I didn't find it
   
   # My idea here was to create a funny code. Similar this one https://github.com/praekelt/careers/raw/master/software_engineer.py
   # After the prompt I wanted to run the test suite ../spec/main_spec.rb
   
end