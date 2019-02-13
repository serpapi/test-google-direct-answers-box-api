describe "SerpApi JSON" do

  describe "Weather answer box for What's the weather in Dallas?" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=What%27s+the+weather+in+Dallas%3F&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains answer box object" do
      expect(@json["answer_box"]).to be_an(Hash)
    end

    it "contains proper weather type" do
      expect(@json["answer_box"]["type"]).to eq "weather_result"
    end

    it "contains weather result" do
      expect(@json["answer_box"]["result"]).to eq  "Mostly Cloudy"
    end

  end


end