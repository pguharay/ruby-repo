#!/usr/bin/ruby

require 'test/unit'
require 'fibonacci'

class Fibonacci_test < Test::Unit::TestCase
  
  def test_fibonacci_seq_10
    sequence = fibonacci(10)
    assert_equal(sequence.size(),10, "sequence length ok") 
    
    expected_sequence = [0,1,2,3,5,8,13,21,34,55 ]
    
  (0 .. 10).each{|i|
    assert_equal(expected_sequence[i],sequence[i],"sequence ok")
  }
  end
  
  def test_fibonacci_seq_nil
    assert_raise(RuntimeError){
      fibonacci(nil)
    }
  end
  
  def test_fibonacci_1
    sequence = fibonacci(1)
    assert_equal(sequence.size(),1, "sequence length ok") 
  end   
  
  def test_fibonacci_negetive_1
    assert_raise(RuntimeError){
          fibonacci(-1)
    }
  end 
  
end