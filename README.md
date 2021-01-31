

#  Map Pin Picker

<p align="left"><a href="https://pharous.com" target="_blank"><img src="https://www.pharous.com/assets/site/img/logo.svg" width="470"></a></p>

[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://www.pharous.com/) 

A Swipe Drawer Library for Easy and Quick Usage.
* Checkout the Original Author : [![GitHub followers])](https://github.com/ahmedelsayed96)


The source code is **100% Dart**, and everything resides in the [/lib](https://github.com/pharous-flutter/map_pin_picker/tree/master/lib) folder.


### Show some :heart: and star the repo to support the project



[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/MIT)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/pharous-flutter/drawer_swip/tree/master/LICENSE)


### GIF
<img src="https://github.com/pharous-flutter/map_pin_picker/raw/master/screens/map_picker.gif" height="400" alt="GIF"/>

## 💻 Installation
In the `dependencies:` section of your `pubspec.yaml`, add the following line:



```
map_pin_picker: <latest_version>
```

## ❔ Usage

### Import this class
```dart
import 'package:map_pin_picker/map_pin_picker.dart';
```

### Use MapPicker

```dart
import 'package:geocoder/geocoder.dart'; //import geocoder to get address line from coordinates
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_pin_picker/map_pin_picker.dart';

  @override
  Widget build(BuildContext context) {
 return new Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MapPicker(
              // pass icon widget
              iconWidget: Icon(Icons.location_pin,
                size: 50,
              ),
              //add map picker controller
              mapPickerController: mapPickerController,
              child: GoogleMap(
                zoomControlsEnabled: false,
                // hide location button
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                //  camera position
                initialCameraPosition: cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onCameraMoveStarted: () {
                  // notify map is moving
                  mapPickerController.mapMoving();
                },
                onCameraMove: (cameraPosition) {
                  this.cameraPosition = cameraPosition;
                },
                onCameraIdle: () async {
                  // notify map stopped moving
                  mapPickerController.mapFinishedMoving();
                  //get address name from camera position
                  List<Address> addresses = await Geocoder.local
                      .findAddressesFromCoordinates(Coordinates(
                      cameraPosition.target.latitude,
                      cameraPosition.target.longitude));
                  // update the ui with the address
                  textController.text='${addresses.first?.addressLine ?? ''}';
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
```

## 🎨 Customization and Attributes

#### MapPicker attributes
<table>
    <th>Attribute Name</th>
    <th>Example Value</th>
    <th>Description</th>
    <tr>
        <td>child</td>
        <td>GoogleMap()</td>
        <td>Google map widget</td>
    </tr>
    <tr>
        <td>iconWidget</td>
        <td>Icon(
                Icons.location_pin,
                size: 50,
              )</td>
        <td>Pin icon widget </td>
    </tr>
    <tr>
        <td>mapPickerController</td>
        <td>20.0</td>
        <td>body radius value the default value is 0.0 </td>
    </tr>
    <tr>
        <td>bodyBackgroundPeekSize</td>
        <td>MapPickerController()</td>
        <td>The controller that control pin animation</td>
    </tr>
    <tr>
        <td>showDot</td>
        <td>true</td>
        <td>show dot under the pin ,the default value is true</td>
    </tr>

</table>

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<table>
  <tr>
   <td align="center"><a href="https://github.com/ahmedelsayed96"><img src="https://avatars1.githubusercontent.com/u/18017854?s=100" width="100px;" alt=""/><br /><sub><b>Ahmed Eslayed</b></sub></a><br /><a href="https://github.com/ahmedelsayed96" title="Coding">💻</a></td>
</table>

# 📃 License

    Copyright (c) 2012 Pharous

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
