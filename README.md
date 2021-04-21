# MercadolibreMobileTest

Test project build using MercadoLibre REST API.
* Searching by given term
* Showing found results in a list
* Present selected product details
* Add a state machine for the view handling

## Changelog ##

:scroll: [Changelog](https://github.com/ingjohnguerrero/MercadolibreMobileTest/blob/main/CHANGELOG.md)

## Dependency manager ##

### SPM ###

* Althought I have always used [cocoapods](https://cocoapods.org) this time I decided to try SPM, driven by the project size.

## Static analysis ##

### Sonar Cloud ###
[![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=ingjohnguerrero_MercadolibreMobileTest)](https://sonarcloud.io/dashboard?id=ingjohnguerrero_MercadolibreMobileTest)

### Swift Lint ###
:page_facing_up: [Swift Lint - Code linter](https://github.com/realm/SwiftLint)

## Tests coverage ###

### Code cov ###
- [![codecov](https://codecov.io/gh/ingjohnguerrero/MercadolibreMobileTest/branch/main/graph/badge.svg?token=tr3x4sKNOo)](https://codecov.io/gh/ingjohnguerrero/MercadolibreMobileTest)
- Updated each time the main branch is updated

## CI Build status ##

- Main: [![Build Status](https://app.bitrise.io/app/74b43ad5976193aa/status.svg?token=f5xLEzwfgMYzFwLmYFQUgg&branch=main)](https://app.bitrise.io/app/74b43ad5976193aa)
- Develop: [![Build Status](https://app.bitrise.io/app/74b43ad5976193aa/status.svg?token=f5xLEzwfgMYzFwLmYFQUgg&branch=develop)](https://app.bitrise.io/app/74b43ad5976193aa)

## Project documentation ##

:bookmark_tabs: [Jazzy Documentation](https://ingjohnguerrero.github.io/MercadolibreMobileTest)

## Build configuration ##

* In order to change the base url for the endpoints, you can update these [files](https://github.com/ingjohnguerrero/MercadolibreMobileTest/tree/feature/main/MercadoLibre/SupportFiles/BuildConfigurations) depending on the scheme