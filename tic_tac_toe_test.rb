require_relative "tic_tac_toe"
require "minitest/spec"
require "minitest/autorun"

describe TicTacToe do

  describe "#space_blank?" do
    it "should be true when space is blank" do
      game = TicTacToe.new
      game.space_blank?(0, 0).must_equal true
    end

    it "should be false when space is taken" do
      game = TicTacToe.new
      game.move(0, 0, :x)
      game.space_blank?(0, 0).must_equal false
    end
  end

  describe "#token_on_board" do
    it "should be true when the token is on the board" do
      game = TicTacToe.new
      game.token_on_board?(1, 0).must_equal true
    end

    it "should be false when the token is on not the board" do
      game = TicTacToe.new
      game.token_on_board?(12, 8).must_equal false
    end

    it "should be false when the x is on not the board" do
      game = TicTacToe.new
      game.token_on_board?(-1, 0).must_equal false
    end

    it "should be false when the y is on not the board" do
      game = TicTacToe.new
      game.token_on_board?(0, 8).must_equal false
    end
  end

  describe "#move" do
    it "should be false if move is off the board" do
      game = TicTacToe.new
      game.move(2, 3, :x).must_equal false
    end
#did all of the below on my own
    it "should be true if move is on the board" do
      game = TicTacToe.new
      game.move(2, 2, :x).must_equal true
    end

    it "should be true if move is on a space not already taken by a token" do
      game = TicTacToe.new
      @board = {
        0=>{0=>nil,1=>nil,2=>nil},
        1=>{0=>nil,1=>nil,2=>nil},
        2=>{0=>nil,1=>nil,2=>nil}
      }
      game.move(2, 0, :x).must_equal true
    end

    # it "should be false if move is on a space already taken by a token" do
    #   game = TicTacToe.new
    #   @board = {
    #     0=>{0=>nil,1=>nil,2=>nil},
    #     1=>{0=>nil,1=>:x,2=>nil},
    #     2=>{0=>:y,1=>nil,2=>nil}
    #   }
    #   game.move(2, 0, :y).must_equal false
    # end
  end

  describe "#stale_mate?" do
  #  it "should be true if all spaces are taken and there is no winner" do
  #    game =TicTacToe.new
  #      [0,1,2].map do |x|
  #        [0,1,2].map do |y|
  #    game.stale_mate?.must_equal true
  #  end
  end

  describe "#start_game" do
    it "should be true if there is still a move on the board"
      game.start_game.must_equal true
  end

  describe "#show_board" do

  end

  describe "#winner?" do

  end
end
