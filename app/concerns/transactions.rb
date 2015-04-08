module Transactions

  def transaction
    if block_given?
      ActiveRecord::Base.transaction do
        yield
      end
    end
  end

end