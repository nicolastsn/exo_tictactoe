require './Player.rb'
require './Board.rb'



class Game

 	def initialize
 		@board = Board.new

 		puts "Entrez le nom du joueur X :"
 		@playerX = Player.new gets.chomp

 		puts "Entrez le nom du joueur O :"
 		@playerO = Player.new gets.chomp

 		
 	end




 	
 	def run
 		
 		print @board.render

 		begin 
 			puts "---------------"
 			current_player = (current_player == @playerX ? @playerO : @playerX)
 			puts "Tour de #{current_player.name}, choisissez une case(ex: A1) :"
 			b = false
 			until b
 				
 				unless b = gets.chomp.upcase.match(/\s*([A-C])\s*([1-3])\s*/)
 					puts "Erreur, entrez des coordonnées valides :"
 				else
 					if current_player == @playerX 
 						b = @board.tagX($1, $2)
 					else 
 						b = @board.tagO($1, $2)
 					end
 					
 					puts "Choisissez une autre case :" unless b 
 						
 				end
 			end 
 			puts "---------------"
 			print @board.render
 		end until @board.winner?
 		puts "---------------"
 		puts "Le gagnant est #{current_player.name}"
 	end
end