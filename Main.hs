module Main where

main :: IO ()
main = getLine >>= (getMatrix . read) >>= (putStrLn . show . half . countR . reverse)

half :: Int -> Int
half x = x `div` 2
	
strToIntL :: String -> [Int]
strToIntL = (map read) . words
	
getMatrix :: Int -> IO [[Int]]
getMatrix 1 = do
    str <- getLine
    return [(strToIntL str)]
getMatrix n = do 
    matrixwo1 <- getMatrix (n-1)
    str <- getLine
    return ((strToIntL str):matrixwo1)
	
check :: [[Int]] -> Int
check [[x]] = invert x 
check xs = (checkAngle xs)*((check . crop) xs)

checkP :: [[Int]] -> Int
checkP [[x]] = toInt(x==1)
checkP xs = ((head . head) xs) `myOr` ((checkP . crop) xs)

countR :: [[Int]] -> Int
countR = mySum . (map mySum)

mySum :: [Int] -> Int
mySum xs = foldr1 (+) xs
	
myOr :: Int -> Int -> Int
myOr a b = a + b - a*b
	
toStr :: Int -> String
toStr x =
    if(x==1)
    then "YES"
    else "NO"

toInt :: Bool -> Int
toInt x = 
    if(x)
    then 1
    else 0

checkAngle :: [[Int]] -> Int
checkAngle xs = (cmp (map head xs) (head xs))*(invert ((head . head) xs))

invert :: Int -> Int
invert x = 1-x

cmp :: (Eq a) => [a] -> [a] -> Int
cmp [x] [y] = toInt(x==y)
cmp (x:xs) (y:ys) = toInt(x==y)*(cmp xs ys)

crop :: [[Int]] -> [[Int]]
crop (x:xs) = map tail xs
