class GlimmerKlondikeSolitaire
  module View
    class Tableau
      include Glimmer::UI::CustomWidget
  
      body {
        composite {
          grid_layout 7, true
          background :dark_green
          
          # row 1
          dealing_pile
#           discarding_pile
#           label # filler
#           foundation_pile(:spades)
#           foundation_pile(:hearts)
#           foundation_pile(:clubs)
#           foundation_pile(:diamonds)
          
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
