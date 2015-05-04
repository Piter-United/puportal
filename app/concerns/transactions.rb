module Transactions
  def transaction
    ActiveRecord::Base.transaction{ yield } if block_given?
  end
end
