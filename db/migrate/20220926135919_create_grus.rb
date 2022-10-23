class CreateGrus < ActiveRecord::Migration[7.0]
  def change
    create_table :grus do |t|
      t.integer :codigoServico
      t.string :referencia
      t.string :competencia
      t.string :vencimento
      t.string :cnpjCpf
      t.string :nomeContribuinte
      t.integer :valorPrincipal
      t.integer :valorDescontos
      t.integer :valorOutrasDeducoes
      t.integer :valorMulta
      t.integer :valorJuros
      t.integer :valorOutrosAcrescimos
      t.string :urlRetorno
      t.string :urlNotificacao
      t.integer :modoNavegacao
      t.string :expiracaoPix
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
