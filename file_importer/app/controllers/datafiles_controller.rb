class DatafilesController < ApplicationController
  before_action :set_datafile, only: [:show, :edit, :update, :destroy]

  def index
    @datafiles = Datafile.all
  end

  def show
  end

  def new
    @datafile = Datafile.new
  end

  def edit
  end

  # POST /datafiles
  def create
    @datafile = Datafile.new(datafile_params)

    if @datafile.save
      redirect_to @datafile, notice: 'Datafile was successfully created.'
    else
      render :new
    end
  end

  def update
    if @datafile.update(datafile_params)
      redirect_to @datafile, notice: 'Datafile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @datafile.destroy
    redirect_to datafiles_url, notice: 'Datafile was successfully destroyed.'
  end

  private
    def set_datafile
      @datafile = Datafile.find(params[:id])
    end

    def datafile_params
      params.require(:datafile).permit(:filename)
    end
end
