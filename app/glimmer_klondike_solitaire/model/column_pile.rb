class GlimmerKlondikeSolitaire
  module Model
    class ColumnPile
      include Glimmer::DataBinding::ObservableModel
      attr_reader :count
    
      def initialize(game, count)
        @game = game
        @count = count
        reset!
      end
      
      def reset!
        playing_cards.clear
        count.times { playing_cards << @game.deck.pop }
        notify_observers(:playing_cards)
      end
    
      # this method does not validate
      def push!(new_playing_cards)
        new_playing_cards.each do |playing_card|
          playing_cards.push(playing_card)
        end
      end
      
      # this method validates that playing card fits at the bottom of the column (opposite color and one number smaller)
      # throws an error if it does not fit
      def add!(new_playing_card)
        bottom_card = playing_cards.last
        if new_playing_card.color != bottom_card.color && new_playing_card.rank == (bottom_card.rank - 1)
          playing_cards.push(new_playing_card)
        else
          raise "Cannot add card #{new_playing_card} to column pile #{self}"
        end
      end
      
      def remove_cards_starting_at(index)
        removed_cards = playing_cards[index...playing_cards.size]
        playing_cards[index...playing_cards.size] = []
        removed_cards
      end
      
      def playing_cards
        @playing_cards ||= []
      end
    end
  end
end
