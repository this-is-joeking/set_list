require 'rails_helper'

RSpec.describe Artist do
  describe 'relationships' do
    it { should have_many :songs }
  end

  describe 'instance method' do
    describe '#average_song_length' do
      it 'returns average song length' do
        prince = Artist.create!(name: 'Prince')
        purple = prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
        rasp = prince.songs.create!(title: 'Raspberry Beret', length: 241, play_count: 103874)
        kiss = prince.songs.create!(title: 'Kiss', length: 245, play_count: 103874)
    
        expect(prince.average_song_length.round(2)).to eq(443.67)
      end
    end
  end
end