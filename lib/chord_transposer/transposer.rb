module ChordTransposer
  class Transposer

    REGEXP = /(?<tone>Do#|Do|Re#|Re|Mi|Fa#|Fa|Sol#|Sol|La#|La|Si|C#|C|D#|D|E|F#|F|G#|G|A#|A|B)(?<mode>m7|m|7|)/i

    LATIN   = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
    AMERICAN = ['C',  'C#',  'D',  'D#',  'E',  'F',  'F#',  'G',   'G#',   'A',  'A#',  'B' ]

    ALL = LATIN + AMERICAN

    def initialize(semitones=0, notation=:latin)
      @array = if notation == :latin
        LATIN.rotate(semitones)
      else
        AMERICAN.rotate(semitones)
      end
    end

    def transpose(chord)
      match = REGEXP.match chord.capitalize
      index = ALL.index(match[:tone])%12
      @array[index] + match[:mode]
    end
  end
end