# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Cria três usuários, sendo que um é administrador:

usersEmails = %w(admin@admin.com edu@edu.com alice@alice.com bob@bob.com)
usersPasswords = %w(123456 123456 123456 123456)
usersAdmin = [true, true, false, false]

usersEmails.each_with_index do |email, index|
  User.create(email: email, password: usersPasswords[index], admin: usersAdmin[index])
end


# Cria 5 GRU para cada usuário, exceto administrador
5.times do
  userId = User.all.reject(&:admin).sample.id
  userEmail = User.find(userId).email

  Gru.create(codigoServico: 841,
    referencia: "",
    competencia: "",
    vencimento: "",
    cnpjCpf: "03382821141",
    nomeContribuinte: userEmail.split("@").first,
    valorPrincipal: rand(10..100),
    valorDescontos: nil,
    valorOutrasDeducoes: nil,
    valorMulta: nil,
    valorJuros: nil,
    valorOutrosAcrescimos: nil,
    urlRetorno: nil,
    urlNotificacao: nil,
    modoNavegacao: nil,
    expiracaoPix: nil,
    status: 0,
    user_id: userId
  )

end
