require_relative 'dealing_pile'
require_relative 'dealt_pile'
require_relative 'column_pile'
require_relative 'foundation_pile'

require 'glimmer_klondike_solitaire/model/game'

class GlimmerKlondikeSolitaire
  module View
    class Tableau
      include Glimmer::UI::CustomWidget
      
      option :game
      
      body {
        canvas {
          background :dark_green
          
          # row 1
          @foundation_piles = Model::PlayingCard::SUITS.each_with_index.map do |suit, i|
            foundation_pile(pile_x: i*(PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING), pile_y: 0, game: game, suit: suit)
          end
          @dealt_pile = dealt_pile(pile_x: 5*(PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING), pile_y: 0, game: game)
          @dealing_pile = dealing_pile(pile_x: 6*(PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING), pile_y: 0, game: game)
          
          # row 2
          @column_piles = 7.times.map do |n|
            column_pile(pile_x: n*(PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING), pile_y: PLAYING_CARD_HEIGHT + PLAYING_CARD_SPACING, game: game, count: n + 1)
          end

          on_mouse_up do |event|
            if @dealing_pile.body_root.include?(event.x, event.y)
              game.dealing_pile.deal!
              body_root.redraw
            end
          end
        }
      }
  
    end
  end
end
