class TreeNode
    attr_accessor :left, :right, :val

    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = nil
        @right = nil
    end

    def self.val
        @val
    end
end

class ListNode
    attr_accessor :_next, :val

    def initialize(val = 0, _next = nil)
        @val = val
        @_next = _next
    end

    def self.val
        @val
    end
end

class Min_Stack
    def initialize
        @stack = []
        @min_stack = []
    end

    def push(x)
        @stack.push x
        @min_stack.push x if @min_stack.empty? or  x <= @min_stack.last
    end

    def pop
        @min_stack.pop if @min_stack[-1] == @min_stack[-1]
        @stack.pop
    end
    
    def peek
        @stack.last
    end

    def min_peek
        @min_stack.last
    end

    def is_empty
        @min_stack.empty?
    end
end

class My_Queue
    def initialize
        @in_stack = []
        @out_stack = []
    end

    def push(x)
        @in_stack.push x
    end

    def pop
        peek
        return @out_stack.pop
    end

    def peek
        if @out_stack.empty?
            while !@in_stack.empty?
                @out_stack.push @in_stack.pop
            end
        end
        return @out_stack.last
    end

    def is_empty
        @in_stack.empty? == @out_stack.empty?
    end
end

class My_Stack
    def initialize
        @queue = []
    end

    def push(x)
        @queue.prepend x
        size = queue.size
        while size > 1
            @queue.prepend (queue.pop)
            size -= 1
        end
    end

    def peek
        return -1 if @queue.empty?
        @queue[-1]
    end

    def pop
        return -1 if @queue.empty?
        @queue.pop
    end

    def is_empty
        @queue.empty?
    end
end
#End of Class Metods

#ListNode -> int
def find_middle(head)
    return 0 if head == nil

    fast = head
    slow = head

    while fast != nil and fast._next != nil
        fast = fast._next._next
        slow = slow._next
    end
    slow.val
end

#ListNode -> void
def reverse_linked_list(head)

    current = head
    prev = nil

    while current
        _next = current._next
        current._next = prev
        prev = current
        current = _next
    end
    help_print2 prev
end

#ListNode -> int
def sum_linked_list(head)
    return 0 unless head

    current = head
    sum = 0

    while current
        sum += current.val
        current = current._next
    end
    sum
end

#Helper methods
def help_print(name)
    puts
    puts "-----------------------------------------------------------"
    puts "--#{name}--"
    puts "-----------------------------------------------------------"
    puts
end

def help_print2(head)
    current = head
    while current
        print("#{current.val} -> ")
        current = current._next
    end
    puts "null"
    puts
end


#Executable code
head = ListNode.new(0)
current = head


for i in 0..10
    random_number = rand(10)

    current._next = ListNode.new(random_number)
    current = current._next
end

head = head._next

help_print "Linked List Methods"

puts "Middle of the Linked List: #{find_middle(head)}"
puts

puts "Sum of the Linked List: #{sum_linked_list(head)}"
puts

puts "The Linked List"
help_print2 head

puts "The Linked List Reversed"
reverse_linked_list head

help_print "Min Stack"

min_stack = Min_Stack.new

puts "min_stack.is_empty = #{min_stack.is_empty}"
puts
puts "Min Stack filled with min_stack.push in for loop:"
print "["

for i in 0...15
    min_stack.push rand(10)
    if i == 14
        print min_stack.peek
    else
        print "#{min_stack.peek}, "
    end
end

puts "] <-> IN/OUT"
puts

puts "min_stack.peek = #{min_stack.peek}"
puts

puts "min_stack.min_peek = #{min_stack.min_peek}"
puts

puts "min_stack.pop = #{min_stack.pop}"
puts "min_stack.pop = #{min_stack.pop}"
puts "min_stack.pop = #{min_stack.pop}"

map = { hello: "hello", funky: 7, 7 => false}
map[1738] = "love"

puts map

17.times { |x| map[x] = x+x }
# Hello 
puts map
