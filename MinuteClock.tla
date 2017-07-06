---------------------------- MODULE MinuteClock ----------------------------
EXTENDS Naturals, TLC \* Used for printing
VARIABLES h, m
\* Define Actions
Hinit == h \in (0 .. 23)
Minit == m \in (0 .. 59)
Init ==     /\ Hinit 
            /\ Minit
HNext == h' = IF h # 23 THEN h + 1 ELSE 0
MNext == m' = IF m # 59 THEN m + 1 ELSE 0
Next == HNext /\ MNext /\ PrintT(<<h, m>>)
Spec == /\ Init 
        /\ [][Next]_<<h, m>>
        
THEOREM Spec => []Init 
=============================================================================
\* Modification History
\* Last modified Thu Jul 06 10:47:32 CEST 2017 by david
\* Created Thu Jul 06 10:36:18 CEST 2017 by david
