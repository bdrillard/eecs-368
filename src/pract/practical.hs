module Main where

import Graphics.Blank
import Control.Concurrent

type Start = (Float,Float)
type Stop = (Float,Float)
type Color = String
type Branch = (Start,Stop,Color)

main :: IO()
main = blankCanvas 3000 $ go 

go :: Context -> IO()
go context = do
    (width,height) <- send context size
    let loop branches iterations cols = do
        send context $ do
            sequence_ [ showBranch branch | branch <- branches ]
        threadDelay (20 * 1000)
        
        es <- flush context

        loop (
    loop [((width / 2, height - 50),(width / 2, height / 2 - 50),"red")] 0 (cycle ["red","blue","yellow"])

showBranch :: Branch -> Canvas()
showBranch ((x1,y1),(x2,y2),col) = do
    moveTo(x1,y1)
    lineTo(x2,y2)
    lineWidth 10
    strokeStyle col
    stroke()
        