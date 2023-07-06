class CashRegister
    attr_accessor :discount, :total

    def initialize(discount= 0)
        @discount =discount
        @total = 0
        @item = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
        transaction_total = price * quantity
        self.total += transaction_total
        quantity.times { @item << title }
        @last_transaction = transaction_total
      end
      
      def apply_discount
        case
        when discount > 0
          discount_amount = (total * discount) / 100
          self.total -= discount_amount
          "After the discount, the total comes to $#{total}."
        else
          self.total = "There is no discount to apply."
        end
      end

      def items
        @item 
    end

    def void_last_transaction
        self.total -= @last_transaction
    end
end

