class Array

    def my_each(&prc)
        i = 0
        new_arr = []
        while i < self.length
            new_arr << prc.call(self[i])
            i+=1
        end
        new_arr
    end

    def my_select(&prc)
        i = 0
        new_arr = []
        while i < self.length
            if prc.call(self[i])
                new_arr << self[i]
            end
            i += 1
        end
        new_arr
    end

    def my_reject(&prc)
        i = 0
        new_arr = []
        while i < self.length
            if !prc.call(self[i])
                new_arr << self[i]
            end
            i += 1
        end
        new_arr
    end

    def my_any?(&prc)
        

        self
    end

end



