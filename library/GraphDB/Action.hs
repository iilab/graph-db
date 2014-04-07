-- |
-- Provides a low-level transaction over union types 
-- without distinction between write and read.
module GraphDB.Action where

import GraphDB.Util.Prelude


type Action n v t i = Free (ActionF n v t i)

data ActionF n v t i a =
  NewNode v (n -> a) |
  GetValue n (v -> a) |
  SetValue n v a |
  GetRoot (n -> a) |
  GetTargetsByType n t ([n] -> a) |
  GetTargetsByIndex n i ([n] -> a) |
  AddTarget n n (Bool -> a) |
  RemoveTarget n n (Bool -> a) |
  GetStats ((Int, Int) -> a)
  deriving (Functor)

makeFree ''ActionF

