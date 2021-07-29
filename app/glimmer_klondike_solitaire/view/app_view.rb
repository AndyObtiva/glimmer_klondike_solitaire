require_relative 'tableau'
require_relative 'action_panel'

class GlimmerKlondikeSolitaire
  module View
    class AppView
      include Glimmer::UI::CustomShell
    
      before_body {
        @game = Model::Game.new
        Display.app_name = 'Glimmer Klondike Solitaire'
        Display.app_version = VERSION
        @display = display {
          on_about {
            display_about_dialog
          }
          on_preferences {
            display_preferences_dialog
          }
        }
      }
  
      body {
        shell(:no_resize) {
          row_layout(:vertical) {
            fill true
            center true
            margin_width 0
            margin_height 0
          }
          minimum_size 2*PLAYING_CARD_MARGIN + 7*(PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING) - 5, 700
          image File.join(APP_ROOT, 'package', 'linux', "Glimmer Klondike Solitaire.png")
          text "Glimmer Klondike Solitaire"
          background :dark_green
        
          action_panel(game: @game)
          tableau(game: @game) {
            layout_data {
              width 2*PLAYING_CARD_MARGIN + 7*(PLAYING_CARD_WIDTH + PLAYING_CARD_SPACING) - 5
              height 700
            }
          }
          
          menu_bar {
            menu {
              text '&Game'
              menu_item {
                text '&Restart'
                accelerator OS.mac? ? :command : :ctrl, :r
                on_widget_selected {
                  @game.restart!
                }
              }
              menu_item {
                text 'E&xit'
                accelerator :alt, :f4
                on_widget_selected {
                  exit(0)
                }
              }
            }
            menu {
              text '&Help'
              menu_item {
                text '&About...'
                on_widget_selected {
                  display_about_dialog
                }
              }
            }
          }
        }
      }
  
      def display_about_dialog
        message_box(body_root) {
          text 'About'
          message "Glimmer Klondike Solitaire #{VERSION}\n\n#{LICENSE}"
        }.open
      end
      
    end
  end
end
