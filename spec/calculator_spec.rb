describe "SerpApi JSON" do

  describe "Calculator answer box for PI" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=PI&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains answer box object" do
      expect(@json["answer_box"]).to be_an(Hash)
    end

    it "contains proper calculator type" do
      expect(@json["answer_box"]["type"]).to eq "calculator_result"
    end

    it "contains calculator result" do
      expect(@json["answer_box"]["result"]).to eq  "3.141592653589793"
    end

  end


end