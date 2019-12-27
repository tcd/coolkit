# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.5.0 (Unreleased)

### Added

- `Coolkit.full_extension`
- `Coolkit.yaml2json` for converting YAML files to JSON. Handy for writing JSON schema files in YAML.
- Assorted methods for finding duplicates in string arrays.

## 0.4.0 (no release)

### Added

- `String#normalize!` / `String#normalize` to remove non-letter characters from a string.
- `String#snake_case` / `String#snake_case` to convert a string to snake_case.
- `String#pascal_case` / `String#pascal_case` to convert a string to PascalCase.

### Changed

- Updated readme.
- Fixed method notation in changelog.
- Added namespaces to tests.


## 0.3.0 (2019-12-10)

### Added

- `String#trim_trailing_whitespace!` / `Stringt#rim_trailing_whitespace` to remove trailing spaces following all newlines in a string.
- `Coolkit.list_files` to return an array with the names of all files (not folders) in a given folder.
- `Coolkit.clean_folder` to remove all files from a given folder.

### Changed

- Renamed `JSON.read` to `JSON.parse_file`.
- Refactor code, require explicit `require` statements for monkey-patched methods:
    - `Array#remove_first!` / `Array#remove_first` (`require "coolkit/core_ext/array/remove_first"`)
    - `JSON.parse_file` (`require "coolkit/core_ext/json/parse_file"`)
    - `String#comment!` / `String#comment` (`require "coolkit/core_ext/string/comment"`)
    - `String#indent!` / `String#indent` (`require "coolkit/core_ext/string/indent"`)

## 0.2.2 (2019-11-19)

### Changed

- Don't load code in `coolkit.gemspec`.
    - (When running `bundle exec rake test`, `Coolkit::VERSION` was required before `simplecov`, so version tests were ignored.
    - Added test to make sure `Coolkit::VERSION` and the version string in `coolkit.gemspec` match.

## 0.2.1 (2019-11-19)

### Fixed

- Fixed incorrectly named variable in `Coolkit.symbolize_keys`.

## 0.2.0 (2019-11-17)

### Added

- `JSON.read` to replace `JSON.parse(File.read(path))`. Inspired by `CSV.read`.

## 0.1.0 (2019-11-17)

### Added

- `Coolkit::Error` and `Coolkit::VERSION`.
- `Coolkit.root_dir`, `Coolkit.data_dir`, `Coolkit.data_dir` for finding your way without `Rails.root`
- `Coolkit.symbolize_keys` to get by without .
- `Coolkit.to_est` to convert UCT time to EST.
- `Coolkit.write_to_file` to write to a given path and not worry if parent folders exist yet.
- `Array#remove_first!` / `Array#remove_first` to remove the first *x* from an array.
- `String#indent!` / `String#indent` from ActiveSupport. (Because it's excessive to require it for just that)
- `String#comment!` / `String#comment` to comment ruby code in strings.
