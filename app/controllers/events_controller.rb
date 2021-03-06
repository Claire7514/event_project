class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new('title' => params[:title], 
      'description' => params[:description],
      'duration' => params[:duration],
      'start_date' => params[:start_date],
      'price' => params[:price],
      'location' => params[:location],
      'manager_id' => current_user.id) #à revoir pour heroku, fonctionne en local
    
    # J'ajoute une image 
    #@event.picture.attach(params[:picture])
    
    if @event.save
      puts "The event was succesfully saved !"
      flash[:success] = "Evènement créé !"
      redirect_to '/'
    else
      puts "Error : create problem"
      flash[:danger] = "Erreur dans la création de l'évènement (date passée ou durée pas multiple de 5) !"
      render '/events/new'
    end
  end
end
