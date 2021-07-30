$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

begin
  require 'bundler/setup'
  Bundler.require(:default)
rescue
  # this runs when packaged as a gem (no bundler)
  require 'glimmer-dsl-swt'
  # add more gems if needed
end
  
require 'glimmer_klondike_solitaire/model/playing_card'

class GlimmerKlondikeSolitaire
  include Glimmer
  
  APP_ROOT = File.expand_path('../..', __FILE__)
  VERSION = File.read(File.join(APP_ROOT, 'VERSION'))
  LICENSE = File.read(File.join(APP_ROOT, 'LICENSE.txt'))
  PLAYING_CARD_MARGIN = 15
  PLAYING_CARD_WIDTH = 106
  PLAYING_CARD_HEIGHT = 162
  PLAYING_CARD_SPACING = 10
  
  IMAGES = Model::PlayingCard::SUITS.reduce({}) do |hash, suit|
    hash.merge(suit => 1.upto(13).reduce({}) do |suit_hash, rank|
      suit_hash.merge(rank => image(File.join(APP_ROOT, 'images', 'resized', "#{rank}#{suit.to_s[0].upcase}.png")))
    end)
  end
  IMAGE_BACK = image(File.join(APP_ROOT, 'images', 'resized', 'BACK.png'))
end

require 'glimmer_klondike_solitaire/view/app_view'
