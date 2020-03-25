class MercanetsController < ApplicationController

  def affichage_format

    # Génère un numéro de transaction aléatoire

    #$transactionReference = "simu" . rand(100000,999999);
    transactionReference = "simu" + rand(100000..999999).to_s

    #Construit l'URL de retour pour récupérer le résultat du paiement sur le site e-commerce du marchand

    #$normalReturnUrl = "https://www.marchand.com/normal_return.php";
    normalReturnUrl = "https://www.marchand.com/normal_return.php"

    # Contruit la requête des données à envoyer à Mercanet

    #$data = "amount=100|currencyCode=978|merchantId=211000021310001|normalReturnUrl=".$normalReturnUrl."|transactionReference=".$transactionReference."|keyVersion=1";
    @data = "amount=100|currencyCode=978|merchantId=211000021310001|normalReturnUrl=" + normalReturnUrl + "|transactionReference=" + transactionReference + "|keyVersion=1"

    # Encode en UTF-8 des données à envoyer à Mercanet

    #$dataToSend= utf8_encode($data);
    dataToSend = (@data).encode('utf-8')


    # Clé secrète correspondant au merchandId de simulation

    #secretKey = "S9i8qClCnb2CZU3y3Vn0toIOgz3z_aBi79akR30vM9o";
    secretKey = "S9i8qClCnb2CZU3y3Vn0toIOgz3z_aBi79akR30vM9o"


    # Calcul du certificat par un cryptage SHA256 des données envoyées suffixé par la clé secrète

    #$seal=hash('sha256', $dataToSend.$secretKey);
    @seal = Digest::SHA256.hexdigest dataToSend + secretKey    # MILA JERANA !!

  end

end
