class Stock < ApplicationRecord


    has_many :user_stocks
    has_many :stocks, through: :user_stocks 

    validates :ticker, :name , presence: true

    def self.new_lookup(name)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
             secret_token: Rails.application.credentials.iex_client[:sandbox_api_key],
            # secret_token: 'sk_04e7097fec3244d9b974ce18f443bdd8',
            endpoint: 'https://cloud.iexapis.com/v1'
          )

            # client.price(name)
    
        begin
            new(ticker: name, name: client.company(name).company_name, last_price:  client.price(name))
        rescue => exception
            nil 
        end
    end

    def self.check_db(ticker)
        Stock.where(ticker: ticker).first
      
    end
end
