require 'spec_helper'

require_relative '../../lib/player'

describe Player do
  it 'a player has a character' do
    player = Player.new('Tara', 'x')
    expect(player.name).to eq('Tara')
    expect(player.character).to eq('x')
  end
end
