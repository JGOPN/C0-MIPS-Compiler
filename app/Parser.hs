{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer  
import AST
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,260) ([0,176,0,0,22528,0,0,0,0,0,0,0,0,0,0,0,0,0,1408,0,0,49152,2,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,24576,1,0,0,256,0,0,0,4096,0,0,4096,0,0,5632,0,0,0,512,4,0,0,0,0,0,0,0,0,352,0,0,0,0,0,0,12288,0,0,49920,5318,3200,0,0,16,0,45248,1329,800,0,256,0,0,0,57406,7,0,0,0,0,0,16,0,0,2048,2,0,0,0,0,0,512,0,16384,12336,8193,3,6176,152,400,4096,19468,51200,0,1544,38,100,45056,0,0,0,33154,9,25,0,0,0,0,0,0,0,0,0,0,0,8,0,0,32768,1,0,0,7168,0,0,0,16,0,34304,10637,6400,0,57344,32267,0,0,0,0,0,57344,0,0,0,49277,15,4096,19468,51200,0,1544,38,100,1024,4867,12800,0,33154,9,25,49408,1216,3200,32768,24672,16386,6,12352,304,800,8192,38936,36864,1,3088,76,200,2048,9734,25600,0,772,19,50,33280,2433,6400,0,49345,32772,12,24704,608,1600,16384,12336,8193,3,0,0,0,0,0,0,0,0,0,0,0,3968,120,0,49152,15367,0,0,992,0,0,61440,1,0,0,248,0,0,31744,0,0,0,0,0,0,0,0,0,0,0,0,0,1792,0,0,32768,3,0,0,1520,63,0,63488,8064,0,0,49278,15,0,32768,0,0,0,61535,3,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,4096,0,0,0,256,0,0,0,0,0,6144,42550,25600,0,0,0,0,33280,2433,6400,0,50883,32788,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,13848,166,100,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Prog","Fns","FnDefs","FnDecs","FunctionDef","FunctionDec","Type","Args","VarDecl","Stmts","Stmt","Decls","SimpleStmt","Exp","Exps","'num'","'if'","'int'","'bool'","'void'","'string'","Id","Str","'else'","'while'","'return'","';'","','","'+'","'-'","'*'","'%'","'/'","'('","')'","'{'","'}'","'['","']'","'='","'<'","'<='","'>'","'>='","'=='","'!='","'!'","'->'","'.'","'true'","'false'","%eof"]
        bit_start = st Prelude.* 55
        bit_end = (st Prelude.+ 1) Prelude.* 55
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..54]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (21) = happyShift action_8
action_0 (22) = happyShift action_9
action_0 (24) = happyShift action_10
action_0 (4) = happyGoto action_11
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (8) = happyGoto action_5
action_0 (9) = happyGoto action_6
action_0 (10) = happyGoto action_7
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (21) = happyShift action_8
action_1 (22) = happyShift action_9
action_1 (24) = happyShift action_10
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (8) = happyGoto action_5
action_1 (9) = happyGoto action_6
action_1 (10) = happyGoto action_7
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 _ = happyReduce_3

action_4 _ = happyReduce_2

action_5 (21) = happyShift action_8
action_5 (22) = happyShift action_9
action_5 (24) = happyShift action_10
action_5 (5) = happyGoto action_14
action_5 (6) = happyGoto action_3
action_5 (7) = happyGoto action_4
action_5 (8) = happyGoto action_5
action_5 (9) = happyGoto action_6
action_5 (10) = happyGoto action_7
action_5 _ = happyReduce_4

action_6 (21) = happyShift action_8
action_6 (22) = happyShift action_9
action_6 (24) = happyShift action_10
action_6 (5) = happyGoto action_13
action_6 (6) = happyGoto action_3
action_6 (7) = happyGoto action_4
action_6 (8) = happyGoto action_5
action_6 (9) = happyGoto action_6
action_6 (10) = happyGoto action_7
action_6 _ = happyReduce_6

action_7 (25) = happyShift action_12
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_11

action_9 _ = happyReduce_10

action_10 _ = happyReduce_12

action_11 (55) = happyAccept
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (37) = happyShift action_15
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_7

action_14 _ = happyReduce_5

action_15 (21) = happyShift action_8
action_15 (22) = happyShift action_9
action_15 (24) = happyShift action_10
action_15 (10) = happyGoto action_16
action_15 (11) = happyGoto action_17
action_15 (12) = happyGoto action_18
action_15 _ = happyReduce_13

action_16 (25) = happyShift action_21
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (38) = happyShift action_20
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (31) = happyShift action_19
action_18 _ = happyReduce_14

action_19 (21) = happyShift action_8
action_19 (22) = happyShift action_9
action_19 (24) = happyShift action_10
action_19 (10) = happyGoto action_16
action_19 (11) = happyGoto action_24
action_19 (12) = happyGoto action_18
action_19 _ = happyReduce_13

action_20 (30) = happyShift action_22
action_20 (39) = happyShift action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_16

action_22 _ = happyReduce_9

action_23 (21) = happyShift action_8
action_23 (22) = happyShift action_9
action_23 (24) = happyShift action_10
action_23 (10) = happyGoto action_16
action_23 (12) = happyGoto action_25
action_23 (15) = happyGoto action_26
action_23 _ = happyReduce_26

action_24 _ = happyReduce_15

action_25 (30) = happyShift action_44
action_25 (31) = happyShift action_45
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (19) = happyShift action_31
action_26 (20) = happyShift action_32
action_26 (25) = happyShift action_33
action_26 (26) = happyShift action_34
action_26 (28) = happyShift action_35
action_26 (29) = happyShift action_36
action_26 (33) = happyShift action_37
action_26 (34) = happyShift action_38
action_26 (37) = happyShift action_39
action_26 (39) = happyShift action_40
action_26 (50) = happyShift action_41
action_26 (53) = happyShift action_42
action_26 (54) = happyShift action_43
action_26 (13) = happyGoto action_27
action_26 (14) = happyGoto action_28
action_26 (16) = happyGoto action_29
action_26 (17) = happyGoto action_30
action_26 _ = happyReduce_17

action_27 (40) = happyShift action_71
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (19) = happyShift action_31
action_28 (20) = happyShift action_32
action_28 (25) = happyShift action_33
action_28 (26) = happyShift action_34
action_28 (28) = happyShift action_35
action_28 (29) = happyShift action_36
action_28 (33) = happyShift action_37
action_28 (34) = happyShift action_38
action_28 (37) = happyShift action_39
action_28 (39) = happyShift action_40
action_28 (40) = happyReduce_18
action_28 (50) = happyShift action_41
action_28 (53) = happyShift action_42
action_28 (54) = happyShift action_43
action_28 (13) = happyGoto action_70
action_28 (14) = happyGoto action_28
action_28 (16) = happyGoto action_29
action_28 (17) = happyGoto action_30
action_28 _ = happyReduce_18

action_29 (30) = happyShift action_69
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (32) = happyShift action_58
action_30 (33) = happyShift action_59
action_30 (34) = happyShift action_60
action_30 (35) = happyShift action_61
action_30 (36) = happyShift action_62
action_30 (44) = happyShift action_63
action_30 (45) = happyShift action_64
action_30 (46) = happyShift action_65
action_30 (47) = happyShift action_66
action_30 (48) = happyShift action_67
action_30 (49) = happyShift action_68
action_30 _ = happyReduce_30

action_31 _ = happyReduce_35

action_32 (37) = happyShift action_57
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (37) = happyShift action_55
action_33 (43) = happyShift action_56
action_33 _ = happyReduce_36

action_34 _ = happyReduce_37

action_35 (37) = happyShift action_54
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (19) = happyShift action_31
action_36 (25) = happyShift action_48
action_36 (26) = happyShift action_34
action_36 (33) = happyShift action_37
action_36 (34) = happyShift action_38
action_36 (37) = happyShift action_39
action_36 (50) = happyShift action_41
action_36 (53) = happyShift action_42
action_36 (54) = happyShift action_43
action_36 (17) = happyGoto action_53
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (19) = happyShift action_31
action_37 (25) = happyShift action_48
action_37 (26) = happyShift action_34
action_37 (33) = happyShift action_37
action_37 (34) = happyShift action_38
action_37 (37) = happyShift action_39
action_37 (50) = happyShift action_41
action_37 (53) = happyShift action_42
action_37 (54) = happyShift action_43
action_37 (17) = happyGoto action_52
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (19) = happyShift action_31
action_38 (25) = happyShift action_48
action_38 (26) = happyShift action_34
action_38 (33) = happyShift action_37
action_38 (34) = happyShift action_38
action_38 (37) = happyShift action_39
action_38 (50) = happyShift action_41
action_38 (53) = happyShift action_42
action_38 (54) = happyShift action_43
action_38 (17) = happyGoto action_51
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (19) = happyShift action_31
action_39 (25) = happyShift action_48
action_39 (26) = happyShift action_34
action_39 (33) = happyShift action_37
action_39 (34) = happyShift action_38
action_39 (37) = happyShift action_39
action_39 (50) = happyShift action_41
action_39 (53) = happyShift action_42
action_39 (54) = happyShift action_43
action_39 (17) = happyGoto action_50
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (21) = happyShift action_8
action_40 (22) = happyShift action_9
action_40 (24) = happyShift action_10
action_40 (10) = happyGoto action_16
action_40 (12) = happyGoto action_25
action_40 (15) = happyGoto action_49
action_40 _ = happyReduce_26

action_41 (19) = happyShift action_31
action_41 (25) = happyShift action_48
action_41 (26) = happyShift action_34
action_41 (33) = happyShift action_37
action_41 (34) = happyShift action_38
action_41 (37) = happyShift action_39
action_41 (50) = happyShift action_41
action_41 (53) = happyShift action_42
action_41 (54) = happyShift action_43
action_41 (17) = happyGoto action_47
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_32

action_43 _ = happyReduce_33

action_44 _ = happyReduce_27

action_45 (25) = happyShift action_46
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (30) = happyShift action_91
action_46 (31) = happyShift action_92
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (34) = happyShift action_60
action_47 (35) = happyShift action_61
action_47 (36) = happyShift action_62
action_47 _ = happyReduce_50

action_48 (37) = happyShift action_55
action_48 _ = happyReduce_36

action_49 (19) = happyShift action_31
action_49 (20) = happyShift action_32
action_49 (25) = happyShift action_33
action_49 (26) = happyShift action_34
action_49 (28) = happyShift action_35
action_49 (29) = happyShift action_36
action_49 (33) = happyShift action_37
action_49 (34) = happyShift action_38
action_49 (37) = happyShift action_39
action_49 (39) = happyShift action_40
action_49 (50) = happyShift action_41
action_49 (53) = happyShift action_42
action_49 (54) = happyShift action_43
action_49 (13) = happyGoto action_90
action_49 (14) = happyGoto action_28
action_49 (16) = happyGoto action_29
action_49 (17) = happyGoto action_30
action_49 _ = happyReduce_17

action_50 (32) = happyShift action_58
action_50 (33) = happyShift action_59
action_50 (34) = happyShift action_60
action_50 (35) = happyShift action_61
action_50 (36) = happyShift action_62
action_50 (38) = happyShift action_89
action_50 (44) = happyShift action_63
action_50 (45) = happyShift action_64
action_50 (46) = happyShift action_65
action_50 (47) = happyShift action_66
action_50 (48) = happyShift action_67
action_50 (49) = happyShift action_68
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_52

action_52 (34) = happyShift action_60
action_52 (35) = happyShift action_61
action_52 (36) = happyShift action_62
action_52 _ = happyReduce_51

action_53 (30) = happyShift action_88
action_53 (32) = happyShift action_58
action_53 (33) = happyShift action_59
action_53 (34) = happyShift action_60
action_53 (35) = happyShift action_61
action_53 (36) = happyShift action_62
action_53 (44) = happyShift action_63
action_53 (45) = happyShift action_64
action_53 (46) = happyShift action_65
action_53 (47) = happyShift action_66
action_53 (48) = happyShift action_67
action_53 (49) = happyShift action_68
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (19) = happyShift action_31
action_54 (25) = happyShift action_48
action_54 (26) = happyShift action_34
action_54 (33) = happyShift action_37
action_54 (34) = happyShift action_38
action_54 (37) = happyShift action_39
action_54 (50) = happyShift action_41
action_54 (53) = happyShift action_42
action_54 (54) = happyShift action_43
action_54 (17) = happyGoto action_87
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (19) = happyShift action_31
action_55 (25) = happyShift action_48
action_55 (26) = happyShift action_34
action_55 (33) = happyShift action_37
action_55 (34) = happyShift action_38
action_55 (37) = happyShift action_39
action_55 (50) = happyShift action_41
action_55 (53) = happyShift action_42
action_55 (54) = happyShift action_43
action_55 (17) = happyGoto action_85
action_55 (18) = happyGoto action_86
action_55 _ = happyReduce_53

action_56 (19) = happyShift action_31
action_56 (25) = happyShift action_48
action_56 (26) = happyShift action_34
action_56 (33) = happyShift action_37
action_56 (34) = happyShift action_38
action_56 (37) = happyShift action_39
action_56 (50) = happyShift action_41
action_56 (53) = happyShift action_42
action_56 (54) = happyShift action_43
action_56 (17) = happyGoto action_84
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (19) = happyShift action_31
action_57 (25) = happyShift action_48
action_57 (26) = happyShift action_34
action_57 (33) = happyShift action_37
action_57 (34) = happyShift action_38
action_57 (37) = happyShift action_39
action_57 (50) = happyShift action_41
action_57 (53) = happyShift action_42
action_57 (54) = happyShift action_43
action_57 (17) = happyGoto action_83
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (19) = happyShift action_31
action_58 (25) = happyShift action_48
action_58 (26) = happyShift action_34
action_58 (33) = happyShift action_37
action_58 (34) = happyShift action_38
action_58 (37) = happyShift action_39
action_58 (50) = happyShift action_41
action_58 (53) = happyShift action_42
action_58 (54) = happyShift action_43
action_58 (17) = happyGoto action_82
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (19) = happyShift action_31
action_59 (25) = happyShift action_48
action_59 (26) = happyShift action_34
action_59 (33) = happyShift action_37
action_59 (34) = happyShift action_38
action_59 (37) = happyShift action_39
action_59 (50) = happyShift action_41
action_59 (53) = happyShift action_42
action_59 (54) = happyShift action_43
action_59 (17) = happyGoto action_81
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (19) = happyShift action_31
action_60 (25) = happyShift action_48
action_60 (26) = happyShift action_34
action_60 (33) = happyShift action_37
action_60 (34) = happyShift action_38
action_60 (37) = happyShift action_39
action_60 (50) = happyShift action_41
action_60 (53) = happyShift action_42
action_60 (54) = happyShift action_43
action_60 (17) = happyGoto action_80
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (19) = happyShift action_31
action_61 (25) = happyShift action_48
action_61 (26) = happyShift action_34
action_61 (33) = happyShift action_37
action_61 (34) = happyShift action_38
action_61 (37) = happyShift action_39
action_61 (50) = happyShift action_41
action_61 (53) = happyShift action_42
action_61 (54) = happyShift action_43
action_61 (17) = happyGoto action_79
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (19) = happyShift action_31
action_62 (25) = happyShift action_48
action_62 (26) = happyShift action_34
action_62 (33) = happyShift action_37
action_62 (34) = happyShift action_38
action_62 (37) = happyShift action_39
action_62 (50) = happyShift action_41
action_62 (53) = happyShift action_42
action_62 (54) = happyShift action_43
action_62 (17) = happyGoto action_78
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (19) = happyShift action_31
action_63 (25) = happyShift action_48
action_63 (26) = happyShift action_34
action_63 (33) = happyShift action_37
action_63 (34) = happyShift action_38
action_63 (37) = happyShift action_39
action_63 (50) = happyShift action_41
action_63 (53) = happyShift action_42
action_63 (54) = happyShift action_43
action_63 (17) = happyGoto action_77
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (19) = happyShift action_31
action_64 (25) = happyShift action_48
action_64 (26) = happyShift action_34
action_64 (33) = happyShift action_37
action_64 (34) = happyShift action_38
action_64 (37) = happyShift action_39
action_64 (50) = happyShift action_41
action_64 (53) = happyShift action_42
action_64 (54) = happyShift action_43
action_64 (17) = happyGoto action_76
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (19) = happyShift action_31
action_65 (25) = happyShift action_48
action_65 (26) = happyShift action_34
action_65 (33) = happyShift action_37
action_65 (34) = happyShift action_38
action_65 (37) = happyShift action_39
action_65 (50) = happyShift action_41
action_65 (53) = happyShift action_42
action_65 (54) = happyShift action_43
action_65 (17) = happyGoto action_75
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (19) = happyShift action_31
action_66 (25) = happyShift action_48
action_66 (26) = happyShift action_34
action_66 (33) = happyShift action_37
action_66 (34) = happyShift action_38
action_66 (37) = happyShift action_39
action_66 (50) = happyShift action_41
action_66 (53) = happyShift action_42
action_66 (54) = happyShift action_43
action_66 (17) = happyGoto action_74
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (19) = happyShift action_31
action_67 (25) = happyShift action_48
action_67 (26) = happyShift action_34
action_67 (33) = happyShift action_37
action_67 (34) = happyShift action_38
action_67 (37) = happyShift action_39
action_67 (50) = happyShift action_41
action_67 (53) = happyShift action_42
action_67 (54) = happyShift action_43
action_67 (17) = happyGoto action_73
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (19) = happyShift action_31
action_68 (25) = happyShift action_48
action_68 (26) = happyShift action_34
action_68 (33) = happyShift action_37
action_68 (34) = happyShift action_38
action_68 (37) = happyShift action_39
action_68 (50) = happyShift action_41
action_68 (53) = happyShift action_42
action_68 (54) = happyShift action_43
action_68 (17) = happyGoto action_72
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_25

action_70 _ = happyReduce_19

action_71 _ = happyReduce_8

action_72 (32) = happyShift action_58
action_72 (33) = happyShift action_59
action_72 (34) = happyShift action_60
action_72 (35) = happyShift action_61
action_72 (36) = happyShift action_62
action_72 (44) = happyShift action_63
action_72 (45) = happyShift action_64
action_72 (46) = happyShift action_65
action_72 (47) = happyShift action_66
action_72 _ = happyReduce_49

action_73 (32) = happyShift action_58
action_73 (33) = happyShift action_59
action_73 (34) = happyShift action_60
action_73 (35) = happyShift action_61
action_73 (36) = happyShift action_62
action_73 (44) = happyShift action_63
action_73 (45) = happyShift action_64
action_73 (46) = happyShift action_65
action_73 (47) = happyShift action_66
action_73 _ = happyReduce_48

action_74 (32) = happyShift action_58
action_74 (33) = happyShift action_59
action_74 (34) = happyShift action_60
action_74 (35) = happyShift action_61
action_74 (36) = happyShift action_62
action_74 _ = happyReduce_45

action_75 (32) = happyShift action_58
action_75 (33) = happyShift action_59
action_75 (34) = happyShift action_60
action_75 (35) = happyShift action_61
action_75 (36) = happyShift action_62
action_75 _ = happyReduce_44

action_76 (32) = happyShift action_58
action_76 (33) = happyShift action_59
action_76 (34) = happyShift action_60
action_76 (35) = happyShift action_61
action_76 (36) = happyShift action_62
action_76 _ = happyReduce_47

action_77 (32) = happyShift action_58
action_77 (33) = happyShift action_59
action_77 (34) = happyShift action_60
action_77 (35) = happyShift action_61
action_77 (36) = happyShift action_62
action_77 _ = happyReduce_46

action_78 _ = happyReduce_41

action_79 _ = happyReduce_43

action_80 _ = happyReduce_42

action_81 (34) = happyShift action_60
action_81 (35) = happyShift action_61
action_81 (36) = happyShift action_62
action_81 _ = happyReduce_40

action_82 (34) = happyShift action_60
action_82 (35) = happyShift action_61
action_82 (36) = happyShift action_62
action_82 _ = happyReduce_39

action_83 (32) = happyShift action_58
action_83 (33) = happyShift action_59
action_83 (34) = happyShift action_60
action_83 (35) = happyShift action_61
action_83 (36) = happyShift action_62
action_83 (38) = happyShift action_98
action_83 (44) = happyShift action_63
action_83 (45) = happyShift action_64
action_83 (46) = happyShift action_65
action_83 (47) = happyShift action_66
action_83 (48) = happyShift action_67
action_83 (49) = happyShift action_68
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (32) = happyShift action_58
action_84 (33) = happyShift action_59
action_84 (34) = happyShift action_60
action_84 (35) = happyShift action_61
action_84 (36) = happyShift action_62
action_84 (44) = happyShift action_63
action_84 (45) = happyShift action_64
action_84 (46) = happyShift action_65
action_84 (47) = happyShift action_66
action_84 (48) = happyShift action_67
action_84 (49) = happyShift action_68
action_84 _ = happyReduce_31

action_85 (31) = happyShift action_97
action_85 (32) = happyShift action_58
action_85 (33) = happyShift action_59
action_85 (34) = happyShift action_60
action_85 (35) = happyShift action_61
action_85 (36) = happyShift action_62
action_85 (44) = happyShift action_63
action_85 (45) = happyShift action_64
action_85 (46) = happyShift action_65
action_85 (47) = happyShift action_66
action_85 (48) = happyShift action_67
action_85 (49) = happyShift action_68
action_85 _ = happyReduce_54

action_86 (38) = happyShift action_96
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (32) = happyShift action_58
action_87 (33) = happyShift action_59
action_87 (34) = happyShift action_60
action_87 (35) = happyShift action_61
action_87 (36) = happyShift action_62
action_87 (38) = happyShift action_95
action_87 (44) = happyShift action_63
action_87 (45) = happyShift action_64
action_87 (46) = happyShift action_65
action_87 (47) = happyShift action_66
action_87 (48) = happyShift action_67
action_87 (49) = happyShift action_68
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_23

action_89 _ = happyReduce_34

action_90 (40) = happyShift action_94
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_28

action_92 (25) = happyShift action_93
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (30) = happyShift action_102
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_22

action_95 (19) = happyShift action_31
action_95 (20) = happyShift action_32
action_95 (25) = happyShift action_33
action_95 (26) = happyShift action_34
action_95 (28) = happyShift action_35
action_95 (29) = happyShift action_36
action_95 (33) = happyShift action_37
action_95 (34) = happyShift action_38
action_95 (37) = happyShift action_39
action_95 (39) = happyShift action_40
action_95 (50) = happyShift action_41
action_95 (53) = happyShift action_42
action_95 (54) = happyShift action_43
action_95 (14) = happyGoto action_101
action_95 (16) = happyGoto action_29
action_95 (17) = happyGoto action_30
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_38

action_97 (19) = happyShift action_31
action_97 (25) = happyShift action_48
action_97 (26) = happyShift action_34
action_97 (33) = happyShift action_37
action_97 (34) = happyShift action_38
action_97 (37) = happyShift action_39
action_97 (50) = happyShift action_41
action_97 (53) = happyShift action_42
action_97 (54) = happyShift action_43
action_97 (17) = happyGoto action_85
action_97 (18) = happyGoto action_100
action_97 _ = happyReduce_53

action_98 (19) = happyShift action_31
action_98 (20) = happyShift action_32
action_98 (25) = happyShift action_33
action_98 (26) = happyShift action_34
action_98 (28) = happyShift action_35
action_98 (29) = happyShift action_36
action_98 (33) = happyShift action_37
action_98 (34) = happyShift action_38
action_98 (37) = happyShift action_39
action_98 (39) = happyShift action_40
action_98 (50) = happyShift action_41
action_98 (53) = happyShift action_42
action_98 (54) = happyShift action_43
action_98 (14) = happyGoto action_99
action_98 (16) = happyGoto action_29
action_98 (17) = happyGoto action_30
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (27) = happyShift action_103
action_99 _ = happyReduce_21

action_100 _ = happyReduce_55

action_101 _ = happyReduce_24

action_102 _ = happyReduce_29

action_103 (19) = happyShift action_31
action_103 (20) = happyShift action_32
action_103 (25) = happyShift action_33
action_103 (26) = happyShift action_34
action_103 (28) = happyShift action_35
action_103 (29) = happyShift action_36
action_103 (33) = happyShift action_37
action_103 (34) = happyShift action_38
action_103 (37) = happyShift action_39
action_103 (39) = happyShift action_40
action_103 (50) = happyShift action_41
action_103 (53) = happyShift action_42
action_103 (54) = happyShift action_43
action_103 (14) = happyGoto action_104
action_103 (16) = happyGoto action_29
action_103 (17) = happyGoto action_30
action_103 _ = happyFail (happyExpListPerState 103)

action_104 _ = happyReduce_20

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Prog happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  6 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  7 happyReduction_7
happyReduction_7 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 9 8 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_8) `HappyStk`
	(HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_ID happy_var_2)) `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (FnDef happy_var_1 happy_var_2 happy_var_4 happy_var_7 happy_var_8
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 6 9 happyReduction_9
happyReduction_9 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_ID happy_var_2)) `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (FnDec happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_1  10 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn10
		 (Type_Bool
	)

happyReduce_11 = happySpecReduce_1  10 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn10
		 (Type_Int
	)

happyReduce_12 = happySpecReduce_1  10 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn10
		 (Type_Str
	)

happyReduce_13 = happySpecReduce_0  11 happyReduction_13
happyReduction_13  =  HappyAbsSyn11
		 ([]
	)

happyReduce_14 = happySpecReduce_1  11 happyReduction_14
happyReduction_14 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  11 happyReduction_15
happyReduction_15 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 : happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  12 happyReduction_16
happyReduction_16 (HappyTerminal (TK_ID happy_var_2))
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn12
		 ((happy_var_2, happy_var_1)
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_0  13 happyReduction_17
happyReduction_17  =  HappyAbsSyn13
		 ([]
	)

happyReduce_18 = happySpecReduce_1  13 happyReduction_18
happyReduction_18 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  13 happyReduction_19
happyReduction_19 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 7 14 happyReduction_20
happyReduction_20 ((HappyAbsSyn14  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (IfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 5 14 happyReduction_21
happyReduction_21 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (If happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 4 14 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (Block happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  14 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Return happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 5 14 happyReduction_24
happyReduction_24 ((HappyAbsSyn14  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn14
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_2  14 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_0  15 happyReduction_26
happyReduction_26  =  HappyAbsSyn15
		 ([]
	)

happyReduce_27 = happySpecReduce_2  15 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn15
		 ([happy_var_1]
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 4 15 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyTerminal (TK_ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 ([happy_var_1,(happy_var_3,(snd happy_var_1))]
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 6 15 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyTerminal (TK_ID happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 ([happy_var_1,(happy_var_3,(snd happy_var_1)),(happy_var_5,(snd happy_var_1))]
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_1  16 happyReduction_30
happyReduction_30 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (Exp happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  16 happyReduction_31
happyReduction_31 (HappyAbsSyn17  happy_var_3)
	_
	(HappyTerminal (TK_ID happy_var_1))
	 =  HappyAbsSyn16
		 (Assign happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  17 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn17
		 (Bool True
	)

happyReduce_33 = happySpecReduce_1  17 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn17
		 (Bool False
	)

happyReduce_34 = happySpecReduce_3  17 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (Paren happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  17 happyReduction_35
happyReduction_35 (HappyTerminal (TK_NUM happy_var_1))
	 =  HappyAbsSyn17
		 (Num (checkNum(happy_var_1))
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  17 happyReduction_36
happyReduction_36 (HappyTerminal (TK_ID happy_var_1))
	 =  HappyAbsSyn17
		 (Var happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  17 happyReduction_37
happyReduction_37 (HappyTerminal (TK_STRLIT happy_var_1))
	 =  HappyAbsSyn17
		 (Str happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happyReduce 4 17 happyReduction_38
happyReduction_38 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TK_ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (FnCall happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_39 = happySpecReduce_3  17 happyReduction_39
happyReduction_39 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Add happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  17 happyReduction_40
happyReduction_40 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Sub happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  17 happyReduction_41
happyReduction_41 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (checkDivMod (BinOp Div happy_var_1 happy_var_3)
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  17 happyReduction_42
happyReduction_42 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Mult happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  17 happyReduction_43
happyReduction_43 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (checkDivMod (BinOp Mod happy_var_1 happy_var_3)
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  17 happyReduction_44
happyReduction_44 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Gtr happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  17 happyReduction_45
happyReduction_45 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp GtrEq happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  17 happyReduction_46
happyReduction_46 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Gtr happy_var_3 happy_var_1
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  17 happyReduction_47
happyReduction_47 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp GtrEq happy_var_3 happy_var_1
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  17 happyReduction_48
happyReduction_48 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp Eq happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  17 happyReduction_49
happyReduction_49 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (BinOp NotEq happy_var_1 happy_var_3
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_2  17 happyReduction_50
happyReduction_50 (HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (UnOp Not happy_var_2
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_2  17 happyReduction_51
happyReduction_51 (HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (BinOp Sub (Num 0) happy_var_2
	)
happyReduction_51 _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_2  17 happyReduction_52
happyReduction_52 (HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (UnOp Deref happy_var_2
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_0  18 happyReduction_53
happyReduction_53  =  HappyAbsSyn18
		 ([]
	)

happyReduce_54 = happySpecReduce_1  18 happyReduction_54
happyReduction_54 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 ([happy_var_1]
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  18 happyReduction_55
happyReduction_55 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1 : happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 55 55 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TK_NUM happy_dollar_dollar -> cont 19;
	TK_IF -> cont 20;
	TK_INT -> cont 21;
	TK_BOOL -> cont 22;
	TK_VOID -> cont 23;
	TK_STRING -> cont 24;
	TK_ID happy_dollar_dollar -> cont 25;
	TK_STRLIT happy_dollar_dollar -> cont 26;
	TK_ELSE -> cont 27;
	TK_WHILE -> cont 28;
	TK_RETURN -> cont 29;
	TK_SEMICOLON -> cont 30;
	TK_COMMA -> cont 31;
	TK_PLUS -> cont 32;
	TK_MINUS -> cont 33;
	TK_ASTERISK -> cont 34;
	TK_MOD -> cont 35;
	TK_DIV -> cont 36;
	TK_LPAREN -> cont 37;
	TK_RPAREN -> cont 38;
	TK_LBRACE -> cont 39;
	TK_RBRACE -> cont 40;
	TK_LBRACK -> cont 41;
	TK_RBRACK -> cont 42;
	TK_ASSIGN -> cont 43;
	TK_LrT -> cont 44;
	TK_LTE -> cont 45;
	TK_GrT -> cont 46;
	TK_GTE -> cont 47;
	TK_EQUAL -> cont 48;
	TK_NOTEQUAL -> cont 49;
	TK_NOT -> cont 50;
	TK_RARROW -> cont 51;
	TK_DOT -> cont 52;
	TK_TRUE -> cont 53;
	TK_FALSE -> cont 54;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 55 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


--comentarios (nao fazer parse de */ dentro de comment)
--smtmts  [()] causa conflito
--error ao fazer parse de mais de uma linha de decls

parseError :: [Token] -> a
parseError toks = error "parse error"  

checkNum :: Int -> Int
checkNum x | (x>(-2147483648) && x<2147483647) = x
           | otherwise = error "error: Number not in 32-bit range"

checkDivMod :: Exp -> Exp
checkDivMod x | checkAux x = x
              | otherwise = error "Overflow exception (invalid modulus or division)"
checkAux :: Exp -> Bool
checkAux (BinOp Div (Num n) (Num k)) | k==0 = False
                               | n== -2147483648 && k== -1 = False
                               | otherwise = True
checkAux (BinOp Mod (Num n) (Num k)) | k==0 = False
                               | n== -2147483648 && k== -1 = False
                               | otherwise = True
checkAux _ = True
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
