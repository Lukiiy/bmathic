RANDOMIZE TIMER

DIM SHARED nums(4) ' 1..4
DIM SHARED ops(3) ' 1..3: 0 +; 1 -

score = 0
total = 0

DO
    IF INT(RND * 2) = 0 THEN
        count = 2
    ELSE
        count = 4
    END IF

    FOR i = 1 TO count
        nums(i) = INT(RND * 20) + 1
    NEXT i

    FOR i = 1 TO count - 1
        ops(i) = INT(RND * 2)
    NEXT i

    equation$ = LTRIM$(STR$(nums(1)))
    FOR i = 1 TO count - 1
        IF ops(i) = 0 THEN op$ = " + " ELSE op$ = " - "

        equation$ = equation$ + op$ + LTRIM$(STR$(nums(i + 1)))
    NEXT i

    PRINT
    PRINT "Solve: "; equation$
    INPUT answer$

    answerStr$ = UCASE$(answer$)

    IF answerStr$ = "Q" OR answerStr$ = "QUIT" OR answerStr$ = "EXIT" THEN
        PRINT
        PRINT "Bye bye! "; formatScore$(score, total)
        END
    END IF

    userAns = VAL(answer$) ' input to number
    result = formatResult(count)
    total = total + 1

    IF userAns = result THEN
        score = score + 1
        PRINT "Correct! "
    ELSE
        PRINT "Wrong. The answer is "; LTRIM$(STR$(result))
    END IF

    SLEEP 0.7
LOOP

FUNCTION formatResult (count)
    result = nums(1)

    FOR i = 1 TO count - 1
        IF ops(i) = 0 THEN
            result = result + nums(i + 1)
        ELSE
            result = result - nums(i + 1)
        END IF
    NEXT i

    formatResult = result
END FUNCTION

FUNCTION formatScore$ (score, total)
    formatScore$ = "(Score: " + LTRIM$(STR$(score)) + "/" + LTRIM$(STR$(total)) + ")"
END FUNCTION
