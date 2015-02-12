module ChordTransposer
  class Translator

    #VALID_WORDS = Transposer::ALL + ['-', '(', ')', '/', '|', ',']

    def initialize(semitones=0, notation: :latin, response: :text)
      @transposer = Transposer.new(semitones, notation)
      @response = response
    end

    def call(line)
      if valid?(line)
        line.gsub(Transposer::REGEXP) do |chord|
          transpose($&)
        end
      else
        line
      end
    end

    def valid?(line)
      line.split.all? do |word|
        is_valid?(word)
      end
    end

    def transpose(chord)
      new_chord = @transposer.call(chord)
      if @response == :text
        new_chord
      else
        "<span class=\"chord\" data-chord=\"#{new_chord}\">#{new_chord}</span>"
      end
    end

    def is_valid?(word)
      ['-', '(', ')', '/', '|', ','].include?(word) ||
      word.capitalize.match(/\A(?<tone>Do#|Do|Reb|Re#|Re|Mib|Mi|Fa#|Fa|Solb|Sol#|Sol|Lab|La#|La|Sib|Si|C#|C|Db|D#|D|Eb|E|F#|F|Gb|G#|G|Ab|A#|A|Bb|B)(?<mode>m7|m|13|11|9|7|6|)\z/i)
    end
  end
end