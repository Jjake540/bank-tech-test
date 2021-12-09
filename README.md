# Bank tech test
 
I used TDD to build this program after working out what functions I felt would be needed. Also ran many feature tests in IRB to make sure everything was working correctly. I decided to store the information in an array of hashes so if needed more information could be added to the program.

### setup
* Clone this repo
* bundle install

### running tests
* run % rspec
* run % rubocop

### How to use
* require './lib/account.rb'
* account = Account.new
* account.depost(100)
* account.withdraw(50)
* account.print_statement
```
.0.0 :005 > account.print_statement
date || credit || debit || balance
27/10/2021 ||  || 50 || 50
27/10/2021 || 100 ||  || 100
```


### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command-line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored in a database or anything).

### Acceptance criteria

**Given** a client deposits 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
   date    ||  credit ||  debit || balance
14/01/2023 ||         || 500.00 || 2500.00
13/01/2023 || 2000.00 ||        || 3000.00
10/01/2023 || 1000.00 ||        || 1000.00
```
