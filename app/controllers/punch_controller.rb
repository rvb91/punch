class PunchController < ApplicationController
  # GET /go
  def go
    @teachers = User.all
  end

  
  # POST /go
  def submit_go
    teacher = User.find(params[:id])
    event = teacher.clock_in_out
    
    if event.clockout_time
      msg = "Goodbye. #{teacher.name} successfully clocked out"
    else
      msg = "Welcome. #{teacher.name} successfully clocked in"
    end

    redirect_to go_punch_index_path, flash: {info: msg}
  end
end