class GruController < ApplicationController
  before_action :set_gru, only: [:show, :edit, :update, :destroy]

  # CREATE
  def new
    @gru = Gru.new
  end

  def create
    @gru = Gru.new(gru_params)
    if @gru.save
      redirect_to gru_path(@gru)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # READ
  def index
    @grus = Gru.all
    @user = current_user
  end

  def show
  end

  # UPDATE
  def edit
  end

  def update
  end

  # DELETE
  def destroy
  end

  private

  def gru_params
    params.require(:gru).permit(:codigoServico, :referencia, :competencia, :vencimento, :cnpjCpf, :nomeContribuinte, :valorDescontos, :valorOutrasDeducoes, :valorMulta, :valorJuros, :valorOutrosAcrescimos, :valorPrincipal)
  end

  def set_gru
    @gru = Gru.find(params[:id])
  end

end
