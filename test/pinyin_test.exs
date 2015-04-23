defmodule PinyinTest do
  use ExUnit.Case


  test "pinyin" do
    #assert Pinyin.letter("中国人") == ["zhong", "guo", "ren"]
    assert Pinyin.letter("仇家") == [["chou", "qiu"], "jia"]
    #assert Pinyin.letter("小a") == ["xiao", "a"]
    #assert Pinyin.letter("It's 美国人") == ["I", "t", "'", "s", " ",
      #                                          "mei", "guo", "ren"]
  end

end
