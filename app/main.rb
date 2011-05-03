class Main  
  def show_questions
    @answers = {}
    public_methods.each do | method |
        if method.match(/^ask_/)
          @answers[method] = eval("self.#{method}") == 'yes'
        end
    end
  end
  
  def answers
    @answers
  end
  
  def ask_hire_me
    puts '****************************************'
    puts ' Will Headshift hire me? [yes|no]'
    puts '****************************************'
    gets.chomp
  end
  
  def ask_lots_of_money
    puts '****************************************'
    puts ' Will Headshift pay me a lots of money to make me rich? [yes|no]'
    puts '****************************************'
    gets.chomp
  end
  
  def ask_patience_with_my_english_level
    puts '****************************************'
    puts ' Will Headshift be patient with my English level? [yes|no]'
    puts '****************************************'
    gets.chomp
  end
  
  def serialize
    File.open('main.yaml', 'w') do |out|
      YAML.dump(self, out )
    end
  end
  
  def self.unserialize
    main_file = File.open('main.yaml')
    YAML::load(main_file)
  end

end