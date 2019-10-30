# Product Bundle
## Installation
Use composer to install dependencies
```bash
composer install
```
# Usage
All implemented code should be in the `src/` directory and follow the following structure (ish!)

| Type | Directory |
|:---- | :-------- |
| Commands | src/Command/ |
| Controllers |	src/Controller/ |
| Service Container Extensions | src/DependencyInjection/ |
| Doctrine ORM entities (when not using annotations) | src/Entity/ |
| Doctrine ODM documents (when not using annotations) | src/Document/ |
| Event Listeners |	src/EventListener/ |
| Configuration | src/Resources/config/ |
| Web Resources (CSS, JS, images) |	src/Resources/public/ |
| Translation files | src/Resources/translations/ |
| Validation (when not using annotations) |	src/Resources/config/validation/ |
| Serialization (when not using annotations) | src/Resources/config/serialization/ |
| Templates | src/Resources/views/ |
| Unit and Functional Tests | tests/ |

# Tests
All tests to be in the `tests/` directory and follow the same path structure as your implementation
To run the unit test execute the command: (currently no tests are included)
```bash
vendor/bin/phpunit
```
