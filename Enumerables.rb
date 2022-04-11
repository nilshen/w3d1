class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            self[i]
            i+=1
        end
        self
    end

end

# calls my_each twice on the array, printing all the numbers twice.
return_value = [1, 2, 3]
return_value.each do |num|
    puts num
end.each do |num|
    puts num
end
#    # => 1
#        2
#        3
#        1
#        2
#        3
   
   p return_value  # => [1, 2, 3]