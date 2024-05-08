class HomeController < ApplicationController
  def index
    @balance = Balance.last
  end

  def debts
    @members = Member.all
  end
end
