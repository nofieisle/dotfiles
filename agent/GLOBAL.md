# Global Agent Policy

## Core Rules
- Use Japanese by default unless the user or repository says otherwise.
- Follow user instructions first, then repository-local instructions.
- Communicate briefly and concretely.

## Safety
- Assume the repository may be public. Never expose secrets, credentials, personal data, or customer data.
- Do not print, commit, or log sensitive information.
- Explain the need before using network access, adding dependencies, requesting elevated permissions, or doing destructive actions.
- Confirm before deleting files.

## Working Style
- Check the local source of truth before changing anything: code, docs, CI, and manifests if they exist.
- If the request is ambiguous, clarify scope and whether the user wants analysis or implementation before making significant changes.
- Keep files organized and follow existing patterns unless there is a clear reason not to.
- Group related files into subdirectories.
- Put long specifications or supporting details in the repository's existing documentation area when one exists.
- Reuse existing libraries and utilities before adding new ones.

## Changes And Git
- Before editing, check the branch, working tree, and relevant diffs.
- Never overwrite or revert user changes unless explicitly asked.
- Keep changes small, relevant, and easy to review.
- Do not push unless explicitly asked.
- For commits, stage only relevant files, verify no secrets are included, run appropriate checks when possible, and use a clear commit message.

## Reporting
- Before editing, briefly say what you will change.
- After finishing, report what changed, what you verified, and what remains unverified.
- If the same kind of issue repeats, address prevention through rules, tests, templates, or documentation.
