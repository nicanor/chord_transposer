# encoding: utf-8
require 'spec_helper'

describe ChordTransposer do
  describe ".transpose" do
    it "changes 'do' to 're'" do
      transposer = ChordTransposer::Transposer.new(2)
      expect(transposer.transpose('Do')).to eq('Re')
    end

    it "transposes all 12 mayor notes one tone higher" do
      transposer = ChordTransposer::Transposer.new(2)
      original_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
      expected_chords = ['Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si', 'Do', 'Do#']
      (0..11).each do |index|
        expect(transposer.transpose(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes all 12 mayor notes three semitones higher" do
      transposer = ChordTransposer::Transposer.new(3)
      original_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
      expected_chords = ['Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si', 'Do', 'Do#', 'Re']
      (0..11).each do |index|
        expect(transposer.transpose(original_chords[index])).to eq(expected_chords[index])
      end
    end

  end
end