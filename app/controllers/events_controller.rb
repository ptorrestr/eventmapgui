class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @json = @events.to_gmaps4rails do |event, marker|
      marker.title "#{event.id}"
    end
    # This value is used to send to js reaload summary
    @summary = false 
    if params.has_key?(:id)
      @event = Event.find(params[:id])
      @tweets = @event.tweets.paginate(page: params[:page], per_page: 10)
      if params[:summary] == "true"
        #The parameter needs reaload summary, activate @summary and set false the parameter
        @summary = true
        params[:summary] = "false"
        @chart1 = LazyHighCharts::HighChart.new('graph') do |f|
          f.title({ :text=>"Keyword mentions"})
          f.options[:xAxis][:categories] = ['Mon', 'Tues', 'Weds', 'Thurs', 'Fri']      
          f.series(:type=> 'column',:name=> 'key1',:data=> [3, 2, 1, 3, 4])
          f.series(:type=> 'column',:name=> 'key2',:data=> [2, 3, 5, 7, 6])
          f.series(:type=> 'column', :name=> 'key3',:data=> [4, 3, 3, 9, 0])
          f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
        end
        @chart2 = LazyHighCharts::HighChart.new('pie') do |f|
          f.chart({:defaultSeriesType=>"pie"} )
          series = {
            :type=> 'pie',
            :name=> 'Browser share',
            :data=> [
              ['Key1',   45.0],
              ['Key2',   26.8],
              ['Key3',    8.5],
              ['Key4',     6.2],
              ['Key5',   0.7]
            ]
          }
          f.series(series)
          f.options[:title][:text] = "The keyword pie"
          f.plot_options(:pie=>{
            :allowPointSelect=>true, 
            :cursor=>"pointer" , 
            :dataLabels=>{
              :enabled=>true,
              :color=>"black",
              :style=>{
                :font=>"13px Trebuchet MS, Verdana, sans-serif"
              }
            }
          })
        end
      end
    end
    print ("EN INDEX")
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    def event_params
      params.require(:event).permit(:name, :address, :longitude, :latitude,
                                   :gmaps, :alert)
    end
end
