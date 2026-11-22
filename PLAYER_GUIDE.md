# Sudoku Player Guide

Open `index.html` in a browser. Gameplay works offline; the leaderboard needs
an internet connection.

## Rules and number entry

Fill every square with a digit from 1 to 9. Each row, column, and 3-by-3 box
must contain each digit exactly once. Shaded starting numbers are locked.

With **Notes: Off**, select an editable square and type a digit. To replace an
answer, select its text and type another digit; use Backspace or Delete to clear it.
You can select cells by clicking, tapping, or pressing Tab.

## Arrow-key navigation

With a square selected, use the Up, Down, Left, and Right arrow keys to move
one square in that direction. Navigation includes shaded starting squares:
you can select them to highlight matching numbers, but cannot edit them.

At a board edge, an arrow pointing outside the board leaves you on the same
square. Navigation does not wrap to another row or column. Moving between
squares does not change answers or notes, start the timer, or create Undo history.

## Pencil notes

Turn **Notes: On** to record possible digits in an empty square. Enter a digit
again to remove that candidate. Each square can hold multiple notes.
Starting numbers and filled squares cannot receive notes.

Turn notes off to enter or clear an answer. Entering an answer clears that
square's notes; notes do not count as answers.

## Matching-number highlighting

Select a numbered square to highlight every occurrence of that answer,
including starting numbers. Selecting an empty square clears the highlights,
even if it contains pencil notes.

## Undo and Reset

Select **Undo** to reverse edits one at a time, newest first. It restores changed
answers and notes, including notes cleared by an answer. Undo can also restore
the board after Reset. It is disabled when there is nothing to undo.

Select **Reset** and confirm to clear your answers, notes, highlights, and timer.
Cancel to keep your progress and timer state. Starting numbers never change.

## Check Solution

Select **Check Solution** to see whether the board is **Incomplete**, **Incorrect**,
or **Solved**. A filled board is checked against the puzzle's solution; the game
does not identify individual mistakes. You can keep editing after checking.

## Timer

The timer displays elapsed minutes and seconds. It starts on your first answer
or pencil-note change and stops when **Check Solution** reports **Solved**.
Selecting cells or toggling notes mode alone does not start it.

A confirmed Reset returns it to zero. Undoing Reset restores the saved elapsed
time and resumes timing if the game had started. Editing or undoing a solved
board resumes from its stopped time. Ordinary Undo does not subtract time spent.

## Saving a result and the leaderboard

When **Check Solution** reports **Solved**, a nickname form appears. Enter
1–30 characters with no surrounding whitespace or control characters, then select
**Save result**. This saves the stopped elapsed time, including milliseconds.
Your nickname and time will be visible to everyone; saving is optional.

The leaderboard ranks the 10 fastest results for this puzzle, fastest first.
Times are shown as minutes:seconds.milliseconds. Select **Refresh leaderboard**
to load the latest results or retry a failed load. You can still play if the
leaderboard is empty, unavailable, or offline.

Save is disabled while submitting and after success. Editing or undoing hides the
form until you check a solved board again; it does not allow a second save of an
already saved attempt. Confirming Reset starts a new attempt. Undo Reset restores
the earlier attempt, including whether it has already been saved.

If the server rejects a result, correct your nickname or retry. If a connection
failure, timeout, or server error makes the save outcome uncertain, saving again
is disabled for that attempt to prevent duplicates. Refresh the leaderboard to
check whether your result arrived. Results cannot be edited or deleted by visitors.
They are self-reported, not independently verified puzzle completions.
