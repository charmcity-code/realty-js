class AppointmentsController < ApplicationController

  def new
    # nested routes - create a new appointment for a valid buyer
    #check for params[:buyer_id] and then for Buyer.exists? to see if the buyer is real
    if params[:buyer_id] && !Buyer.exists?(params[:buyer_id])
      redirect_to buyers_path
    else
      @appointment = Appointment.new(buyer_id: params[:buyer_id])
    end
  end

  def create
    # convert params[:appointment][:date] into Ruby date/time
    params[:appointment][:date] = Chronic.parse(params[:appointment][:date])
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      flash[:message] = "Oops! Something went wrong."
      redirect_to new_appointment_path
    end
  end

  def edit
    @appointment = Appointment.find_by(id: params[:id])
  end

  def index
    # access index of all appointments for a certain buyer
    if params[:buyer_id]
      @appointments = Buyer.find(params[:buyer_id]).appointments.order('date ASC')
    else
      # access the index of all appointments, order by date ascending
      @appointments = Appointment.order('date ASC')
    end
  end

  def update
    # convert params[:appointment][:date] into Ruby date/time
    params[:appointment][:date] = Chronic.parse(params[:appointment][:date])
    @appointment = Appointment.find_by(id: params[:id])
    @appointment.update(appointment_params)
    redirect_to appointment_path(@appointment)
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
  end

  def destroy
    Appointment.find(params[:id]).destroy
    flash[:notice] = "Appointment deleted"
    redirect_to appointments_path
  end

   private

  def appointment_params
    params.require(:appointment).permit(:listing_street, :date, :buyer_id)
  end

end