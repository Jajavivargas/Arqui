# Adapter Pattern
# Date: 07-Apr-2022
# Authors:
#          A01376364 Alex Serrano Durán
#          A01377718 Javier Alexandro Vargas Sánchez

# File: adapter_test.rb
# File: adapter_test.rb 

require 'minitest/autorun'
require './simple_queue'
require './queue_adapter'

#This class models a QueueAdapterTest which inherits from the Minitest::Test class
class QueueAdapterTest < Minitest::Test

  #This method tests our QueueAdapter class to check our implementation is working properly
  def test_queue_adapter
    q = SimpleQueue.new
    qa = QueueAdapter.new(q)
    assert q.empty?
    assert qa.empty?
    assert_nil qa.pop
    assert_same qa, qa.push("Foo")
    assert_equal "Foo", qa.peek
    refute q.empty?
    refute qa.empty?
    assert_same qa, qa.push("Bar")
    assert_equal "Bar", qa.peek
    assert_same qa, qa.push("Baz").push("Quux")
    assert_equal 4, q.size
    assert_equal 4, qa.size
    assert_equal "Quux", qa.peek
    assert_equal "Quux", qa.pop
    assert_equal "Baz", qa.peek
    assert_equal "Baz", qa.pop
    assert_equal "Bar", qa.peek
    assert_equal "Bar", qa.pop
    assert_equal "Foo", qa.peek
    assert_same qa, qa.push("Goo")
    assert_equal "Goo", qa.peek
    assert_equal "Goo", qa.pop
    assert_equal "Foo", qa.peek
    assert_equal 1, qa.size
    assert_equal "Foo", qa.pop
    assert_nil qa.peek
    assert_nil qa.pop
    assert q.empty?
    assert qa.empty?
    assert_equal 0, q.size
    assert_equal 0, qa.size
  end
end