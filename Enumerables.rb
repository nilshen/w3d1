class Array

    def my_each(array)
        i = 0
        while i<array.length
            puts array[i]
            i+=1
        end
    end

    




end
array = [1,2,3]
p my_each(array)

# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end
#    # => 1
#        2
#        3
#        1
#        2
#        3
   
#    p return_value  # => [1, 2, 3]