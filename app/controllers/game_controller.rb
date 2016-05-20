class GameController < ApplicationController
	@@possible_moves = []
	@@game = GameHelper::GameState.new.init(@@possible_moves)
	def index()
		possible_moves = []
		for x in 0..99
			possible_moves << Faker::Name.first_name
		end
		@@possible_moves = possible_moves
		if params[:new_game]
            @@game = GameHelper::GameState.new.init(@@possible_moves)
		end
		@board = @@game.get_board()
		@player_moves = @@game.get_player_moves()
		@move_made = ''
		@message = ''
		@game_over = false
	
	end

	def make_move()
		params_move = params[:move]
		final_move = ''
		params_move_i = params_move.to_i
		for x in 0..params_move_i
			final_move = @@possible_moves.sample
		end

		if @@game.check_move(final_move) == true
			@@game.make_move(final_move)
		end

		@board = @@game.get_board
		@player_moves = @@game.get_player_moves
		@move_made = final_move
		@game_over == false

		check_for_win = @@game.check_for_bingo

		if check_for_win == true
			@message = 'Bingo! You won!'
			@game_over == true
		end

        render :index
	end
end
