class MountainsController < ApplicationController
  def index
    matching_mountains = Mountain.all

    @list_of_mountains = matching_mountains.order({ :created_at => :desc })

    render({ :template => "mountains/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_mountains = Mountain.where({ :id => the_id })

    @the_mountain = matching_mountains.at(0)

    render({ :template => "mountains/show.html.erb" })
  end

  def create
    the_mountain = Mountain.new
    the_mountain.name = params.fetch("query_name")
    the_mountain.image = params.fetch("query_image")
    the_mountain.trips_count = params.fetch("query_trips_count")

    if the_mountain.valid?
      the_mountain.save
      redirect_to("/mountains", { :notice => "Mountain created successfully." })
    else
      redirect_to("/mountains", { :notice => "Mountain failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_mountain = Mountain.where({ :id => the_id }).at(0)

    the_mountain.name = params.fetch("query_name")
    the_mountain.image = params.fetch("query_image")
    the_mountain.trips_count = params.fetch("query_trips_count")

    if the_mountain.valid?
      the_mountain.save
      redirect_to("/mountains/#{the_mountain.id}", { :notice => "Mountain updated successfully."} )
    else
      redirect_to("/mountains/#{the_mountain.id}", { :alert => "Mountain failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_mountain = Mountain.where({ :id => the_id }).at(0)

    the_mountain.destroy

    redirect_to("/mountains", { :notice => "Mountain deleted successfully."} )
  end
end
