# MinuteClock
A TLA+ module for a clock with hours and minutes.

# Run
To run the module and check it by TLC one must add a model and define the Temporal Formula with 'Spec'.

_Hint_: be sure to only allow one worker thread, else the nondeterminism of concurrency will output unsequential values of the clock.
