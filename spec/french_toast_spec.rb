describe "SerpApi JSON" do

  describe "Google dictionary result answer box for \"French Toast Recipe\"" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=French%20Toast%20Recipe&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains answer box object" do
      expect(@json["answer_box"]).to be_an(Hash)
    end

    it "contains proper organic_result type" do
      expect(@json["answer_box"]["type"]).to eq "organic_result"
    end

    it "has type" do
      expect(@json["answer_box"]["type"]).to be_a(String)
      expect(@json["answer_box"]["type"]).to_not be_empty
    end

    it "has title" do
      expect(@json["answer_box"]["title"]).to be_a(String)
      expect(@json["answer_box"]["title"]).to_not be_empty
    end

    it "has link" do
      expect(@json["answer_box"]["link"]).to be_a(String)
      expect(@json["answer_box"]["link"]).to_not be_empty
    end

    it "has snippet" do
      expect(@json["answer_box"]["snippet"]).to be_a(String)
      expect(@json["answer_box"]["snippet"]).to_not be_empty
    end

    it "has list" do
      expect(@json["answer_box"]["list"]).to be_a(Array)
      expect(@json["answer_box"]["list"]).to_not be_empty
    end

    it "has refinements" do
      expect(@json["answer_box"]["refinements"]).to be_a(Array)
      expect(@json["answer_box"]["refinements"]).to_not be_empty
    end

    it "has thumbnail" do
      expect(@json["answer_box"]["thumbnail"]).to be_a(String)
      expect(@json["answer_box"]["thumbnail"]).to_not be_empty
    end


  end

end