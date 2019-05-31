class TaggingsController < ApplicationController
  def new
    # Our route is nested, so we have something like this:
    # /plants/:plant_id/taggings/new

    # If the URL path looks confusing, try reading it like this (in reverse order):
    #                 I want
    # /new         <- a new tagging
    # /taggings    <- on the index of taggings
    # /:plant_id   <- of the plant that goes by id
    # /plants      <- in the index of plants

    # So we have to find the plant by the :plant_id we find in the URL
    @plant = Plant.find(params[:plant_id])
    #  We also need our new shiny Tagging our user is going to later create
    @tagging = Tagging.new
  end

  def create
    # We need the plant from the current path again.
    # But noticed how this repeats on both #new and #create? We could make this a set_plant
    # method tied to before_action on new and create.
    # Reminder: https://kitt.lewagon.com/knowledge/lectures/05-Rails%2F02-Rails-CRUD#/0/8/3
    @plant = Plant.find(params[:plant_id])

    # We now take a new Taggings again and fill it with the info the user selected on the form
    # Check the #tagging_params on the bottom of this controller to see what it's doing.
    @tagging = Tagging.new(tagging_params)

    # We need to then associate this new @tagging to the current @plant 
    # This is needed because the tagging_params has ONLY the params chosen by the user on the form
    @tagging.plant = @plant

    # We try to save the new tagging. This will be false if it doesn't pass the validation.
    if @tagging.save
      # If its saved, we take the user back to the garden to which the plant belongs
      redirect_to garden_path(@plant.garden)
    else
      # If it fails we render #new again, showing the form with some errors
      render :new
    end
  end

  private

  # The web is scary, so we need to allow the user to send only the information we permit
  def tagging_params
    params.require(:tagging).permit(:tag_id)
  end
end
