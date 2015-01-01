Circular UIButton subclass, with touch animations
Simply init and set the colors, label, font, size and animation type:
`````objective-c
DMCircleButton *pulseButton = [DMCircleButton buttonWithLabel:@"Pulse"
                                                  backgroundColor:[UIColor redColor]
                                                        textColor:[UIColor whiteColor]
                                                             font:[UIFont systemFontOfSize:17.0f]
                                                             size:80.0f
                                                    animationType:DMCircleButtonAnimationTypePulse];
`````

Or, init with an image, instead of a label:
`````objective-c
DMCircleButton *imgButton = [DMCircleButton buttonWithImage:[UIImage imageNamed:@"image"]
                                                backgroundColor:[UIColor greenColor]
                                                           size:80.0f
                                                  animationType:DMCircleButtonAnimationTypePulse];
`````
