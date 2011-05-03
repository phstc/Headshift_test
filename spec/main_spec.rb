require 'yaml'
require File.dirname(__FILE__) + '/../app/main.rb'

describe Main do
  
  before(:all) do
    @main = Main.unserialize
  end
  
  it 'should hire me' do
    @main.answers[:ask_hire_me].should be_true
  end
  
  it 'should be patience with my English level' do
    @main.answers[:ask_lots_of_money].should be_true
  end
  
  it 'should give me a lots of money ;)' do
    @main.answers[:ask_patience_with_my_english_level].should be_true
  end
  
end