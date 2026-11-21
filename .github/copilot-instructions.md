# Repository instructions

## Structure
- The game lives entirely in `index.html`: HTML, inline CSS, and vanilla JavaScript.
- JavaScript generates the 9×9 board from fixed puzzle and solution strings.
- Starting numbers are read-only. Pencil notes are stored separately from answers.
- Preserve notes toggling, solution checking, reset confirmation, accessibility, and responsive layout.
- Keep the app dependency-free; no framework, server, or build step is needed.

## Run
Open `index.html` directly in a browser. The game works offline.

## Validate
With Node.js 24, run:

```sh
npx --yes html-validate@11.21.1 index.html
```

`.github/workflows/validate-html.yml` runs this check for pull requests targeting `main`.
It validates static HTML, not JavaScript behavior or CSS layout. For gameplay changes,
also verify normal entry, locked cells, notes, reset/cancel, and solution checking
in a browser.
