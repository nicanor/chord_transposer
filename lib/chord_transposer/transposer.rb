module ChordTransposer
  class Transposer

    REGEXP = /(?<tone>Do#|Do|Re#|Re|Mi|Fa#|Fa|Sol#|Sol|La#|La|Si)(?<mode>m7|m|7|)/i

    CHORDS   = ['Do', 'Do#', 'Re', 'Re#', 'Mi', 'Fa', 'Fa#', 'Sol', 'Sol#', 'La', 'La#', 'Si']
    AMERICAN = ['C',  'C#',  'D',  'D#',  'E',  'F',  'F#',  'G',   'G#',   'A',  'A#',  'B' ]

    def initialize(semitones=0, notation=:latin)
      @notation  = notation
      @semitones = semitones
    end

    def transpose(chord)
      match = REGEXP.match chord
      tone  = match[:tone]
      mode  = match[:mode]
      index = CHORDS.index(tone)
      if @notation == :latin
        CHORDS[(index + @semitones)%12] + mode
      else
        AMERICAN[(index + @semitones)%12] + mode
      end
    end
  end
end