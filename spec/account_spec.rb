# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { Account.new }
  let(:date) { Statement.new.timestamp }

  it 'account starts with a balance of 0' do
    expect(account.balance).to eq(0)
  end

  it 'can deposit money into the account' do
    account.deposit(100)
    expect(account.balance).to eq(100)
  end

  it 'can withdraw money from the account' do
    account.deposit(100)
    account.withdraw(50)
    expect(account.balance).to eq(50)
  end

  describe 'transactions' do
    it 'stores a transaction after a deposit' do
      2.times { account.deposit(50) }
      expect(account.transactions.length).to eq(2)
    end

    it 'stores a transaction after a withdraw' do
      2.times { account.deposit(50) }
      2.times { account.withdraw(50) }
      expect(account.transactions.length).to eq(4)
    end

    it 'transaction updates with balance' do
      account.deposit(50)
      expect(account.transactions[0]['balance']).to eq(50)
    end

    it 'transaction updates with date' do
      account.deposit(50)
      expect(account.transactions[0]['date']).to eq(date)
    end
  end

  describe 'print statement' do
    it 'prints the bank statement' do
      account.deposit(1000)
      expect { account.print_statement }
        .to output(
          "date || credit || debit || balance\n#{date} || 1000.00 ||  || 1000.00\n"
        ).to_stdout
    end
  end

  describe 'edge cases' do
    it 'raises an error if not enough funds in the account' do
      expect { account.withdraw(20) }.to raise_error('Insufficient funds!')
    end

    it 'raises an error if deposit isnt a positive number' do
      expect { subject.deposit(-1) }.to raise_error('Invalid input!')
      expect { subject.deposit('Hello World') }.to raise_error('Invalid input!')
    end

    it 'raises an error if withdraw isnt a positive number' do
      expect { account.withdraw(-10) }.to raise_error('Invalid input!')
      expect { account.withdraw('Hello World') }.to raise_error('Invalid input!')
    end
  end
end
