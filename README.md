# sudoku-app
A browser-based Sudoku game for exploring GitHub and GitHub Copilot workflows.

Open [index.html](./index.html) in a browser to play offline. Enter digits 1–9
in the empty squares, or select **Check Solution** to check your board.
Toggle **Notes: On** to record multiple possible digits in an empty square.
Enter a digit again to remove that note. Turn notes off to enter an answer;
entering an answer clears that square's notes. Filled squares cannot receive notes.
Select **Reset** and confirm to clear your entries and notes, or cancel to keep them.
The shaded starting numbers stay locked.
Select a numbered square to highlight every occurrence of that number.
Select an empty square to clear the highlights; pencil notes do not count as answers.

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
