class InvoiceLine < ApplicationRecord
    belongs_to :invoice
    def eks_vat
        total_price/(1 + vat/100)
      end
    
      def vat_in_currency
        total_price - eks_vat
      end
end
