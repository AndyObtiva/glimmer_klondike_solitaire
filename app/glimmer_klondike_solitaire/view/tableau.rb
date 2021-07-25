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
        composite {
          grid_layout 7, true
          background :dark_green
          
          # row 1
          foundation_pile(game: game, suit: :spades) {
            playing_card_layout_data
          }
          foundation_pile(game: game, suit: :hearts) {
            playing_card_layout_data
          }
          foundation_pile(game: game, suit: :clubs) {
            playing_card_layout_data
          }
          foundation_pile(game: game, suit: :diamonds) {
            playing_card_layout_data
          }
          label # filler
          dealt_pile(game: game) {
            playing_card_layout_data
          }
          dealing_pile(game: game) {
            playing_card_layout_data
          }
          
          # row 2
          column_pile(game: game, count: 1) {
            playing_card_column_layout_data
          }
          column_pile(game: game, count: 2) {
            playing_card_column_layout_data
          }
          column_pile(game: game, count: 3) {
            playing_card_column_layout_data
          }
          column_pile(game: game, count: 4) {
            playing_card_column_layout_data
          }
          column_pile(game: game, count: 5) {
            playing_card_column_layout_data
          }
          column_pile(game: game, count: 6) {
            playing_card_column_layout_data
          }
          column_pile(game: game, count: 7) {
            playing_card_column_layout_data
          }
        }
      }
  
      def playing_card_layout_data
        layout_data {
          width_hint 51
          height_hint 81
        }
      end
  
      def playing_card_column_layout_data
        layout_data {
          width_hint 51
          height_hint 221
        }
      end
    end
  end
end
