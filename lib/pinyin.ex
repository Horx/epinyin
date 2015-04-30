defmodule Pinyin do

  def heteronym_to_string(string, separator \\ "^") do
      list = letter(string)
      Enum.reduce(list, [], fn(x, result) ->
        if is_list x do
          result ++ [Enum.join(x, separator)]
        else
          result ++ [x]
        end
      end)
  end

  def letter(string) do
    pro = string |> :unicode.characters_to_list
                 |> (Enum.map &:uni2pinyin.decode/1)
    combine(pro, String.to_char_list(string))
  end

  defp combine(pro, ori) do
    Enum.map(Enum.zip(pro, ori),
             fn {p, o} -> if is_tuple(p), do: to_string([o]),
                                          else: pinyin_to_string(p) end)
  end

  defp pinyin_to_string(chars) do
    if is_list(hd chars) do
      str = chars |> (Enum.map &char_to_string/1)
                  |> (Enum.into HashSet.new)
                  |> HashSet.to_list
      if length(str) == 1, do: (hd str), else: str
    else
      char_to_string(chars)
    end
  end

  defp char_to_string(chars) do
    to_string(Enum.slice(chars, 0, length(chars) -1))
  end

end
