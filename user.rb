class User

  def initialize(array)
    @user_array = array
  end


	def map(&block)
	  result = []
	  each do |element|
	    #result << block.call(element)
	    result << element if yield(element)
	  end
	  result
	end

  def each(&block)
    @user_array.each(&block)
  end

end


user_array_instance = User.new(%w[maks1 vanya1 sasha3 foo2 boo1])
user_array_instance.map {|n| puts n}



