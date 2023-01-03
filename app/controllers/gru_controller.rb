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

    apiBody = {
      "codigoServico": @gru.codigoServico,
      "referencia": @gru.referencia,
      "competencia": @gru.competencia,
      "vencimento": @gru.vencimento,
      "cnpjCpf": @gru.cnpjCpf,
      "nomeContribuinte": @gru.nomeContribuinte,
      "valorPrincipal": @gru.valorPrincipal,
      "valorDescontos": @gru.valorDescontos,
      "valorOutrasDeducoes": @gru.valorOutrasDeducoes,
      "valorMulta": @gru.valorMulta,
      "valorJuros": @gru.valorJuros,
      "valorOutrosAcrescimos": @gru.valorOutrosAcrescimos,
      "modoNavegacao": "2",
      "urlNotificacao": ""
    }.to_json

    response = HTTParty.post(
      apiUrl,
      :headers => apiHeader,
      :body => apiBody
    )

    render inline: "<iframe class='iframe-epag'
      src='#{response["proximaUrl"]}'
      scrolling='no'>
      </iframe>"
  end

  # READ
  def index
    @grus = Gru.all
    if user_signed_in?
      @user = current_user
      @grus = @grus.filter { |gru| gru.user_id == @user.id } unless current_user.admin
    end
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
