require_relative 'statement'

class Account
  
  attr_reader :balance
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    raise "Invalid input!" if invalid_input(amount)
    @balance += amount
    @transactions.push({"date" => date, "credit" => amount, "debit" => '', "balance" => @balance})
  end

  def withdraw(amount)
    raise "Insufficient funds!" if insufficient_funds(amount)
    raise "Invalid input!" if invalid_input(amount)
    @balance -= amount
    @transactions.push({"date" => date, "credit" => '', "debit" => amount, "balance" => @balance})
  end

  def print_statement
    print Statement.new.display_header
    @transactions.reverse_each do |display|
      print "#{display["date"]} || #{display["credit"]} || #{display["debit"]} || #{display["balance"]}\n" 
    end
  end
    
private

  def invalid_input(amount)
    !amount.is_a?(Integer) || amount.negative?
  end
  
  def insufficient_funds(amount)
    (@balance - amount).negative? 
  end

  def date
    Statement.new.timestamp
  end
  
end