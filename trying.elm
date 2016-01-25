import Graphics.Element exposing (..)
import Window
import Mouse
import Html exposing (Html, span, div, text)
import Html.Attributes exposing (class)
import Debug

main : Signal Html
main =
    Signal.map2 stuff ((Debug.watch "Mouse") Mouse.position) Window.dimensions

stuff : (Int,Int) -> (Int, Int) -> Html
stuff (x, y) (w, h) =
    let
        horizontal = (toFloat x)  > ((toFloat w) / 2)
        vertical = (toFloat y) > ((toFloat h) / 2)
    in
        div []
      [ span [class "message"] [text (toString horizontal ++ " + " ++ toString vertical)]
      ]
