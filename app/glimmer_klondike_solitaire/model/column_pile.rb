require_relative 'playing_card'

class GlimmerKlondikeSolitaire
  module Model
    class ColumnPile
      attr_reader :count
    
      def initialize(game, count)
        @game = game
        @count = count
        reset!
      end
      
      def reset!
        playing_cards.clear
        count.times { playing_cards << @game.deck.pop }
      end
    
      def push!(new_playing_cards)
        new_playing_cards.each do |playing_card|
          playing_cards.push(playing_card)
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
