class DataFilesController < ApplicationController
  before_action :set_data_file, only: [:show, :edit, :update, :destroy, :records]

  # GET /data_files
  def index
    @data_files = DataFile.all
  end

  def records
  end

  # GET /data_files/1
  def show
  end

  # GET /data_files/new
  def new
    @data_file = DataFile.new
  end

  # GET /data_files/1/edit
  def edit
  end

  # POST /data_files
  def create
    @data_file = DataFile.new(filename: params[:file].original_filename)

    if @data_file.save
      Record.import(@data_file, params[:file])
      redirect_to @data_file, notice: 'Data file was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /data_files/1
  def update
    if @data_file.update(data_file_params)
      redirect_to @data_file, notice: 'Data file was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /data_files/1
  def destroy
    @data_file.destroy
    redirect_to data_files_url, notice: 'Data file was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_file
      @data_file = DataFile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def data_file_params
      params.require(:data_file).permit(:filename)
    end
end
