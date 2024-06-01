class FruityViceService
    def self.search_by_name(query)
        response = conn.get("api/fruit/#{query}")
        JSON.parse(response.body, symbolize_names: true)
    end

    private

    def self.conn
        Faraday.new(url: "https://www.fruityvice.com/")
    end
end