require 'custom_matchers/bank_account'

RSpec::Matchers.define :be_valid_email do
  match do |actual|
    actual.is_a?(String) &&
    actual.include?('@') &&
    actual.include?('.') &&
    !actual.start_with?('@') &&
    !actual.end_with?('@')
  end


  failure_message do |actual|
    "expected '#{actual}' to be a valid email address"
  end

  failure_message_when_negated do |actual|
    "expected '#{actual}' not to be a valid email address"
  end
end


RSpec::Matchers.define :have_sufficient_balance do |amount|
  match do |account|
    account.balance >= amount
  end

  failure_message do |account|
    "expected account with balance #{account.balance} to have at least #{amount}"
  end

  description do
    "have sufficient balance of #{amount}"
  end
end

RSpec::Matchers.define :be_overdrawn do
  match do |account|
    account.balance < 0
  end

  failure_message do |account|
    "expected account with balance #{account.balance} to be overdrawn (negative)"
  end
end

# Matcher que aceita chain
RSpec::Matchers.define :have_balance do
  chain :greater_than do |amount|
    @greater_than = amount
  end

  chain :less_than do |amount|
    @less_than = amount
  end

  match do |account|
    balance = account.balance

    if @greater_than && @less_than
      balance > @greater_than && balance < @less_than
    elsif @greater_than
      balance > @greater_than
    elsif @less_than
      balance < @less_than
    else
      true
    end
  end

  failure_message do |account|
    conditions = []
    conditions << "greater than #{@greater_than}" if @greater_than
    conditions << "less than #{@less_than}" if @less_than

    "expected account with balance #{account.balance} to have balance #{conditions.join(' and ')}"
  end
end

RSpec.describe BankAccount do
  let(:account) { BankAccount.new("john@email.com", 1000) }

  describe "custom email matcher" do
    it "validates email format" do
      expect("test@example.com").to be_valid_email
      expect("invalid-email").not_to be_valid_email
      expect("@invalid.com").not_to be_valid_email
      expect("invalid@").not_to be_valid_email
    end
  end

  describe "custom balance matchers" do
    it "checks sufficient balance" do
      expect(account).to have_sufficient_balance(500)
      expect(account).not_to have_sufficient_balance(1500)
    end

    it "checks if overdrawn" do
      account.withdraw(1200) # Should overdraw
      expect(account).to be_overdrawn
    end

    it "uses chainable balance matcher" do
      expect(account).to have_balance.greater_than(500)
      expect(account).to have_balance.less_than(2000)
      expect(account).to have_balance.greater_than(800).less_than(1200)
    end
  end

  describe "regular tests with custom matchers" do
    it "creates account with valid email and balance" do
      expect(account.email).to be_valid_email
      expect(account).to have_sufficient_balance(0)
    end

    context "after withdrawal" do
      before { account.withdraw(300) }

      it "has reduced balance" do
        expect(account).to have_balance.greater_than(600).less_than(800)
      end
    end
  end
end
