# frozen_string_literal: true

require_relative 'statement'

# main account class
class Account
  attr_reader :balance, :transactions, :statement

  def initialize
    @balance = 0
    @transactions = []
    @statement = Statement.new
  end

  def deposit(amount)
    raise 'Invalid input!' if invalid_input(amount)

    @balance += amount
    @transactions.push({ 'date' => date, 'credit' => amount, 'balance' => @balance })
  end

  def withdraw(amount)
    raise 'Invalid input!' if invalid_input(amount)
    raise 'Insufficient funds!' if amount > @balance

    @balance -= amount
    @transactions.push({ 'date' => date, 'debit' => amount, 'balance' => @balance })
  end

  def print_statement
    print @statement.display_header
    @transactions.reverse_each do |display|
      print "#{display['date']} || #{format_number(display['credit'])} || #{format_number(display['debit'])} || #{format_number(display['balance'])}\n"
    end
  end

  private

  def invalid_input(amount)
    !amount.is_a?(Integer) || amount.negative?
  end

  def date
    @statement.timestamp
  end

  def format_number(number)
    return '' if number.nil?

    format('%.2f', number.to_f)
  end
end
