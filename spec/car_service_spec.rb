describe "SerpApi JSON" do

  describe "Google Flights answer box for \"How long should a car service take?\"" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=How+long+should+a+car+service+take%3F&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains answer box object" do
      expect(@json["answer_box"]).to be_an(Hash)
    end

    it "contains proper currency converter type" do
      expect(@json["answer_box"]["type"]).to eq "organic_result"
    end

    it "has title" do
      expect(@json["answer_box"]["title"]).to be_a(String)
      expect(@json["answer_box"]["title"]).to_not be_empty
    end

    it "has date" do
      expect(@json["answer_box"]["date"]).to be_a(String)
      expect(@json["answer_box"]["date"]).to_not be_empty
    end

    it "has link" do
      expect(@json["answer_box"]["link"]).to be_a(String)
      expect(@json["answer_box"]["link"]).to_not be_empty
    end

    it "has snippet" do
      expect(@json["answer_box"]["snippet"]).to be_a(String)
      expect(@json["answer_box"]["snippet"]).to_not be_empty
    end

    it "has thumbnail" do
      expect(@json["answer_box"]["thumbnail"]).to be_a(String)
      expect(@json["answer_box"]["thumbnail"]).to_not be_empty
    end

  end

end