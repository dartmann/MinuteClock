---------------------------- MODULE MinuteClock ----------------------------
EXTENDS Naturals, TLC \* Used for printing
VARIABLES h, m
----------------------------------------------------------------------------
\* Initial states
Hinit == h \in (0 .. 23)
Minit == m \in (0 .. 59)
Init == Hinit /\ Minit
----------------------------------------------------------------------------
\* Define actions for state transition
MNext == m' = (m + 1) % 59
HNext == h' = IF m # 59 THEN h ELSE (h + 1) % 24
\* Another possible solution for the next state of hour:
\*HNext == IF m = 59 \*/\ m' = 0 
\*         THEN h' = (h + 1) % 24 
\*         ELSE h' = h
Next == HNext /\ MNext /\ PrintT(<<h, m>>)
Spec == Init /\ [][Next]_<<h, m>>
        
THEOREM Spec => []Init 
=============================================================================
\* Modification History
\* Last modified Fri Jul 07 18:47:34 CEST 2017 by david
\* Created Thu Jul 06 10:36:18 CEST 2017 by david
