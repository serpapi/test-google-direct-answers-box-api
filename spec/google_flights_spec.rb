describe "SerpApi JSON" do

  describe "Google Flights answer box for flights for SFO" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=flights+for+SFO+&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains answer box object" do
      expect(@json["answer_box"]).to be_an(Hash)
    end

    it "contains proper currency converter type" do
      expect(@json["answer_box"]["type"]).to eq "google_flights"
    end

    it "title" do
      expect(@json["answer_box"]["title"]).to be_an(String)
      expect(@json["answer_box"]["title"]).to_not be_empty
    end

    it "link" do
      expect(@json["answer_box"]["link"]).to be_an(String)
      expect(@json["answer_box"]["link"]).to_not be_empty
    end

    it "displayed_link" do
      expect(@json["answer_box"]["displayed_link"]).to be_an(String)
      expect(@json["answer_box"]["displayed_link"]).to_not be_empty
    end

    it "flights" do
      expect(@json["answer_box"]["flights"]).to be_an(Array)
      expect(@json["answer_box"]["flights"]).to_not be_empty
    end

    it "flights[0]" do
      expect(@json["answer_box"]["flights"][0]).to be_an(Hash)
      expect(@json["answer_box"]["flights"][0]).to_not be_empty
    end

    it "flights[0][link]" do
      expect(@json["answer_box"]["flights"][0]["link"]).to be_an(String)
      expect(@json["answer_box"]["flights"][0]["link"]).to_not be_empty
    end

    it "flights[0][info]" do
      expect(@json["answer_box"]["flights"][0]["flight_info"]).to be_an(Array)
      expect(@json["answer_box"]["flights"][0]["flight_info"]).to_not be_empty
    end

  end

end