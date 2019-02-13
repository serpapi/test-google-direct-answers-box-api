describe "SerpApi JSON" do

  describe "Currency convertor answer box for How much is 100 euros in us dollars?" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?q=How+much+is+100+euros+in+us+dollars%3F&location=Dallas&hl=en&gl=us&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains answer box object" do
      expect(@json["answer_box"]).to be_an(Hash)
    end

    it "contains proper currency converter type" do
      expect(@json["answer_box"]["type"]).to eq "currency_converter"
    end

    it "contains currency converter result" do
      expect(@json["answer_box"]["result"]).to include "United States Dollar"
    end

  end


end