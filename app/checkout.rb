class Rule
  # The CEO is a big fan of buy-one-get-one-free offers and of fruit tea. He wants us to add a rule to do this.
  def self.ceo_rule
    Proc.new{ | products, product | 
      count = 0
      products.each do | co_product |
        if co_product.code == product.code
          count = count + 1
        end
      end
      if count % 2 == 1
        product.price = 0
      end
      products
    }
  end

  # The COO, though, likes low prices and wants people buying strawberries to get a price discount for bulk purchases. 
  # If you buy 3 or more strawberries, the price should drop to ¬£4.50
  def self.coo_rule 
    Proc.new{ | products, product | 
      strawberries = []
      no_strawberries = [] 
      if product.code == 'SR1'
        strawberries << product
      end
      products.each do | co_product |
        if co_product.code == 'SR1'
          strawberries << co_product
        else
          no_strawberries << co_product
        end
      end
      if strawberries.size >= 3
        strawberries.collect {|strawberry| strawberry.price = 4.5 }
      end
      no_strawberries + strawberries
    }
  end
end

class Checkout

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @products = []
  end

  def scan(product)
    @pricing_rules.each do | pricing_rule |
      pricing_rule.call(@products, product)
    end
    @products << product
  end

  def total
    @products.inject(0) { |sum, product| sum += product.price }
  end

end

class Product
  attr_reader :code
  attr_reader :name
  attr_accessor :price
  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end  

end