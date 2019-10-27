class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? and receiver.valid?
  end

  def execute_transaction
    if valid? and receiver.balance > amount and self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_tansfer
    end

  end



  def reject_tansfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
