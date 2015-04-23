defmodule Pinyin do

  def letter(string, seprator \\ '^') do
    pro = string |> :unicode.characters_to_list
                 |> (Enum.map &:uni2pinyin.decode/1)
    combine(pro, String.to_char_list(string), seprator)
  end

  defp combine(pro, ori, seprator) do
    IO.puts "pro .>>>>>>>>>> #{inspect pro}, 2 \n #{inspect ori}"
    Enum.map(Enum.zip(pro, ori),
             fn {p, o} -> if is_tuple(p), do: to_string([o]),
                                          else: pinyin_to_string(p, seprator) end)
  end

  defp pinyin_to_string(chars, type \\ 'array') do
    IO.puts "chars .>>>>>> #{inspect chars}"
    if is_list(hd chars) do
      str = chars |> (Enum.map &char_to_string/1)
                  |> (Enum.into HashSet.new)
                  |> HashSet.to_list

      if type != 'array', do: str = Enum.join(type)
      if length(str) == 1, do: (hd str), else: str
    else
      char_to_string(chars)
    end
  end

  defp char_to_string(chars) do
    to_string(Enum.slice(chars, 0, length(chars) -1))
  end

end
