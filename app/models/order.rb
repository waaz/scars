class Order < ActiveRecord::Base
  belongs_to :payement

  attr_accessor :card_number, :card_verification

  validate :validate_card, :on => :create

  def purchase
    response = GATEWAY.purchase(price_in_pence, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_pence, :response => response)
    response.success?
  end

  def price_in_pence
    (:payement.amount*100).round
  end


  private

  def validate_card
    unless credit_card.valid? do

      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type               => card_type,
        :number             => card_number,
        :verification_value => card_verification,
        :month              => card_expires_on.month,
        :year               => card_expires_on.year,
        :first_name         => first_name,
        :last_name          => last_name
    )
  end
end
