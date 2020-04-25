# My Apps Architecture

The project includes template for architecture of Flutter Apps.

General structures of architecture is following:

**- bloc**
  - package for each bloc
    - FooBloc
    - FooEvent
    - FooState
    
**- contractors**
    - interfaces
    
**- data**
    - model (entities, PODO classes)
    - repository (UserRepository, so on)
    - service (ApiService, DatabaseService, SharedPreferencesService, etc)
    
**- presentation*
    - dialogs
    - pages
    - shared (TextStyles, Colors, etc)
    - widgets (parts of pages)
    - router (routing logic)

**- utils**
