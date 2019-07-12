  class Stack
    def initialize
      # create ivar to store stack here!
      @stack = Array.new(0)
    end

    def push(el)
      # adds an element to the stack
      @stack.push(el)
    end

    def pop
      # removes one element from the stack
      @stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack[-1]
    end
  end

  kristina = Stack.new
  p kristina.push("miller")