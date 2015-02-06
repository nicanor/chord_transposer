module ChordTransposer
  class Transposer

    CHORDS = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']

    def initialize(semitones=0)
      @semitones = semitones
    end

    def transpose(chord)
      index = CHORDS.index(chord)
      CHORDS[(index + @semitones)%12]
    end
  end
end