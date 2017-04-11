defmodule WordCounterTest do
  use ExUnit.Case
  doctest WordCounter

  test "Hello world" do
    assert WordCounter.hello == :world
  end

  test "Cuenta palabras de una frase" do
    assert WordCounter.count_words_in_string("uno dos tres") == 3
    assert WordCounter.count_words_in_string("uno dos tres cuatro") == 4
    assert WordCounter.count_words_in_string("Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci quibusdam, velit autem neque! Exercitationem laudantium earum necessitatibus ab error sequi dicta, praesentium esse vel placeat laboriosam consequatur ut vitae rerum.") == 30
    assert WordCounter.count_words_in_string("uno  dos tres    cuatro") == 4
    assert WordCounter.count_words_in_string("uno  dos             tres cuatro") == 4

  end
end
