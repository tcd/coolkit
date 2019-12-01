# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `Coolkit.list_files` - To return an array with the names of all files (not folders) in a given folder.
- `Coolkit.clean_folder` - To remove all files from a given folder.

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
- `root_dir`, `data_dir`, `data_dir` for finding your way without `Rails.root`
- `symbolize_keys` to get by without .
- `to_est` to convert UCT time to EST.
- `write_to_file` to write to a given path and not worry if parent folders exist yet.
- `Array#remove_first` to remove the first *x* from an array.
- `String#indent` from ActiveSupport. (Because it's excessive to require it for just that)
- `String#comment` to comment ruby code in strings.
