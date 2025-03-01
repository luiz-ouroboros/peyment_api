module Types
  include Dry.Types()

  I18nDateTime = Types::String.constrained(format: I18n.t('regexp.datetime'))
  Gateway = Types::Coercible::String.enum(*::Gateways::LIST.map(&:to_s))

  module Transactions
    Amount = Types::Coercible::Decimal.constrained(gt: 0)
    Installment = Types::Coercible::Integer.constrained(gteq: 1, lteq: 12)
    PaymentMethod = Types::Coercible::String.enum(*::Transaction::PAYMENT_METHODS)
    Status = Types::Coercible::String.enum(*::Transaction::STATUSES)
  end
end
