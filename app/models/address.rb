class Address < ApplicationRecord

  # 会員
  belongs_to :customer

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end
