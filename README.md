# Marvel Heroes
<br />
  <p align="center">
    Marvel Heroes repository based on Marvel API https://developer.marvel.com/docs
  </p>
</p>

## Requirements

- iOS 13.0+
- Xcode 12.x

## Installation

#### CocoaPods

- [x] Add SDWebImage pod to load images asynchronusly and save them on cache.
- [x] Add SwiftyJson to parse json response to swift models quickly.

```ruby
pod install
```

## Features

- [x] Connect to Marvel API with properly authentication (see Config/MSConfig.swift and Service/MSUtils.swift)
- [x] Service folder manage two request to get the API info, with the first list call we already have all needed data but I prefer separate the second detail call. Also I decide parse only used data in MSCharacterLite to improve the perfonmance. In the big Entity (MSCharacter) there are the rest fields.
- [x] The project uses VIPER architecture to modularize the code by screens, CharacterList and CharacterDetails. The Entities are in Service folder but the rest inside of Modules.
- [x] The views are loaded by Storyboards with Autolayout.
- [x] When the app finish to start, the CharacterList module is loaded. In this screen, we can see a collection view with Marvel's Heroes list, showing image and name. This images has not the same aspect ratio between them, so I decide to use AspectFill on the image to give them more uniformity.
- [x] When any cell is selected, the character detail is loaded in a new pop up, when we can see the detailed information about his Comics, Series, Stories, Events and Links.
- [x] Also, I write some quick unit MSService class test (using real service).

## Screenshots

<p align="row">
<img src= "https://github.com/javier-pintor/marvel-heroes/blob/main/Resources/Screenshots/Mobile/character_list_mobile.png" width="400" >
<img src= "https://github.com/javier-pintor/marvel-heroes/blob/main/Resources/Screenshots/Mobile/character_detail_mobile.png" width="400" >
<img src= "https://github.com/javier-pintor/marvel-heroes/blob/main/Resources/Screenshots/iPad/character_list_ipad.png" width="400" >
<img src= "https://github.com/javier-pintor/marvel-heroes/blob/main/Resources/Screenshots/iPad/character_detail_ipad.png" width="400" >
</p>


## Next steps

- [ ] Add pagination to CharacterListView would be necessary to access to entire information. Now the service return only the twenty first results.
- [ ] Add unit test to rest of the code (Modules folder).
- [ ] Add more SOLID architecture to isolate parts of code, like the Entities of the Service, which are used even by the views now.
- [ ] Improve UI to add loading indicators and many more.