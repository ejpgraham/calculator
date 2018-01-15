require "calculator"

describe Calculator do
  
  describe "basic functions" do
    context "user provides empty string" do
      it "returns zero" do
        expect(Calculator.calculate("")).to eq(0)
      end
    end
    context "user provides a single number" do
      it "returns the number" do
        expect(Calculator.calculate("5")).to eq(5)
        expect(Calculator.calculate("10")).to eq(10)
      end
    end
  end
  describe "addition" do
    context "can add single digits" do
      it "adds 5+7" do
        expect(Calculator.calculate("5+7")).to eq(12)
      end
      it "adds 2+5+1+0+4" do
        expect(Calculator.calculate("2+5+1+0+4")).to eq(12)
      end
    end
    context "can add multiple digits" do
      it "adds 22+546+11" do
        expect(Calculator.calculate("22+546+11")).to eq(579)
      end
    end
  end
  describe "division" do
    context "divides single and multiple digit numbers" do
      it "divides 8 and 4" do
        expect(Calculator.calculate("8/4")).to eq(2)
      end
      it "divides 88 and 11" do
        expect(Calculator.calculate("88/11")).to eq(8)
      end
    end
    context "provides a decimal answer when appropriate" do
      it "divides 7 and 2" do
        expect(Calculator.calculate("7/2")).to eq(3.5)
      end
      it "divides 10 and 42" do
        expect(Calculator.calculate("10/42")).to eq(0.23809523809523808)
      end
    end
  end
  
  describe "subtraction" do
    context "subtracts single and multiple digit numbers" do
      it "subtracts 8 and 2" do
        expect(Calculator.calculate("8-2")).to eq(6)
      end
      it "subtracts 22-10" do
        expect(Calculator.calculate("22-10")).to eq(12)
      end
    end
  end
  
  describe "complex calculation" do
    context "correctly calculates a long string of numbers" do
      it "calculates 22+500-22+5*45/10+11-5+2" do
        expect(Calculator.calculate("22+500-22+5*45/10+11-5+2")). to eq (530.5)
      end
    end
  end
end