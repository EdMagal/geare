class GruController < ApplicationController
  before_action :set_gru, only: [:show, :edit, :update, :destroy, :pagamento]

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

  # POST
  def pagamento
    apiUrl = 'https://valpagtesouro.tesouro.gov.br/api/gru/solicitacao-pagamento'
    apiHeader = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json',
      'Authorization' => 'Bearer ' + ENV['TEST_TOKEN']
    }
    raise
    response = HTTParty.post(
      url,
      :headers => {'cache-control': 'no-cache','content-type': 'application/json'},
      :body => {"mfkep":"some text"}.to_json
    )
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
