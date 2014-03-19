require 'spec_helper'

describe FortuneText do

  describe ".new" do
    it "should initialize with nil as default" do
      fortune = FortuneText.new
      fortune.long.should be_nil
      fortune.dirty.should be_nil
    end

    it "should initialize corresponding attributes" do
      fortune = FortuneText.new long: 1, dirty: 0
      fortune.long.should eq(1)
      fortune.dirty.should eq(0)
    end
  end

  describe ".long_argument" do
    it "should return correct argument" do
      fortune = FortuneText.new long: nil
      fortune.long_argument.should be_nil

      fortune = FortuneText.new long: 0
      fortune.long_argument.should eq('-s')

      fortune = FortuneText.new long: 1
      fortune.long_argument.should eq('-l')
    end

    it "should return nil for invalid input" do
      fortune = FortuneText.new long: 'test'
      fortune.long_argument.should be_nil
    end
  end

  describe ".dirty_argument" do
    it "should return correct argument" do
      fortune = FortuneText.new dirty: nil
      fortune.dirty_argument.should be_nil

      fortune = FortuneText.new dirty: 0
      fortune.dirty_argument.should be_nil

      fortune = FortuneText.new dirty: 1
      fortune.dirty_argument.should eq('-o')
    end

    it "should return nil for invalid input" do
      fortune = FortuneText.new dirty: 'test'
      fortune.dirty_argument.should be_nil
    end
  end

  describe ".arguments" do
    it "should return correct list of arguments" do
      fortune = FortuneText.new long: 1
      fortune.arguments.should eq(['-l'])

      fortune = FortuneText.new dirty: 1
      fortune.arguments.should eq(['-o'])

      fortune = FortuneText.new long: 1, dirty: 1
      fortune.arguments.should eq(['-l', '-o'])
    end
  end

  describe ".to_s" do
    it "should return fortune" do
      fortune = FortuneText.new
      fortune.to_s.should_not be_nil
    end
  end

  describe ".as_json" do
    it "should return correct json" do
      fortune = FortuneText.new
      fortune.as_json.keys.should include(:text)
    end
  end

end
