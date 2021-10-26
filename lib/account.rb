require_relative 'statement'

class Account
  
  attr_reader :balance
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions.push({"date" => date, "credit" => amount, "debit" => '', "balance" => @balance})
  end

  def withdraw(amount)
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

  def date
    Statement.new.timestamp
  end
  
end