class BankAccount
  attr_reader :email, :balance

  def initialize(email, initial_balance = 0)
    @email = email
    @balance = initial_balance
  end

  def deposit(amount)
    raise ArgumentError, "Amount must be positive" if amount <= 0
    @balance += amount
  end

  def withdraw(amount)
    raise ArgumentError, "Amount must be positive" if amount <= 0
    @balance -= amount
  end

  def transfer(amount, target_account)
    raise ArgumentError, "Insufficient funds" if @balance < amount

    withdraw(amount)
    target_account.deposit(amount)
  end
end
