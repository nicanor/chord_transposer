module ChordTransposer
  class Transposer

    REGEXP = /(?<tone>Do#|Do|Re#|Re|Mi|Fa#|Fa|Sol#|Sol|La#|La|Si)(?<mode>m7|m|7|)/i

    CHORDS   = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
    AMERICAN = ['C',  'C#',  'D',  'D#',  'E',  'F',  'F#',  'G',   'G#',   'A',  'A#',  'B' ]

    def initialize(semitones=0, notation=:latin)
      @array = if notation == :latin
        CHORDS.rotate(semitones)
      else
        AMERICAN.rotate(semitones)
      end
    end

    def transpose(chord)
      match = REGEXP.match chord
      index = CHORDS.index match[:tone]
      @array[index] + match[:mode]
    end
  end
end