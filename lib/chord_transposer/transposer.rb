module ChordTransposer
  class Transposer

    CHORDS = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']

    
    def initialize(tranpose=0)
    end

    def transpose(chord)
      index = CHORDS.index(chord)
      CHORDS[(index + 2)%12]
    end
  end
end