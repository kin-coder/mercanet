class MercanetsController < ApplicationController

  protect_from_forgery except: :reponse_transaction

  def affichage_format

    # Génère un numéro de transaction aléatoire
    transactionReference = "simu" + rand(100000..999999).to_s

    #Construit l'URL de retour pour récupérer le résultat du paiement sur le site e-commerce du marchand
    normalReturnUrl = "https://28196749.ngrok.io/retour_transaction"

    # Contruit la requête des données à envoyer à Mercanet
    @data = "amount=100|currencyCode=978|merchantId=002001000000001|normalReturnUrl=" + normalReturnUrl + "|transactionReference=" + transactionReference + "|keyVersion=1"

    # Encode en UTF-8 des données à envoyer à Mercanet
    dataToSend = (@data).encode('utf-8')


    # Clé secrète correspondant au merchandId de simulation
    secretKey = "002001000000001_KEY1"


    # Calcul du certificat par un cryptage SHA256 des données envoyées suffixé par la clé secrète
    @seal = Digest::SHA256.hexdigest dataToSend + secretKey    # MILA JERANA !!

  end

  def reponse_transaction
    p "#################################################################"
    p params['Data']
    p "#################################################################"
  end

end
