class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    appointment_areas
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Το ραντεβού δημιουργήθηκε με επιτυχία.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      appointment_areas
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Το ραντεβού άλλαξε με επιτυχία.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Το ραντεβού διαγράφηκε με επιτυχία.' }
      format.json { head :no_content }
    end
  end

  def client_appointments
    client = Client.find(params[:id])
    @appointments = client.appointments
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:price, :client_id, :date, :notes, areas_attributes: [:id])
    end

    # Couldn't find out what's wrong with nested attributes - doing it 'manually'
    def appointment_areas
      ids = params[:appointment][:areas][:id].map(&:to_i)
      ids.pop if ids[-1] == 0

      unless ids.empty?
        @appointment.appointment_areas.destroy_all
        @appointment_areas = @appointment.appointment_areas.build
        
        ids.each do |id|
          @appointment.appointment_areas.build(area_id: id)
        end
      end
    end
end
