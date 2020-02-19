
class Card

    def initialize (value, revealed = false)
        @value = value
        @revealed = revealed
    end
    
    attr_reader :value
    
    def hide
        @face_up = false
    end

    def reveal
        @revealed = true
    end

    def to_s
        revealed? ? @value.to_s : " "
    end

    # def ==(??)
    #     ???
    # end

end