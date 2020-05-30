class AppointmentsController < ApplicationController

  def list 
    if params[:date]
      @date = params[:date]
      @tomorrow = @date.to_date.tomorrow.strftime("%Y-%m-%d")
      @yesterday = @date.to_date.yesterday.strftime("%Y-%m-%d")
    else
  	  @date = Time.now.strftime("%Y-%m-%d")
  	  @tomorrow = Time.now.tomorrow.strftime("%Y-%m-%d")
  	  @yesterday = Time.now.yesterday.strftime("%Y-%m-%d")
  	end
    @appointments =  Appointment.where(appointment_date: @date).order(:start, :end)
    render layout: 'standalone'
  end

  def index
  	@date = Time.now.strftime("%Y-%m-%d")
  	@tomorrow = Time.now.tomorrow.strftime("%Y-%m-%d")
  	@yesterday = Time.now.yesterday.strftime("%Y-%m-%d")
  end

  def show 
  	@laboratory = Laboratory.find(params[:id])
  	@date = params[:date]
  	@tomorrow = @date.to_date.tomorrow.strftime("%Y-%m-%d")
  	@yesterday = @date.to_date.yesterday.strftime("%Y-%m-%d")
  end

  def new
  	@laboratory = Laboratory.find(params[:laboratory_id])
  	@date = params[:date]
  	@appointment = @laboratory.appointments.new
  end

  def create
    @laboratory = Laboratory.find(params[:appointment][:laboratory_id])
    @appointment = @laboratory.appointments.new(appointment_params)
    @appointment.status = Appointment::PROGRAMMED
    @appointment.user_id = current_user.id
    if @appointment.save
      redirect_to "/laboratorios/#{@laboratory.id}/#{@appointment.appointment_date}", notice: 'Cita agregada'
    else
      redirect_to "/laboratorios/#{@laboratory.id}/#{@appointment.appointment_date}", notice: 'Error al agregar cita'
    end
  end

  def mark
    @appointment = Appointment.find(params[:id])
    @appointment.status = params[:status]
    if @appointment.save
      redirect_to "/laboratorios/#{@appointment.laboratory_id}/#{@appointment.appointment_date}", notice: 'Cita actualizada'
    else
      redirect_to "/laboratorios/#{@@appointment.laboratory_id}/#{@appointment.appointment_date}", notice: 'Error al actualizar cita'
    end
  end

  private
  def appointment_params
      params.require(:appointment).permit(:laboratory_id, :start, :end, :appointment_date, :student_id, :notes)
    end

end
