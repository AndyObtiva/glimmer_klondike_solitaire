class GlimmerKlondikeSolitaire
  module Model
    class DealingPile
      class << self
        attr_accessor :empty
        alias empty? empty
      
        def deal!
          self.empty = (rand*20).to_i.odd?
        end
      end
    end
  end
end
