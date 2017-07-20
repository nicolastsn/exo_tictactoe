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

		h = []
		v = [[],[],[]]
		d = [[],[]]
		a = @cases[0].keys

		@cases.each_with_index do |c, i|  
			v.each_index { |i| v[i] << c[a[i]].tag } 

		 	h << c.values.map { |e| e.tag }  
		 	d[0] << c[a[i]].tag
		 	d[1] << c[a[2-i]].tag 
		end

		lines = h + v + d
			
		lines.each do |l|
		 	return true if !l.include?(" ") && l.uniq.length == 1
		end

		false

	end
	


	def render
		s =  "     A B C\n"
		@cases.each_with_index do |c, i|
			s += "   #{i+1}|#{c[:A].tag} #{c[:B].tag} #{c[:C].tag}|\n"

		end
		s
	end

end