# Agent guidance

`honestoygor/self-paced` is a public repository licensed under AGPL-3.0.
Everything in it, including issues, PR text and review threads, is public.

## How work ships

- A GitHub issue is the unit of work. Its `## Done when` list is the acceptance,
  and its `## Out of scope` list is binding. An open issue alone doesn't
  authorize work; the owner names the issue to start.
- One branch and one PR per issue, from `main`, in its own worktree. Never push
  to `main` or force-push it.
- The PR body says `Closes #<n>` and has a `## Done when` checklist: each item
  from the issue copied word for word on its own line, with the evidence after
  it on the same line. Tick a box only when the proof is in the PR; leave it
  unticked with the reason otherwise.
- Run the `verify` command from `.github/project.yml` before opening the PR and
  include its result. CI runs the same command as the `verify` check.
- Codex and CodeRabbit review every PR. Fix each finding, or answer it with a
  reason, on the current head. If CodeRabbit hasn't reviewed (it needs a manual
  trigger while the repo has fewer than 10 stars), comment `@coderabbitai review`.
  If the Codex review is stale, comment `@codex review`.
- The owner merges after CI and both reviews pass. Don't merge unless the owner
  asks for that merge.
- Status and priority live on the owner's "Work" project board, never in a file
  here. Don't edit board fields by hand.

## Code Review Rules

- The PR must close an issue, and its `## Done when` checklist must copy that
  issue's items word for word. Flag a ticked box whose evidence isn't in the PR,
  and changes the issue doesn't ask for or lists under Out of scope.
- This repository is public. Flag secrets, tokens, personal email addresses, IP
  addresses, private host names and machine-specific absolute paths in tracked
  files, logs, fixtures and screenshots.
- Flag workflow changes that use `pull_request_target`, run on self-hosted
  runners, widen `permissions`, expose secrets to pull requests from forks, or
  merge, publish or deploy automatically.
- Flag a behavior change that no test or `verify` step covers when the PR
  claims it works.
