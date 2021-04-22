# Changelog #

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased] ##

### [ Documentation ] ###

#### Added ####

* Add missing documentation to the project
  
#### Changed ####

* Update README.md file

### [ HomeView - Reachability ] ###

#### Added ####

* Add reachability handler

### [ HomeView - Error ] ###

### Added ###

* Add error handling
* Add retry button

### [ Jazzy - config ] ###

### Added ###

* Add jazzy documentation config

### [ MeliTheme - Colors ] ###

#### Added ####

* Add MeliTheme
* Add background color to theme

#### Changed ####

* Change navigationBar background color

### [ Images - KingFisher ] ###

#### Added ####

* Add KingFisher dependency to handle image loading
* Add images to product cell and product details

#### Changed ####

* Add picture attribute to DTOs

### [ AlamofireService - CancelRequest ] ###

#### Added ####

* Add cancel request method

### [ AlamofireItemService - offset] ###

#### Fixed ####

* Fix cached items bug

### [ Navigation - Coordinator ] ###

#### Added ####

* Add navigation coordinator

#### Changed ####

* Refactor navigation to use coordinator

### [ Product details - UI ] ###

#### Added ####

* Add graphical layout
* Add state pattern to Product details
* Add error retrier to the view

#### Changed ####

* Update swiftlint implementation

### [ Memory management - leaks ] ###

#### Changed ####

* Update relations between objects

#### Issue ####

* Found unfixable issue with character set [instance of __NSCFCharacterSet leaked](https://github.com/Alamofire/Alamofire/issues/3374) 

### [ Products - Home ] ###

#### Added ####

* Add home layout
* Add HomeViewModel
* Add HomeView protocol
* Add HomeViewState protocol
* Add HomeViewController unit tests
* Add HomeViewModel unitTests
* Add state pattern to home views

#### Changed ####

* Update test plans

### [ Networking - Products ] ###

#### Added ####

* Add ProductTranslator
* Add MockItemService
* Add JsonHelper to handle mocked information
* Add Item DTOs
* Add Product model

#### Changed ####

* Add items errors to ItemServiceErrors
* Add item route to ItemServiceRouter
* Add item ItemService protocol

## [0.0.3] ##

### [ Networking - Alamofire ] ###

#### Added ####

* Add ItemService protocol
* Add AlamofireItemService
* Add response DTOs
* Add Tests plans
* Add build configurations for Debug and Release

### [ Project - UIKit ] ###

#### Changed ####

* Refactor to UIKit project

### [ Sonar - setup] ###

#### Added ####

* Add sonar cloud to project
* Add sonar to GitHub actions
* Add sonar properties

### [ Project - setup] ###

#### Added ####

* Add project setup
* Add SwiftLint to project