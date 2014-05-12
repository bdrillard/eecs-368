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
    send context $ do
        showBranch ((width / 2, height - 50),(width / 2, (height - 50) - height * 0.5),"red")

showBranch :: Branch -> Canvas()
showBranch ((x1,y1),(x2,y2),col) = do
    moveTo(x1,y1)
    lineTo(x2,y2)
    lineWidth 5
    strokeStyle col
    stroke()
        
