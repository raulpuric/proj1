class PokemonsController < ApplicationController
	def capture
		poke=Pokemon.find(poke_params)
		poke.trainer=current_trainer
		if poke.save
			redirect_to root_path
		end
	end

	def poke_params
		params.require(:id)
	end
	def damage
		poke=Pokemon.find(poke_params)
		poke.health-=10
		if poke.health<=0
			poke.destroy
			redirect_to :back		
		elsif poke.save
			redirect_to :back
		end
	end
	def new
		@pokemon=Pokemon.new
		@error=params.require(:error)
		puts @error
	end	
	def create
		@pokemon=Pokemon.create(sanitize_poke)
		@pokemon.level=1
		@pokemon.health=100
		temp=current_trainer
		@pokemon.trainer=temp
		if @pokemon.save
			redirect_to trainer_path(id: temp)
		else
			if @pokemon.name!=""
				redirect_to new_pokemon_path(error: 2)
			else
				redirect_to new_pokemon_path(error: 1)
			end
		end
	end
	def sanitize_poke
		params.require(:pokemon).permit(:name)
	end
end
