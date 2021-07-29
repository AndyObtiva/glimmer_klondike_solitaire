$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

begin
  require 'bundler/setup'
  Bundler.require(:default)
rescue
  # this runs when packaged as a gem (no bundler)
  require 'glimmer-dsl-swt'
  # add more gems if needed
end

class GlimmerKlondikeSolitaire
  APP_ROOT = File.expand_path('../..', __FILE__)
  VERSION = File.read(File.join(APP_ROOT, 'VERSION'))
  LICENSE = File.read(File.join(APP_ROOT, 'LICENSE.txt'))
  PLAYING_CARD_MARGIN = 15
  PLAYING_CARD_WIDTH = 106
  PLAYING_CARD_HEIGHT = 162
  PLAYING_CARD_SPACING = 10
end

require 'glimmer_klondike_solitaire/view/app_view'
