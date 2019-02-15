describe "SerpApi JSON" do

  describe "Google dictionary result answer box for \"What's the definition of transparent?\"" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=What%27s+the+definition+of+transparent%3F+&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains answer box object" do
      expect(@json["answer_box"]).to be_an(Hash)
    end

    it "contains proper dictionary_results type" do
      expect(@json["answer_box"]["type"]).to eq "dictionary_results"
    end

    it "has syllables" do
      expect(@json["answer_box"]["syllables"]).to be_a(String)
      expect(@json["answer_box"]["syllables"]).to_not be_empty
    end

    it "has phonetic" do
      expect(@json["answer_box"]["phonetic"]).to be_a(String)
      expect(@json["answer_box"]["phonetic"]).to_not be_empty
    end

    it "has word_type" do
      expect(@json["answer_box"]["word_type"]).to be_a(String)
      expect(@json["answer_box"]["word_type"]).to_not be_empty
    end

    it "has definitions" do
      expect(@json["answer_box"]["definitions"]).to be_a(Array)
      expect(@json["answer_box"]["definitions"]).to_not be_empty
    end

    it "has examples" do
      expect(@json["answer_box"]["examples"]).to be_a(Array)
      expect(@json["answer_box"]["examples"]).to_not be_empty
    end

    it "has extras" do
      expect(@json["answer_box"]["extras"]).to be_a(Array)
      expect(@json["answer_box"]["extras"]).to_not be_empty
    end

  end

end