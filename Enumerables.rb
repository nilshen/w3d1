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

    def my_flatten
        if !self.is_a?(Array)
            return [self]
        end
        new_arr = []
        self.each do |mini_arr|
            if !mini_arr.is_a?(Array)
                new_arr << mini_arr
            else
                new_arr += mini_arr.my_flatten
            end
        end
        new_arr
    end

    def my_zip(*arr)
        arr.unshift(self)
        h = arr.length
        maximum = arr.map(&:length).max
        new_arr = Array.new(maximum) {Array.new(arr.length, nil)}
        (0...h).each do |row|
            (0...maximum).each do |col|
                
                new_arr[row][col] = arr[col][row]

            end
        end
        new_arr
    end

end


a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]




# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# p a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true



