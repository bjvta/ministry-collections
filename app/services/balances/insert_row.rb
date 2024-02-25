module Balances
  class InsertRow
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def perform
      if is_expense
        insert_expense
      else
        insert_income
      end
    end

    private

    def previous_balance
      previous_balance_amount = Balance.last.try(:current_balance)
      if previous_balance_amount.nil?
        previous_balance_amount = 0.00
      end
      previous_balance_amount
    end

    def is_expense
      is_expense = data.class == Expense
    end

    def insert_expense
      balance = Balance.new
      balance.type_movement = "expense"
      balance.member = data.member
      balance.amount = data.amount
      balance.previous_balance = previous_balance
      balance.current_balance = previous_balance - data.amount
      balance.save
    end

    def insert_income
      if data.class == Fine
        income_type = "fine"
      else
        income_type = "weekly"
      end
      balance = Balance.new
      balance.type_movement = "income"
      balance.member = data.member
      balance.amount = data.amount
      balance.previous_balance = previous_balance
      balance.current_balance = previous_balance + data.amount
      balance.income_type = income_type
      balance.save
    end
  end
end