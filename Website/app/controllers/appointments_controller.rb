class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.find(:all, :order=>'appot')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  
  def export_appointments
	@appointments = Appointment.find(params[:id])
	@calendar = Icalendar::Calendar.new
		event = Icalendar::Event.new
		event.start = @appointments.appot.strftime("%Y%m%dT%H%M%S")
		# event.end = @appointments.appot.strftime("%Y%m%dT%H%M%S")
		event.summary = @appointments.service + " - " +@appointments.last_name
		event.description = @appointments.message
		#event.location = “PUT HER ADDRESS HERE”
	@calendar.add event
	@calendar.publish
		headers['Content-Type'] = "text/calendar; charset=UTF-8"
		render :text => @calendar.to_ical
		#render_without_layout :text => @calendar.to_ical
  end
	
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(params[:appointment])

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to thanks_url, notice: 'Appointment was successfully created.' }
        format.json { render json: @appointment, status: :created, location: @appointment }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  #below was if we want to thanks page to list the appointment
  #def thanks
  #  @appointments = Appointment.find(:all, :order=>'appot')

  #  respond_to do |format|
  #    format.html # thanks.html.erb
  #    format.json { render json: @appointments }
  #  end
  #end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end

end
