module Main where

import Graphics.Blank
import Control.Concurrent

type Start = (Float,Float)
type Stop = (Float,Float)
type Color = String
type Branch = (Start,Stop)

main :: IO()
main = blankCanvas 3000 $ go 

go :: Context -> IO()
go context = do
    (width,height) <- send context size
    let firstBranch = ((width / 2, height - 50),(width / 2, (height - 50) - height * 0.1))
        branches = firstBranch : genTree firstBranch (-90.0 :: Float) 10 (25 :: Float)
    send context $ do
        sequence_ [showBranch branch | branch <- branches]

-- (start, stop), angle, depth, primary angle
genTree :: Branch -> Float -> Float -> Float -> [Branch]
genTree _ _ 0 _ = [] 
genTree (_,(x1,y1)) angle depth angle1 = do
    let x2 = x1 + cos(angle * pi / 180.0) * depth * 10.0
        y2 = y1 + sin(angle * pi / 180.0) * depth * 10.0
        b1 = ((x1,y1),(x2,y2))
    [b1] ++ genTree b1 (angle - angle1) (depth - 1) angle1 ++ genTree b1 (angle + angle1) (depth - 1) angle1

showBranch :: Branch -> Canvas()
showBranch ((x1,y1),(x2,y2)) = do
    moveTo(x1,y1)
    lineTo(x2,y2)
    lineWidth 5
    strokeStyle "red"
    stroke()
