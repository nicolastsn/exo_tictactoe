require './BoardCase.rb'


class Board


	def initialize
		@cases = []
		3.times do 
			@cases << {
				:A => BoardCase.new, 
				:B => BoardCase.new,
				:C => BoardCase.new
			}
		end
	end


	def tagX x, y
		c =  @cases[y.to_i - 1][x.to_sym]
		c.tag = "X" if b = (c.tag == " ")
			
		b
	end	


	def tagO x, y
		c =  @cases[y.to_i - 1][x.to_sym]
		c.tag = "O" if b = (c.tag == " ")
			
		b
	end		

	


	def winner?
		verticals = [[],[],[]]
		cases.each do |c| 

			verticals[0] 
			verticals[1]
			verticals[2]

			c = c.map { |e| e.tag }
			return true if !c.include?(" ") && c.uniq.length == 1 


		end
	end



	def render
		s =  "     A B C\n"
		@cases.each_with_index do |c, i|
			s += "   #{i+1}|#{c[:A].tag} #{c[:B].tag} #{c[:C].tag}|\n"

		end
		s
	end

end