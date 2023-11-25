module AppLogic
    def total_eks_vat
        a = 0
        products.each do |p|
          a += p.eks_vat
        end
        a
      end
      def total_vat
        products.sum(:total_price) - total_eks_vat
      end
end