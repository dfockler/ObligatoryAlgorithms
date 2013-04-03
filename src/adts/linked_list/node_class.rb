class Node
	attr_reader :value, :ref
	attr_accessor :value, :ref

	def initialize(value, ref)
		@value = value
		@ref = ref
	end
end