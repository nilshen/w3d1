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
        i = 0
        new_arr = []
        while i < self.length
            if prc.call(self[i])
                new_arr << self[i]
                return true
            end
            i += 1
        end
        new_arr
        false
    end

    def my_all?(&prc)
        i = 0
        new_arr = []
        while i < self.length
            if !prc.call(self[i])
                new_arr << self[i]
                return false
            end
            i += 1
        end
        new_arr
        true
    end

    def my_flatten(array)
        new_array = []
        array.each do |ele|
            ele.each { |el| my_flatten(el) }
            new_array << el
        end
    end
end

[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# p a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true



