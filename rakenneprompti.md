IMPORTANT — MANUAL EXECUTION REQUIRED

This prompt must NOT be executed automatically.

It contains instructions that perform environment setup, dependency installation,
version management, secret creation, Git initialization, and remote pushes.
Running these steps without explicit user confirmation may cause unintended
changes to the project, the development environment, or the linked GitHub
repository.

Claude Code must only execute this prompt when the user explicitly issues a clear command such as:

    "Execute the setup prompt now."
    "Run the environment initialization."
    "Proceed with the MkDocs deployment steps."

Until such a command is given, Claude Code must treat this prompt as a stored
instruction template and MUST NOT perform any actions described within it.

Do not run automatically. Do not trigger on load. Do not execute without user
authorization.

=================================================================

You are an AI assistant responsible for preparing, validating and deploying a MkDocs Material documentation site.

Follow these steps EXACTLY and IN ORDER:

# 1. Use existing project structure
- Use the existing `docs/` directory and its content.
- Use the existing `mkdocs.yml` file without overwriting it.
- Validate that mkdocs.yml is syntactically correct.

# 2. Create and activate Python virtual environment
- Create a folder named `.venv`
- Initialize a Python virtual environment inside it
- Activate the environment
- Upgrade pip

# 3. Install MkDocs with version control
- Check installed mkdocs version.
- If mkdocs is NOT between **1.5.x and 1.6.x**, uninstall it and install:
    mkdocs==1.6.0
- Confirm mkdocs version after installation.

# 4. Install MkDocs Material and required plugins
Install the following packages:

    pip install mkdocs-material
    pip install mkdocs-mermaid2
    pip install mkdocs-katex-plugin
    pip install mkdocs-git-revision-date-localized-plugin
    pip install mkdocs-minify-plugin
    pip install mkdocs-redirects
    pip install mkdocs-awesome-pages-plugin

Validate installation by running:
    mkdocs --version

# 5. Enable Mermaid and math rendering
- Ensure mkdocs.yml contains the required plugin entries:
    - mermaid2
    - katex
- Ensure mkdocs.yml contains the required markdown extensions:
    - admonition
    - toc
    - tables
    - attr_list
    - md_in_html
    - pymdownx.superfences
    - pymdownx.highlight
    - pymdownx.arithmatex

Do NOT remove existing configuration. Only add missing items.

# 6. Create secrets directory for GitHub deployment
- Create `.secrets/` directory
- Inside it create `config.env` with the following placeholders:

AIDE_API_KEY=""
OPENAI_API_KEY=""
ANTHROPIC_API_KEY=""
GITHUB_TOKEN=""

- Add `.secrets/` to `.gitignore`

# 7. Initialize Git repository
- Run:
    git init
    git add .
    git commit -m "Initial commit"

# 8. Add GitHub remote
- Use SSH remote:
    git remote add origin git@github.com:MipoRepo/networking-guide.git

# 9. Push project to GitHub
- Run:
    git branch -M main
    git push -u origin main

# 10. Build and serve MkDocs locally for validation
- Run:
    mkdocs build
- If build succeeds, run:
    mkdocs serve

# 11. Deploy MkDocs site to GitHub Pages
- Run:
    mkdocs gh-deploy --force

# 12. Output final deployment URL
Print:
    https://miporepo.github.io/networking-guide/

Perform all steps in order and show the commands you execute.
