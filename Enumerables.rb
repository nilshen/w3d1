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

    # def my_flatten
    #     if !self.is_a?(Array)
    #         return [self]
    #     end
    #     new_arr = []
    #     self.each do |mini_arr|
    #         if !mini_arr.is_a?(Array)
    #             new_arr << mini_arr
    #         else
    #             new_arr += mini_arr.my_flatten
    #         end
    #     end
    #     new_arr
    # end

    def my_flatten
        # return [self] if !self.is_a?(Array)
        
        new_arr = []
        self.each do |el|
            new_arr += if el.is_a?(Array)    #!!!need to work on this 
                            el.my_flatten
                        else
                            [el]
                        end
                end
        new_arr
    end

    def my_flatten
        flattened = []
    
        self.my_each do |el|
          if el.is_a?(Array)
            flattened.concat(el.my_flatten)
          else
            flattened << el
          end
        end
    
        flattened
      end
    
    def my_zip(*arr)
        arr.unshift(self)
        h = self.length
        maximum = arr.length
        new_arr = Array.new(h) {Array.new(maximum)}
        (0...h).each do |row|
            (0...maximum).each do |col|
                new_arr[row][col] = arr[col][row]
            end
        end
        new_arr
    end

    # def my_rotate(num = 1)
    #     new_arr = []
    #     self.each.with_index do |char, i|
    #         new_arr[i-num] = self[i]
    #     end
    #     new_arr
    # end

    def my_rotate(positions = 1)
        split_idx = positions % self.length
    
        self.drop(split_idx) + self.take(split_idx)
      end
    
    def my_join(separator = "")
        join = ""

        self.length.times do |i|
        join += self[i]
        join += separator unless i == self.length - 1
        end

        join
    end

    def my_reverse
        reversed = []

        self.my_each do |el|
        reversed.unshift(el)
        end

        reversed
    end


end

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# x = 15
# def foo(x)
#   x = 10
# end
# foo(x)
# p x

# # game.board[pos].revealed = true if !guess && game.board[pos] && game.board[pos].revealed == false



# x = []
# def foo(x)
#   x << "Fancy Feast"
# end
# foo(x)
# p x



# p a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true



