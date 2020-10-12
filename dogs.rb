class Dog

# def initialize(name, age)
# 	@name = name
# 	@age = age
# end

def set_name(aname)
begin
	@name = aname
fail ArgumentError, "My dog has this name."	if @name == "Benzy"
#raise ArgumentError, "My dog has this name."	if @name == "Benzy" 
rescue => mes
	p mes
	p mes.class
	p mes.backtrace
	p mes.message
end
end

def set_age(age)
	@age = age
end

def dogs_name
	@name
end

def dogs_age
	"#{@name}: I'm #{@age}"
end


def gaf
	"#{@name}: GAF-GAF"
end

end

dog = nil
p dog&.gaf

dog1 = Dog.new
dog1.set_name('Fido')
dog1.set_age(10)
puts dog1.dogs_name
puts dog1.dogs_age
puts dog1&.gaf


dog2 = Dog.new
dog2.set_name('Benzy')
dog2.set_age(5)


puts dog2.dogs_name
puts dog2.dogs_age
puts dog2.gaf


