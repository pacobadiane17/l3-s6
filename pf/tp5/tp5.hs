module TP5 where

import Parser
import Data.Char

type Nom = String

data Expression = Lam Nom Expression
                | App Expression Expression
                | Var Nom
                | Lit Litteral
                deriving (Show,Eq)

data Litteral = Entier Integer
              | Bool   Bool
              deriving (Show,Eq)

espaceP :: Parser ()
espaceP = zeroOuPlus (car ' ') >>= \_ -> return ()

{-
nomP :: Parser Nom
nomP = car >>= \x ->
	   espaceP >>= \_ ->
	   nomP >>= \y ->
	   return(x:y)
-}
nomP :: Parser Nom
nomP = do
		  nom <- unOuPlus (carCond isLower)
		  espaceP
		  return (nom)

varP :: Parser Expression
varP = do
		 x <- nomP
		 return(Var x)

applique :: [Expression] -> Expression
applique [] = error " erreur"
applique([x])    = x
applique xs      = App (applique x1) x2
			         where x1 =  init xs
				 	       x2 = last xs
