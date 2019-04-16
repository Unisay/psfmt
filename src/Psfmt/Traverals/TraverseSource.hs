{-# LANGUAGE UndecidableInstances #-}
{-# OPTIONS_GHC -freduction-depth=0 #-}

module Psfmt.Traverals.TraverseSource where

import Relude

import Language.PureScript.CST

import Data.Generics.Product
import Control.Lens

-- takes about 2 minutes to compile, so it's in a separate file.
traverseToken :: Traversal' (Module ()) SourceToken
traverseToken = typesUsing @Custom @SourceToken @(Module ())

data Custom
type instance Children Custom a = ChildrenCustom a

type family ChildrenCustom (a :: Relude.Type) where
  ChildrenCustom Text = '[]
  ChildrenCustom a = Children ChGeneric a