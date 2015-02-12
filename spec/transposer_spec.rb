# encoding: utf-8
require 'spec_helper'

describe ChordTransposer::Transposer do
  describe ".call" do
    it "changes 'do' to 're'" do
      transposer = ChordTransposer::Transposer.new(2)
      expect(transposer.call('Do')).to eq('Re')
    end

    it "transposes all 12 mayor notes one tone higher" do
      transposer = ChordTransposer::Transposer.new(2)
      original_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
      expected_chords = ['Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si', 'Do', 'Do#']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes all 12 mayor notes three semitones higher" do
      transposer = ChordTransposer::Transposer.new(3)
      original_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
      expected_chords = ['Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si', 'Do', 'Do#', 'Re']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes all 12 mayor notes twelve semitones higher (and leaves them exactly the same)" do
      transposer = ChordTransposer::Transposer.new(12)
      original_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
      expected_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes all 12 mayor notes 5 semitones lower" do
      transposer = ChordTransposer::Transposer.new(-5)
      original_chords = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
      expected_chords = ['Sol', 'Sol#', 'La', 'La#', 'Si', 'Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes all 12 minor notes 5 semitones higher" do
      transposer = ChordTransposer::Transposer.new(5)
      original_chords = ['Dom', 'Do#m', 'Rem', 'Re#m', 'Mim', 'Fam', 'Fa#m', 'Solm', 'Sol#m', 'Lam', 'La#m', 'Sim']
      expected_chords = ['Fam', 'Fa#m', 'Solm', 'Sol#m', 'Lam', 'La#m', 'Sim', 'Dom', 'Do#m', 'Rem', 'Re#m', 'Mim']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes all 12 sept notes 6 semitones higher" do
      transposer = ChordTransposer::Transposer.new(6)
      original_chords = ['Do7', 'Do#7', 'Re7', 'Re#7', 'Mi7', 'Fa7', 'Fa#7', 'Sol7', 'Sol#7', 'La7', 'La#7', 'Si7']
      expected_chords = ['Fa#7', 'Sol7', 'Sol#7', 'La7', 'La#7', 'Si7', 'Do7', 'Do#7', 'Re7', 'Re#7', 'Mi7', 'Fa7']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes all 12 minor sept notes 7 semitones higher" do
      transposer = ChordTransposer::Transposer.new(7)
      original_chords = ['Dom7', 'Do#m7', 'Rem7', 'Re#m7', 'Mim7', 'Fam7', 'Fa#m7', 'Solm7', 'Sol#m7', 'Lam7', 'La#m7', 'Sim7']
      expected_chords = ['Solm7', 'Sol#m7', 'Lam7', 'La#m7', 'Sim7', 'Dom7', 'Do#m7', 'Rem7', 'Re#m7', 'Mim7', 'Fam7', 'Fa#m7']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes seven semitones higher to american notation" do
      transposer = ChordTransposer::Transposer.new(7, notation: :american)
      original_chords = ['Do', 'Do#m7', 'Rem', 'Re#m7', 'Mi7', 'Fa', 'Fa#m7', 'Sol7', 'Sol#', 'Lam7', 'La#m', 'Si7']
      expected_chords = ['G' , 'G#m7' , 'Am' , 'A#m7' , 'B7' , 'C' , 'C#m7' , 'D7'  , 'D#'  , 'Em7' , 'Fm'  , 'F#7']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes 5 semitones higher in american notation to latin notation" do
      transposer = ChordTransposer::Transposer.new(5)
      original_chords = ['G' , 'G#m7' , 'Am' , 'A#m7' , 'B7' , 'C' , 'C#m7' , 'D7'  , 'D#'  , 'Em7' , 'Fm'  , 'F#7']
      expected_chords = ['Do', 'Do#m7', 'Rem', 'Re#m7', 'Mi7', 'Fa', 'Fa#m7', 'Sol7', 'Sol#', 'Lam7', 'La#m', 'Si7']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes when chords are not camelized" do
      transposer = ChordTransposer::Transposer.new(5)
      original_chords = ['g' , 'g#m7' , 'am' , 'a#m7' , 'b7' , 'c' , 'do#m7', 're7' , 're#' , 'MIm7', 'FAm' , 'fa#7']
      expected_chords = ['Do', 'Do#m7', 'Rem', 'Re#m7', 'Mi7', 'Fa', 'Fa#m7', 'Sol7', 'Sol#', 'Lam7', 'La#m', 'Si7']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes bemole notes one tone higher" do
      transposer = ChordTransposer::Transposer.new(2)
      original_chords = ['Reb', 'Mib', 'Solb', 'Lab', 'Sib']
      expected_chords = ['Re#', 'Fa', 'Sol#', 'La#',  'Do']
      (0..4).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes bemole american notes one tone higher" do
      transposer = ChordTransposer::Transposer.new(2)
      original_chords = ['Db', 'Eb', 'Gb', 'Ab', 'Bb']
      expected_chords = ['Re#', 'Fa', 'Sol#', 'La#',  'Do']
      (0..4).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes 6ths 3 tones higher" do
      transposer = ChordTransposer::Transposer.new(6)
      original_chords = ['Do6', 'Do#6', 'Re6', 'Re#6', 'Mi6', 'Fa6', 'Fa#6', 'Sol6', 'Sol#6', 'La6', 'La#6', 'Si6']
      expected_chords = ['Fa#6', 'Sol6', 'Sol#6', 'La6', 'La#6', 'Si6', 'Do6', 'Do#6', 'Re6', 'Re#6', 'Mi6', 'Fa6']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes 9ths 3 tones higher" do
      transposer = ChordTransposer::Transposer.new(6)
      original_chords = ['Do9', 'Do#9', 'Re9', 'Re#9', 'Mi9', 'Fa9', 'Fa#9', 'Sol9', 'Sol#9', 'La9', 'La#9', 'Si9']
      expected_chords = ['Fa#9', 'Sol9', 'Sol#9', 'La9', 'La#9', 'Si9', 'Do9', 'Do#9', 'Re9', 'Re#9', 'Mi9', 'Fa9']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes 11ths 3 tones higher" do
      transposer = ChordTransposer::Transposer.new(6)
      original_chords = ['Do11', 'Do#11', 'Re11', 'Re#11', 'Mi11', 'Fa11', 'Fa#11', 'Sol11', 'Sol#11', 'La11', 'La#11', 'Si11']
      expected_chords = ['Fa#11', 'Sol11', 'Sol#11', 'La11', 'La#11', 'Si11', 'Do11', 'Do#11', 'Re11', 'Re#11', 'Mi11', 'Fa11']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end

    it "transposes 13ths 3 tones higher" do
      transposer = ChordTransposer::Transposer.new(6)
      original_chords = ['Do13', 'Do#13', 'Re13', 'Re#13', 'Mi13', 'Fa13', 'Fa#13', 'Sol13', 'Sol#13', 'La13', 'La#13', 'Si13']
      expected_chords = ['Fa#13', 'Sol13', 'Sol#13', 'La13', 'La#13', 'Si13', 'Do13', 'Do#13', 'Re13', 'Re#13', 'Mi13', 'Fa13']
      (0..11).each do |index|
        expect(transposer.call(original_chords[index])).to eq(expected_chords[index])
      end
    end
  end
end