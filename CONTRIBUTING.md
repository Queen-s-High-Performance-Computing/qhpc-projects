# Contributing

Keep material concise and useful to QHPC members. This file owns shared content standards; [AGENTS.md](AGENTS.md) adds agent workflow instructions.

## Layout

- `proposals/<project-name>/README.md`: one proposal per idea, with supporting files beside it when needed.
- `proposals/template.md`: the shared proposal starting point.
- `samples/<sample-name>/`: small educational examples supporting proposals.
- `resources/`: annotated references to papers, repositories, and other material.

Use descriptive lowercase filenames and kebab-case directory names. Add content to its area's README index. Link project-specific references and samples from the proposal; avoid duplicating shared material. Create additional directories only when they have content.

## Add a proposal

1. Create `proposals/<project-name>/` and copy the template to its `README.md`.
2. Replace prompts with available information; use **TBD** for unknowns.
3. Add a link and a short description to `proposals/README.md`.

Early ideas need not answer every question. Make assumptions, limitations, and next steps clear. Team sizes and participation follow member interest; no fixed team size is required. Project selection is flexible and handled internally.

Update [the template](proposals/template.md) whenever the repository structure or proposal requirements change. Keep existing proposals and incoming links aligned where the change affects them.

## Project resources and lifecycle

Projects support learning, SC27 and ISC preparation, and other supercomputing competition work, including benchmarking, scientific applications, and useful software.

Use the CAC and `frnt201`, the club's node, as project computing resources. Describe actual access and requirements without assuming node specifications or scheduler settings. Direct requests for additional hardware to the QHPC presidents so they can discuss needs, plan a budget, and arrange purchases.

Project implementations belong in separate repositories in the QHPC GitHub organization, not in this repository or under individual GitHub accounts. Link those repositories from the relevant proposals once they exist. Samples here should remain small supporting examples, not grow into project implementations.

Project repositories and their contents remain in the organization through archival. After archival, members may fork a project to continue development independently, subject to its license. Repository visibility may change over time; do not assume all project material is public.

## Content conventions

- Add an optional `## Prerequisites` section before a proposal's overview only when members need essential background to understand it. Keep it brief, link relevant reading directly, and omit it when unnecessary. Reuse relevant QHPC Meetings guides rather than copying them. Keep implementation tools, hardware, and access requirements in the proposal's resource planning section.
- For samples, include purpose, dependencies, setup/run commands, expected output, and a small correctness check. State where commands run and required hardware.
- Use Bash shell examples. On Windows, use Windows Terminal with WSL or Git Bash.
- Prefer primary sources and stable paper or repository URLs. Explain why each resource is useful and distinguish reading, reproduction, and reuse.
- For papers, record title, authors, year, and DOI or source link. For repositories, record owner/name, URL, relevance, and license when proposing code reuse; identify the version or commit when reproducing results.
- Prefer links to third-party material. Include local copies only when redistribution is permitted, preserving source and attribution. Keep large datasets, build output, credentials, and machine-specific configuration out of Git.
- Do not claim benchmarks or successful execution without evidence. Include the hardware, configuration, and command when reporting performance results.
- Use relative links for local files and descriptive link text. Repair incoming links when moving files or renaming headings.

Repository licensing remains undecided; do not assume reuse permissions.

## Check and submit

Review changed Markdown on GitHub or in a Markdown preview. Check local links, heading anchors, index entries, and alignment with the proposal template. From the repository root:

```bash
git diff --check
git diff --cached --check
git status --short
```

Git diff checks omit untracked files; inspect those directly. There is currently no automated test suite or CI. Members run project workloads on the CAC where applicable; AI agents focus on drafting and review and do not execute workloads. Document sample checks for members to run and report anything not verified.

Keep pull requests focused and describe changes, validation, and open questions.

## Design references

- [AGENTS.md](https://agents.md/): a dedicated agent entry point with actionable workflow guidance.
- [GitHub contribution guidelines](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/setting-guidelines-for-repository-contributors): discoverable shared contribution instructions.
