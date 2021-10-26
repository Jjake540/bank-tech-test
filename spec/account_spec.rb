# frozen_string_literal: true

require 'account'

describe Account do
  it 'account starts with a balance of 0' do
    account = Account.new
    expect(account.balance).to eq(0)
  end

  it 'can deposit money into the account' do
    account = Account.new
    account.deposit(100)
    expect(account.balance).to eq(100)
  end

  it 'can withdraw money from the account' do
    account = Account.new
    account.deposit(100)
    account.withdraw(50)
    expect(account.balance).to eq(50)
  end
  
  describe 'transactions' do
    it 'stores a transaction after a deposit' do
      account = Account.new
      account.deposit(50)
      account.deposit(100)
      account.deposit(150)
      expect(account.transactions.length).to eq(3)
    end

    it 'stores a transaction after a withdraw' do
      account = Account.new
      account.withdraw(50)
      account.withdraw(50)
      expect(account.transactions.length).to eq(2)
    end

    it 'transaction updates with balance' do
      account = Account.new
      account.deposit(50)
      expect(account.transactions[0]['balance']).to eq(50)
    end

    it 'transaction updates with date' do
      account = Account.new
      account.deposit(50)
      date = Statement.new.timestamp
      expect(account.transactions[0]['date']).to eq(date)
    end
  end

  describe 'print statement' do
    it 'prints the bank statement' do
      account = Account.new
      account.deposit(1000)
      expect { account.print_statement }.to output("date || credit || debit || balance\n26/10/2021 || 1000 ||  || 1000\n").to_stdout
    end
  end
  
  describe 'edge cases' do
    it 'raises an error if deposit isnt a positive number' do
      expect { subject.deposit(-1) }.to raise_error('Invalid input!')
      expect { subject.deposit('Hello World') }.to raise_error('Invalid input!')
    end

    it 'raises an error if withdraw isnt a positive number' do
      account = Account.new
      account.deposit(100)
      expect { account.withdraw(-10) }.to raise_error('Invalid input!')
      expect { account.withdraw('Hello World') }.to raise_error('Invalid input!')
    end

    it 'raises an error if not enough funds in the account' do
      account = Account.new
      account.deposit(10)
      expect { account.withdraw(20) }.to raise_error('Insufficient funds!')
    end
  end
end