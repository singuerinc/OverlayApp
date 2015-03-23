![overlay](https://dl.dropboxusercontent.com/u/311265/overlay/overlay.jpg)

## About

Is an application to overlay an image and use it as a guide.<br/>
The most common scenario to use it is in web development.

### [Download](https://dl.dropboxusercontent.com/u/311265/overlay/build/latest/Overlay_0.0.90.air) ###
[Adobe AIR](http://get.adobe.com/air) is required

## How it works ##

1. Open Overlay (yeah, obvious step...)
2. **Drag and drop an image** (jpg, png or gif) into the drop area
3. Position the Overlay window where you want it (over Chrome for example) and lock the window (**L** key)
4. Start coding and try to match the image (suddently the art director will start loving your work)

![overlay](https://dl.dropboxusercontent.com/u/311265/overlay/overlay_animated.gif)

## Features

### Scale image
![overlay](https://dl.dropboxusercontent.com/u/311265/overlay/demo_scale.gif)

## Keymap

|Key|Behaviour|
|---|---------|
|0 to 9|Changes image alpha  ±10%|
|+ and -|Changes image alpha  ±5%|
|i|Invert image colors.|
|x|Remove the image.|
|||
|"arrows"|Changes window position ±1px|
|"arrows"+shift|Changes window position ±10px|
|* key|Move the window back and forth|
|l|Lock/Unlock the window.|
|t|Window always on top (on-off).|
|s or h|Show and hide the window.|
|||
|alt+move|Show guides|
|alt+click|Copy position|
|alt+"+"|Zoom in|
|alt+"-"|Zoom out|
|"z"|Scale +0.25|
|shift+"z"|Scale -0.25|
|cmd+click|Copy hex color|

## Features

- Guides
- Invert image colors
- Copy hex color to clipboard
- Copy position to clipboard
- Zoom area
- Scale image

## Change log

### 0.0.72
- Retina Icon!

### 0.0.71
- New Icon!

### 0.0.7
- Scale image with Z (scale +0.25) or Shift + "Z" (scale -0.25)

### 0.0.6
- Fix copy color to clipboard coords

### 0.0.5
- Change Zoom with Alt + "+" or "-"
- Ruler

### 0.0.4

- Guides with numbers

### 0.0.3

- Update manager
- Analytics

### 0.0.2

- Guides
- Zoom area
- Invert image colors
- Copy color to clipboard
- Copy position to clipboard

### 0.0.1

- Window always on top
- Lock/Unlock window
- Show/Hide window
- Change image alpha


---

# TODO

- [x] <del>more functionality icons</del>
- [x] <del>icon to block window</del>
- [x] <del>guides</del>
- [x] <del>opacity indicator!</del>
- [x] <del>cross to remove image and window</del>
- [ ] create cool icon
- [x] <del>invert colors</del> / multiply?
- [ ] save last position / reset position
- [x] <del>lock position</del>, disable mouse (it's not possible)
- [ ] refresh image (automatically)
- [x] <del>copy color to clipboard</del>
- [x] <del>changing image alpha updates the opacity indicator</del>
- [x] <del>on image remove, reset model alpha</del>
- [x] <del>update manager</del>
- [x] <del>analytics</del>
- [ ] builds for Win, <del>Mac</del>, Linux
- [ ] load from url?
- [ ] load multiples images
- [x] click and drag: draw a rect area
- [x] scale image
- [x] <del>restore invert colors when remove image</del>
- [ ] save last window position
- [ ] drag & drop new image replace existent
- [ ] more images in readme showing functionality
- [ ] get screenshot and use blend-modes
- [ ] paste image from clipboard
