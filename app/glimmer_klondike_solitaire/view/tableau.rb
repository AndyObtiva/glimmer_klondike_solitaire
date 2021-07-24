require_relative 'dealing_pile'
require_relative 'dealt_pile'

require 'glimmer_klondike_solitaire/model/game'

class GlimmerKlondikeSolitaire
  module View
    class Tableau
      include Glimmer::UI::CustomWidget
      
      before_body {
        Model::Game.restart!
      }
  
      body {
        composite {
          grid_layout 7, true
          background :dark_green
          
          # row 1
#           foundation_pile(:spades)
#           foundation_pile(:hearts)
#           foundation_pile(:clubs)
#           foundation_pile(:diamonds)
          label # filler TODO DELETE
          label # filler TODO DELETE
          label # filler TODO DELETE
          label # filler TODO DELETE
          label # filler
          dealt_pile {
            layout_data {
              width_hint 51
              height_hint 81
            }
          }
          dealing_pile {
            layout_data {
              width_hint 51
              height_hint 81
            }
          }
          
          # row 2
#           column_pile(1)
#           column_pile(2)
#           column_pile(3)
#           column_pile(4)
#           column_pile(5)
#           column_pile(6)
#           column_pile(7)
        }
      }
  
    end
  end
end
