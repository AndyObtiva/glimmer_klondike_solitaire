require 'glimmer_klondike_solitaire/model/game'

class GlimmerKlondikeSolitaire
  module View
    class ActionPanel
      include Glimmer::UI::CustomWidget

      option :game
      
      body {
        composite {
          grid_layout 1, false
          
          background :dark_green
          
          button {
            layout_data :center, :center, true, false
            
            text 'Restart Game'
            
            on_widget_selected {
              game.restart!
            }
          }
        }
      }
    end
  end
end
