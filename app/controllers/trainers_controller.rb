class TrainersController < ApplicationController
  before_filter :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
    puts @trainer.pokemons
    @pokemons = @trainer.pokemons
    curr_train=current_trainer
    @logged_in= (curr_train==@trainer)
  end

end
