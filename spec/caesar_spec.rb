require_relative "../caesar_cipher"

describe "#caesar_cipher" do
  context "with upper case" do
    it "returns ciphered upper case" do
      expect(caesar_cipher("What a string", 5)).to eql("Bmfy f xywnsl")
    end
  end

  context "without letters" do
    it "returns the same input" do
      expect(caesar_cipher(" !", 5)).to eql(" !")
      expect(caesar_cipher(" ", 5)).to eql(" ")
    end
  end

  context "when the factor is zero" do
    it "returns the same input" do
      expect(caesar_cipher("W!", 0)).to eql("W!")
    end
  end

  context "when the factor is greater than 26" do
    it "ciphers with the module of 26" do
      expect(caesar_cipher("What a string!", 57)).to eql("Bmfy f xywnsl!")
    end
  end

  context "when you want to play around" do
    it "returns the same input when called 2 times with 13" do
      expect(caesar_cipher(caesar_cipher("Yaay!", 13), 13)).to eql("Yaay!")
    end
  end
end