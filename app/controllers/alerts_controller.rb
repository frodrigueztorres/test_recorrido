class AlertsController < ApplicationController
  before_action :set_alert, only: %i[ show edit update destroy ]
  before_action :set_cities, only: %i[ new edit ]

  # GET /alerts or /alerts.json
  def index
    @alerts = Alert.all
  end

  # GET /alerts/1 or /alerts/1.json
  def show
    @search_results = []

    7.times do |i|
      bus_travel = Recorrido::Api.bus_travel alert: @alert, date: @alert.updated_at + (i + 1).days

      if @alert.other?
        search_travel = Recorrido::Api.search_results(search_id: bus_travel[:search_id])[:outbound][:search_results]
                                      .min_by{|x| x[:price]}
      else
        search_travel = Recorrido::Api.search_results(search_id: bus_travel[:search_id])[:outbound][:search_results]
                                      .select{ |k| k[:seat_klass_stars] == @alert.bus_class_before_type_cast }
                                      .min_by{|x| x[:price]}
      end

      @search_results << search_travel if !search_travel.nil?
    end
  end

  # GET /alerts/new
  def new
    @alert = Alert.new
  end

  # GET /alerts/1/edit
  def edit
  end

  # POST /alerts or /alerts.json
  def create
    @alert = Alert.new(alert_params)

    respond_to do |format|
      if @alert.save
        format.html { redirect_to @alert, notice: "Alert was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1 or /alerts/1.json
  def update
    respond_to do |format|
      if @alert.update(alert_params)
        format.html { redirect_to @alert, notice: "Alert was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alerts/1 or /alerts/1.json
  def destroy
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to alerts_url, notice: "Alert was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alert_params
      params.require(:alert).permit(
        :name,
        :city_origin_id,
        :city_origin_name,
        :city_origin_url_name,
        :city_destination_id,
        :city_destination_name,
        :city_destination_url_name,
        :bus_class,
        :price
      )
    end

    def set_cities
      @cities = Recorrido::Api.get_cities[:cities].map { |c| [c[:name], c[:id], url_name: c[:url_name]] }
    end
end
