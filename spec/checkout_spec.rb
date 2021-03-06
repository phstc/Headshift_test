=begin
Headshift's quest for global domination has prompted us to open a supermarket - we sell only three products:

Product code | Name         | Price
-----------------------------------------
FR1          | Fruit tea    |  ¬£3.11
SR1          | Strawberries |  ¬£5.00
CF1          | Coffee       | ¬£11.23

The CEO is a big fan of buy-one-get-one-free offers and of fruit tea. He wants us to add a rule to do this.

The COO, though, likes low prices and wants people buying strawberries to get a price discount for bulk purchases. 
If you buy 3 or more strawberries, the price should drop to ¬£4.50

Our check-out can scan items in any order, and because the CEO and COO change their minds often, 
it needs to be flexible regarding our pricing rules.

The interface to our checkout looks like this (shown in ruby):

 co = Checkout.new(pricing_rules)
 co.scan(item)
 co.scan(item)
 price = co.total

Implement a checkout system that fulfills these requirements.

Test data
---------

Basket: FR1,SR1,FR1,FR1,CF1
FR1, FR1, FR1 = 6.22 (buy-one-get-one-free)
SR1 = 5.00
CF1 = 11.23
Total price expected: ¬£22.45

Basket: FR1,FR1
Total price expected: ¬£3.11

Basket: SR1,SR1,FR1,SR1
Total price expected: ¬£16.61
=end


require File.dirname(__FILE__) + '/../app/checkout'

describe Checkout do
  
    before(:all) do
      @fruit_tea = Product.new('FR1', 'Fuit tea', 3.11)
      @strawberries = Product.new('SR1', 'Strawberries', 5.00)
      @coffee = Product.new('CF1', 'Coffee', 11.23)
    end
  
    it 'should give one fruit tea free' do
       # Basket: FR1,SR1,FR1,FR1,CF1
       # Total price expected: ¬£22.45
       pricing_rules = [Rule.ceo_rule, Rule.coo_rule]
        co = Checkout.new(pricing_rules)
        co.scan(@fruit_tea.clone)
        co.scan(@strawberries.clone)
        co.scan(@fruit_tea.clone)
        co.scan(@fruit_tea.clone)
        co.scan(@coffee.clone)
        co.total.should eql(22.45)
     end
     
     it 'should give one fruit tea free' do
       # Basket: FR1,FR1
       # Total price expected: ¬£3.11
       pricing_rules = [Rule.ceo_rule, Rule.coo_rule]
       co = Checkout.new(pricing_rules)
       co.scan(@fruit_tea.clone)
       co.scan(@fruit_tea.clone)
       co.total.should eql(3.11)
     end
     
     it 'should give one fruit tea free' do
       # Basket: SR1,SR1,FR1,SR1
       # Total price expected: ¬£16.61
       pricing_rules = [Rule.ceo_rule, Rule.coo_rule]
       co = Checkout.new(pricing_rules)
       co.scan(@strawberries.clone)
       co.scan(@strawberries.clone)
       co.scan(@fruit_tea.clone)
       co.scan(@strawberries.clone)
       co.total.should eql(16.61)
     end

end
