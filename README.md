# homebrew-tap

Homebrew formulae for [Jedi Knights](https://github.com/jedi-knights) command-line tools.

## Usage

```bash
brew tap jedi-knights/tap
brew install <formula>
```

Or install directly without tapping first:

```bash
brew install jedi-knights/tap/<formula>
```

## Available formulae

| Formula | Description |
| --- | --- |
| [`kyber`](https://github.com/jedi-knights/kyber) | A function-level Go code-quality analyzer — cyclomatic complexity, testability, readability, and more. |
| [`lexicon`](https://github.com/jedi-knights/lexicon) | A markdown-native requirements DSL, translatable to Gherkin, Gauge, and beyond. |

## How formulae get here

Each formula in `Formula/` is generated and pushed automatically by [GoReleaser](https://goreleaser.com) when its source project cuts a release — see the `brews` block in that project's `.goreleaser.yml`. Don't edit files under `Formula/` directly; changes are overwritten on the next release.

## License

Each formula is licensed under its source project's license, linked above.
