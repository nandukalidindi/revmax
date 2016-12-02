class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    persist_events
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def prepare_all_events
      events = []
      url = "https://graph.facebook.com/v2.8/#{params[:page]}/events?access_token=EAACEdEose0cBADKcRU6IGSldoFXa7PDsO34BArzuZAedWElWEN061eqKeZCSpVB1KLUBZBnv9Qk5wS02OpvWczRLp3wXwbuslCoGd4ZBDaaoRnFfY0YW27UEoPrAVXrn5DGiPqkLHioISaiX2uBlOpzwmHY9J0cuAQZBjPBnecgZDZD&debug=all&format=json&method=get&pretty=0&suppress_http_code=1"
      while true && url != nil
        response = HTTParty.send(:get, url, {})
        response = HashWithIndifferentAccess.new(response)
        events << response[:data]
        if response[:data].empty?
          break
        end
        url = response[:paging][:next]
      end
      events.flatten
    end

    def persist_events
      prepare_all_events.each do |x|
        Event.find_or_create_by(description: x.try(:[], :name), page: x.try(:[], :place).try(:[], :name))
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      # params.require(:event).permit(:description, :page)
      {}
    end
end
