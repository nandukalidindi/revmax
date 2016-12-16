class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.where(handle: params[:page])
    persist_complete_event_set if @events.count == 0
    @events
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
  #/{event-id}?fields=id,attending_count,can_guests_invite,category,cover,
  # declined_count,description,end_time,guest_list_enabled,interested_count,
  # is_canceled,is_page_owned,is_viewer_admin,maybe_count,name,noreply_count,
  # owner,parent_group,place,start_time,ticket_uri,timezone,type,updated_time
    def prepare_all_events
      events = []
      access_token = ConnectedApp.where(name: 'facebook').first.try(:access_token)
      url = "https://graph.facebook.com/v2.8/#{params[:page]}/events?access_token=#{access_token}&debug=all&format=json&method=get&pretty=0&suppress_http_code=1"
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

    def prepare_complete_event_set
      full_response = []
      ids = prepare_all_events.map { |x| x[:id] }
      access_token = ConnectedApp.where(name: 'facebook').first.try(:access_token)
      ids.each do |id|
        url = "https://graph.facebook.com/v2.8/#{id}?access_token=#{access_token}" +
               "&debug=all&fields=attending_count,can_guests_invite," +
               "category,cover,declined_count,description,end_time," +
               "guest_list_enabled,interested_count,is_canceled,is_page_owned," +
               "is_viewer_admin,maybe_count,name,noreply_count,owner,parent_group," +
               "place,start_time,ticket_uri,timezone,type,updated_time&" +
               "format=json&method=get&pretty=0&suppress_http_code=1"
        response = HTTParty.send(:get, url, {})
        response = HashWithIndifferentAccess.new(response)
        response[:fid] = response[:id]
        response[:handle] = params[:page]
        response.delete(:id)
        response.delete(:__debug__)
        full_response << response
      end
      full_response
    end

    def persist_complete_event_set
      prepare_complete_event_set.each do |x|
        if Event.where(start_time: x[:start_time], end_time: x[:end_time]).count == 0
          event = Event.new(x)
          event.save!
        end
      end
    end

    def persist_events
      prepare_all_events.each do |x|
        event = Event.find_or_create_by(description: x[:description],
                                        name: x[:name],
                                        start_time: x[:start_time],
                                        handle: params[:page])
        event.update_column(:place, x[:place])
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:description, :page)
    end
end
