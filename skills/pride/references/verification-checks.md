# Verification Checks by Project Type

Reference for the Pride skill. Use this to detect the project type and run
the appropriate verification commands.

---

## Project Detection

Check for these files in the project root to identify the stack:

| File | Project Type |
|------|-------------|
| `package.json` | Node.js / TypeScript |
| `pyproject.toml` or `setup.py` or `requirements.txt` | Python |
| `Cargo.toml` | Rust |
| `go.mod` | Go |
| `Gemfile` | Ruby |
| `pom.xml` or `build.gradle` | Java / Kotlin |
| `Package.swift` | Swift |
| `Makefile` | Check contents for clues |

If multiple are present, prioritize the one most relevant to the files changed.

---

## Node.js / TypeScript

### Test Runners
Detect from `package.json` scripts or installed dependencies:

| Runner | Detect | Run |
|--------|--------|-----|
| Jest | `jest` in devDeps or scripts | `npx jest --no-coverage` |
| Vitest | `vitest` in devDeps or scripts | `npx vitest run` |
| Mocha | `mocha` in devDeps or scripts | `npx mocha` |
| Playwright | `@playwright/test` in devDeps | `npx playwright test` |
| Generic | `"test"` script in package.json | `npm test` |

### Type Checking
- If `tsconfig.json` exists: `npx tsc --noEmit`
- Check for TypeScript errors in new/modified `.ts` and `.tsx` files

### Linting
- If `.eslintrc*` or `eslint.config.*` exists: `npx eslint <changed-files>`
- If `biome.json` exists: `npx biome check <changed-files>`

### Build
- If `"build"` script in package.json: `npm run build`
- If `next.config.*` exists: `npx next build`
- If `vite.config.*` exists: `npx vite build`

---

## Python

### Test Runners

| Runner | Detect | Run |
|--------|--------|-----|
| pytest | `pytest` in deps or `pytest.ini` / `pyproject.toml [tool.pytest]` | `python -m pytest` |
| unittest | Test files with `unittest.TestCase` | `python -m pytest` (usually works) |
| Generic | `test` script in pyproject.toml | Check pyproject.toml scripts |

### Type Checking
- If `mypy` in deps or `mypy.ini` / `pyproject.toml [tool.mypy]`: `python -m mypy <changed-files>`
- If `pyright` in deps: `npx pyright <changed-files>`

### Linting
- If `ruff` in deps or `ruff.toml`: `python -m ruff check <changed-files>`
- If `flake8` in deps: `python -m flake8 <changed-files>`

### Build
- If `pyproject.toml` with build-system: `python -m build --check`
- Quick syntax check: `python -m py_compile <changed-files>`

---

## Rust

### Tests
- `cargo test`

### Linting
- `cargo clippy -- -D warnings`

### Build
- `cargo build`

### Formatting Check
- `cargo fmt --check`

---

## Go

### Tests
- `go test ./...`

### Linting
- `go vet ./...`
- If `golangci-lint` available: `golangci-lint run`

### Build
- `go build ./...`

---

## Ruby

### Tests

| Runner | Detect | Run |
|--------|--------|-----|
| RSpec | `rspec` in Gemfile | `bundle exec rspec` |
| Minitest | Test files with `Minitest::Test` | `bundle exec ruby -Itest <test-file>` |
| Rails | `rails` in Gemfile | `bundle exec rails test` |

### Linting
- If `rubocop` in Gemfile: `bundle exec rubocop <changed-files>`

---

## Java / Kotlin

### Tests and Build
- Maven: `mvn test`
- Gradle: `./gradlew test`

### Linting
- Check for Checkstyle, SpotBugs, or ktlint in build config

---

## Generic / Unknown

If the project type is unclear:

1. Check for a `Makefile` — look for `test`, `check`, `lint`, or `build` targets
2. Check for `scripts/test.sh` or similar
3. Check CI config (`.github/workflows/`, `.gitlab-ci.yml`, `Jenkinsfile`) for test commands
4. Check for a `justfile` (just command runner)
5. If nothing found, state: "No test runner detected. Manual verification of changed files only."

---

## Running Checks

When running any check:
1. Run the command
2. Capture the **full output** (or at least the summary)
3. Report: command run, exit code, pass/fail counts, any errors
4. Do not interpret a failed command as "probably fine" — report what happened

If a command fails to run (not found, permission denied), report that too.
Do not silently skip checks.
