---
name: quick-docs-edit
description: Fast, minimal-scope editing of MkDocs documentation, images, and navigation. Use for small changes to docs/*.md, adding images to Markdown, or changing mkdocs.yml navigation.
---

# Quick Docs Edit

## Purpose

Make small documentation changes quickly with the smallest possible context and repository exploration.

## Core rule

**Do not inspect the whole repository.**

Start with the file explicitly mentioned by the user and inspect only files directly required for the requested change.

Do not read unrelated documentation, source material, todo history, or other project files.

---

## 1. Edit text in a Markdown file

When the user asks to correct, rewrite, add, remove, or modify text in a specific `.md` file:

1. Open only the requested Markdown file.
2. Locate the relevant section.
3. Make the requested change.
4. Preserve the existing structure and style.
5. Do not modify other files unless necessary.
6. Do not perform a repository-wide review.

### Verification

Only verify the changed file.

Do not run unnecessary searches, builds, or full documentation analysis for a simple text correction.

---

## 2. Image change

When the user asks to add, replace, move, or modify an image:

1. Open the specified Markdown file.
2. Inspect only the image path/location needed for the change.
3. Check the relevant image asset if necessary.
4. Make the smallest required Markdown change.
5. Preserve surrounding content.

If the image requires CSS or MkDocs configuration, inspect only the directly relevant configuration.

Do not inspect the entire `docs/` tree.

### Typical scope

1 Markdown file
+ 1 image asset if required

### Verification

Verify:

- image path
- Markdown syntax
- relative path correctness

Only build the documentation if the change affects rendering in a way that requires a build.

---

## 3. Navigation change

When the user asks to change the documentation menu, navigation, sidebar, or page order:

1. Open `mkdocs.yml`.
2. Locate the `nav:` section.
3. Make only the requested navigation change.
4. Preserve all unrelated navigation entries.
5. Do not rewrite or reorganize the documentation.
6. Do not inspect every Markdown file unless a missing/invalid path must be verified.

### Typical scope

mkdocs.yml

### Verification

Check that:

- YAML syntax remains valid.
- The changed navigation entries point to the intended files.
- No unrelated navigation entries were changed.

---

## 4. Content + navigation change

When the requested change modifies both Markdown content and the navigation:

1. Open only the specified Markdown file.
2. Open `mkdocs.yml`.
3. Make the requested content change.
4. Make the corresponding navigation change.
5. Preserve unrelated content and configuration.

### Typical scope

1 Markdown file
+ mkdocs.yml

Expand scope only when the requested change cannot be completed otherwise.

---

## 5. Updating `mkdocs.yml`

`mkdocs.yml` is the central configuration file for navigation and MkDocs configuration.

When a requested documentation change requires `mkdocs.yml`:

- modify it directly;
- make the smallest possible change;
- preserve existing configuration;
- do not regenerate the file;
- do not reorder unrelated settings.

Do not change `mkdocs.yml` merely because a Markdown file was edited.

---

## Scope rules

Keep the scope as small as possible.

For a simple text correction:

1 Markdown file

For an image change:

1 Markdown file
+ 1 image asset if required

For a navigation change:

mkdocs.yml

For a content + navigation change:

1 Markdown file
+ mkdocs.yml

Expand scope only when the requested change cannot be completed otherwise.

---

## Do not do these things unless explicitly requested

- Read the entire repository.
- Read all docs/ files.
- Read materiaali/.
- Analyze networking source material.
- Read old todo versions.
- Rewrite unrelated documentation.
- Refactor CSS unrelated to the request.
- Reorganize the project.
- Rebuild mkdocs.yml from scratch.
- Perform full documentation QA.
- Run expensive tests for a trivial Markdown edit.
- Make unrelated improvements.

---

## Todo system

The project's todo/sisalto-todo*.md files control the larger documentation-production process.

Do not read or modify todo files for ordinary quick documentation edits.

Only use the todo workflow when the user explicitly asks to continue or execute the planned documentation-production process.

---

## Response behavior

After completing the requested change:

- briefly state what was changed;
- mention modified files;
- mention verification performed, if any.

Do not provide a long analysis of the project unless requested.