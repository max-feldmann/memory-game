
class Card

    def initialize (value)
        @value = value
        @revealed = false
    end
    
    attr_reader :value
    
    def hide
        @face_up = false
    end

    def reveal
        @revealed = true
    end

     def to_s
         if @revealed 
             return @value.to_s
         else
             return " "
         end
     end

end