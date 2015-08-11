require 'thread'

class Philosopher
  attr_reader :name, :done, :left, :right

  def initialize(name, done, left, right)
    @name = name
    @done = done
    @left = left
    @right = right
  end

  def done
    "#{@name} is done eating."

    # send message to parent thread of doneness
  end

  def eat(table)
    left_hand = table.forks[@left].lock
    right_hand = table.forks[@right].lock

    sleep 1
    done
  end
end

class Table
  attr_reader :forks

  def initialize(forks)
    @forks = forks
  end
end

class Diner
  def self.serve
    table = Table.new([
        Mutex.new,
        Mutex.new,
        Mutex.new,
        Mutex.new,
        Mutex.new
    ])

    philosophers = [
      Philosopher.new("Tony", false, 0, 1),
      Philosopher.new("Steve", false, 1, 2),
      Philosopher.new("Alex", false, 2, 3),
      Philosopher.new("Gretchen", false, 3, 4),
      Philosopher.new("Brianna", false, 4, 0)
    ]

    threads = []
    results = []

    philosophers.each do |phil|
      threads << Thread.new do
        results << phil.eat(table)
      end
    end

    threads.each do |thread|
      thread.join
    end

    results
  end
end