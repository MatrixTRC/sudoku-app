# sudoku-app
A browser-based Sudoku game for exploring GitHub and GitHub Copilot workflows.

Open [index.html](./index.html) in a browser; gameplay works offline. Enter digits 1–9
in the empty squares, or select **Check Solution** to check your board.
Toggle **Notes: On** to record multiple possible digits in an empty square.
Enter a digit again to remove that note. Turn notes off to enter an answer;
entering an answer clears that square's notes. Filled squares cannot receive notes.
Select **Reset** and confirm to clear your entries and notes, or cancel to keep them.
The shaded starting numbers stay locked.
Select a numbered square to highlight every occurrence of that number.
Select an empty square to clear the highlights; pencil notes do not count as answers.
Select **Undo** to reverse recent answer, pencil-note, and reset changes.
The elapsed-time timer starts with your first answer or pencil-note change and
stops when **Check Solution** reports Solved. A confirmed **Reset** clears the
timer; canceling leaves it running or stopped as before. Undoing Reset restores
the saved elapsed time and resumes timing if the game had started. Changing or
undoing a solved board resumes timing from its stopped time.

## Online leaderboard

After **Check Solution** reports **Solved**, enter a nickname and select
**Save result** to submit the stopped elapsed time in milliseconds. Nicknames
must contain 1–30 characters with no surrounding whitespace or control characters.
Saving is optional; nicknames and times are public.

The leaderboard shows the 10 fastest results for this fixed puzzle, ordered by
elapsed milliseconds, then completion timestamp and ID to break ties. The puzzle's
81-character starting grid is its stable `puzzle_id`. Times include milliseconds,
although the gameplay timer displays only minutes and seconds.
**Refresh leaderboard** retries failed loads and fetches new results.
Loading, empty, and error messages do not interfere with offline gameplay.

The app uses native `fetch` against Supabase's REST API, without an SDK, build step,
or runtime dependencies. `index.html` contains the project URL and browser-safe
publishable key retrieved through Supabase MCP. This key is intentionally public;
never replace it with a secret or service-role key. Internet access is required
only to load or save leaderboard results.

The schema is recorded in
[`supabase/migrations/20261122173549_create_game_results.sql`](./supabase/migrations/20261122173549_create_game_results.sql)
and has already been applied to the connected project. RLS and column grants let
anonymous and authenticated visitors read results and insert only a nickname,
puzzle ID, and positive bigint elapsed milliseconds. The database generates UUIDs
and completion timestamps; visitors cannot update or delete results.

Save clicks are blocked while a request is pending and after a successful save
for that attempt. A confirmed Reset starts a new attempt; Undo Reset restores the
previous attempt's save state. Editing and rechecking does not permit resubmitting
an already saved attempt. Rejected requests can be retried. If a request times out,
loses its connection, or returns a server error, its outcome may be unknown:
the app disables further saves for that attempt to avoid accidental duplicates.
Refresh the leaderboard to check whether it arrived.

These are self-reported results, not verified completions. Client-side duplicate
protection does not persist across page reloads and cannot prevent forged scores
or spam through the public API. Do not use this leaderboard for competitive prizes
without server-side validation and abuse controls.

## HTML validation

The **Validate HTML** GitHub Actions workflow runs when a pull request targeting
`main` is opened, updated with new commits, or reopened. It checks `index.html`
locally on the runner using `html-validate` 11.21.1 and its default recommended
rules; validation errors fail the check.

The validator checks HTML syntax and structure, element nesting, allowed
attributes and values, duplicate IDs, and accessibility-related markup rules
such as image alternative text and table headers. It also enforces markup
conventions such as an uppercase `DOCTYPE`.
It does not execute JavaScript, validate the dynamically generated Sudoku cells,
test game behavior, or check CSS and visual layout.

To run the same check locally with Node.js 24:

```sh
npx --yes html-validate@11.21.1 index.html
```

For gameplay or leaderboard changes, also test in a browser: answers and locked
cells, notes, Undo, reset/cancel, solution checking and timing, save eligibility,
nickname validation, pending/duplicate saves, failed/unknown saves, and leaderboard
loading/empty/error states. Verify the layout on mobile and desktop. Mock submissions
when testing errors to avoid leaving test scores in the shared leaderboard.
