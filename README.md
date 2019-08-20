[ui]: https://github.com/craig-feldman/touch-bar-clock/blob/master/touch-bar-clock/touch-bar-ui.png "App UI"
[gif]: https://github.com/craig-feldman/touch-bar-clock/blob/master/touch-bar-clock/touch-bar-clock-gif.gif "Touch bar transitions"

# touch-bar-clock
Adds a permanent clock in the touch and status bar with an unobtrusive reminder to take breaks.

## Break reminder
The colour of the clock (in both the touch and menu bar) transitions slowly from green through to yellow, orange, and red, indicating that you are probably due for a break!

## The menu bar and UI
![alt text][ui]

The status bar displays the current time and a colour indicating the elapsed duration since a reset was triggered.

When clicking on the button in the menu bar, a popover is displayed. The popover displays the current target work time duration and the ability to update it. You can also choose to show the elapsed duration, rather than current time, or quit the application completely.

Clicking on `reset elapsed` will reset the elapsed timer. See [Resetting the elapsed time].(#resetting-the-elapsed-time)

## The touchbar and transitions

The following gif shows the colour transitions for a (condensed) target work duration of 10 seconds:

![alt text][gif]

When tapping on the touch bar button the elapsed timer is reset. See [Resetting the elapsed time].(#resetting-the-elapsed-time)

## Resetting the elapsed time

Resetting the elapsed time should be used when returning from a break. The clock colour will return to the original green and the transition will restart.
