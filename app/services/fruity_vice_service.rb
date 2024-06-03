class FruityViceService
    def self.search_by_name(query)
        search_by_url("api/fruit/#{query}")
    end

    def self.search_by_calories(query)
        search_by_url("api/fruit/calories?min=#{query.to_i - 5}")
    end

    private

    def self.search_by_url(url)
        response = conn.get(url)
        JSON.parse(response.body, symbolize_names: true)
    end

    def self.conn
        Faraday.new(url: "https://www.fruityvice.com/")
    end
end