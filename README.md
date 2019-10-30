# DEMO application
This is a demo application to show how you can create simple front-ends (in this instance an api), with a shared library of business logic.

## Library
Here we create the sharable bundles. Each shared bundle contains its own dependencies managed via composer. When you make a change to a shared bundle increment the version in the composer file.

## API Application
The main front-end simply contains the endpoints for the application.  