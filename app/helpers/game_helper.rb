module GameHelper
	class GameState
		BOARD_LENGTH = 5
		BOARD_WIDTH = 5

		def get_board
			@board
		end

		def get_player_moves
			@player_moves
		end

		def set_board(board)
			@board = board
		end

		def set_player_moves(putt)
			@player_moves = putt
		end

		def init(possible_moves)
			@board = [[],[],[],[],[]]
			@player_moves = [[],[],[],[],[]]
			for x in 0..4
				for y in 0..4
					@board[x] << possible_moves.sample
				end
			end
			for x in 0..4
				for y in 0..4
					@player_moves[x] << nil
				end
			end
			self
		end

		def check_move(move)
			for x in 0..4
				for y in 0..4
					if move == @board[x][y]
						return true
					end
				end
			end
			return false
		end

		def make_move(move)
			puts "#{@player_moves}"
			for x in 0..4
				for y in 0..4
					if move == @board[x][y]
						@player_moves[x][y] = 'X'
					end
				end
			end
			puts "#{@player_moves}"
		end

		def check_horizontal_for_bingo()
			for x in 0..4
				check = [0,0,0,0,0]

				for y in 0..4
					if @player_moves[x][y] == 'X'
						check[y] = 1
					end
				end

				if check == [1,1,1,1,1]
					return true
				end
			end
			return false
		end

		def check_vertical_for_bingo()
			for y in 0..4
				check = [0,0,0,0,0]

				for x in 0..4
					if @player_moves[x][y] == 'X'
						check[x] = 1
					end
				end

				if check == [1,1,1,1,1]
					return true
				end
			end
			return false
		end

		def check_diagonal_down_for_bingo()
			x = 4
			y = 0
			check = [0,0,0,0,0]

			for check_element in 0..4
				if @player_moves[x][y] == 'X'
					check[y] = 1
				end
			x = x - 1
			y = y + 1
			end

			if check == [1,1,1,1,1]
				return true
			end
			return false
		end

		def check_diagonal_up_for_bingo()
			x = 0
			y = 4
			check = [0,0,0,0,0]

			for check_element in 0..4
				if @player_moves[x][y] == 'X'
					check[y] = 1
				end
			x = x + 1
			y = y - 1
			end

			if check == [1,1,1,1,1]
				return true
			end
			return false
		end

		def check_for_bingo()
			check_for_bingo = false
			horz = check_horizontal_for_bingo
			vert = check_vertical_for_bingo
            diagUp = check_diagonal_up_for_bingo
            diagDown = check_diagonal_down_for_bingo
            if horz == true || vert == true || diagUp == true || diagDown == true
            	check_for_bingo = true
            end
		end

	end	
end

