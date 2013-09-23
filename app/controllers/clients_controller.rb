class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  def index
   

    session[:current] = 'menu_clients'
    if params[:clientid].nil? || params[:clientid].to_s.empty?
      @clients = Client.all
      session[:clientid] = 0
    else
      @clients = Client.where(:id=>params[:clientid])
      session[:clientid] = params[:clientid]
    end
    
    session[:history] = 'current'
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  def download
    @client = Client.find(params[:id])
    
    if params[:type].to_s.downcase == 'baa'
      if params[:version].nil?
        baa_record = @client.baafiles.last
      else
        baa_record = Baafile.where(:client_id => @client.id, :version => params[:version]).last
      end
      send_data baa_record.file.read,  :disposition => "inline", :type => "application/pdf", :filename => "#{@client.name}_BAA_V#{baa_record.version}.pdf"
    end
    
    if params[:type].to_s.downcase == 'nda'
      if params[:version].nil?
        nda_record = @client.ndafiles.last
      else
        nda_record = Ndafile.where(:client_id => @client.id, :version => params[:version]).last
      end
      send_data nda_record.file.read,  :disposition => "inline", :type => "application/pdf", :filename => "#{@client.name}_NDA_V#{baa_record.version}.pdf"
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    session[:current] = 'menu_clients'
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    session[:current] = 'menu_clients'
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])
    if session[:user].nil? 
       redirect_to :controller => "login", :action => "new"
    else
      @client.updated_by = session[:user]
    end

    respond_to do |format|
      if @client.save
        format.html { redirect_to new_contract_path(:client_id=>@client.id), notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])
    if session[:user].nil? 
       redirect_to :controller => "login", :action => "new"
    else
      @client.updated_by = session[:user]
    end

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to clients_path(:clientid => @client.id), notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :ok }
    end
  end
end
