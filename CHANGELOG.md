# Changes in Icasus 3
All notable changes are documented in this file using the [Keep a CHANGELOG](https://keepachangelog.com/) principles.

## [3.62.0] - 2022-03-02
### Added
- Strategic Plan and Letter of Commitment can be archived/restored (new database fields are needed)
- New script to migrate indicators from Icasus v1

### Changed
- Updating README file

## [3.61.0] - 2021-06-16
### Added
- Add description for Strategic Line and Strategic Objet (new database fields are needed)
- Edit responsible person for management panel
- Select annual calculation type for historical values whose periodicity has changed

### Changed
- Replace Spanish terms "Cuadro de Mandos" with "Panel de Gestión" and "Panel" with "Bloque"

## [3.60.0] - 2021-05-03
### Added
- Include a commented message for server maintenance event

### Changed
- Remove unnecessary file permissions
- Fetch SSO data correctly

### Fixed
- Fix errors when saving formula results
- Fix Ajax bug when editing indicator analysis

## [3.59.0] - 2021-02-12
### Fixed
- Fix PHP 7 compatibility bugs
- Fix empty template bug

## [3.58.0] - 2020-06-05
### Fixed
- Updated ADODB from 5.14 (2011) to 5.21 (2016)
