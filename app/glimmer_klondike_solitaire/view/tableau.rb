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
          foundation_pile(pile_x: 0, pile_y: 0, game: game, suit: :spades)
          foundation_pile(pile_x: PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING, pile_y: 0, game: game, suit: :hearts)
          foundation_pile(pile_x: 2*(PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING), pile_y: 0, game: game, suit: :clubs)
          foundation_pile(pile_x: 3*(PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING), pile_y: 0, game: game, suit: :diamonds)
          @dealt_pile = dealt_pile(pile_x: 5*(PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING), pile_y: 0, game: game)
          @dealing_pile = dealing_pile(pile_x: 6*(PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING), pile_y: 0, game: game)
          
          # row 2
#           column_pile(game: game, count: 1) {
#             playing_card_column_layout_data
#           }
#           column_pile(game: game, count: 2) {
#             playing_card_column_layout_data
#           }
#           column_pile(game: game, count: 3) {
#             playing_card_column_layout_data
#           }
#           column_pile(game: game, count: 4) {
#             playing_card_column_layout_data
#           }
#           column_pile(game: game, count: 5) {
#             playing_card_column_layout_data
#           }
#           column_pile(game: game, count: 6) {
#             playing_card_column_layout_data
#           }
#           column_pile(game: game, count: 7) {
#             playing_card_column_layout_data
#           }

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
