<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [material_icons_named](#material_icons_named)
  - [Table of Contents](#table-of-contents)
  - [Live Example](#live-example)
  - [Introduction](#introduction)
  - [Usage](#usage)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# material_icons_named

## Table of Contents

* [Live Example](#live-example)
* [Introduction](#introduction)
* [Usage](#usage)


## Live Example

* [Web](https://peiffer-innovations.github.io/material_icons_named/web/index.html#/)


## Introduction

Library that builds and provides auto-generated string to icon mapping for all Material based from the `stable` branch for Flutter.

Please note, if you include this library then Flutter will give you errors stating that it cannot tree shake icons when building for Android and iOS.  You must add the `--no-tree-shake-icons` flag to your builds.  For example:

```
flutter build apk --release --no-tree-shake-icons
```

Due to Flutter not being able to tree shake the icons, the Material Icons alone can add up to 350k to your final app build.  That will be in addition to any other icons you may be using that will no longer be able to be shaken out.


## Usage

```dart
import 'package:material_icons_named/material_icons_named.dart';

...

Icon(materialIcons['wifi_tethering_outlined']),

...

```