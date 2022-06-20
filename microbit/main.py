'''
PROJECT ATOMIZER
FOR USE ON THE BBC MICRO:BIT CONTROLLER

DEVELOPED AND DESIGNED BY JOHN SEONG
'''

from microbit import *
import audio
import speech

def _x_detection(_reading_x):
    '''
    Reads off the accelerometer value on the x-axis
    and determines if the device is tilted left or right
    
    Parameters
    ----------
    _reading_x: Float
        The raw value for the tilt around the x-axis

    Returns
    -------
    None
    '''
    if _reading_x > 120:
        display.show("R")
        print("R")
        
    elif _reading_x < -120:
        display.show("L")
        print("L")
        
    else:
        display.show("-")
        print("-")
            
def _y_detection(_reading_y):
    '''
    Reads off the accelerometer value on the y-axis
    and determines if the device is tilted up or down
    
    Parameters
    ----------
    _reading_y: Float
        The raw value for the tilt around the y-axis

    Returns
    -------
    None
    '''
    if _reading_y > 120:
        display.show("U")
        print("U")
        
    elif _reading_y < -120:
        display.show("D")
        print("D")
        
    else:
        display.show("-")
        print("-")
        
def set_initial_states(_state, _detection_mode):
    '''
    Set initial states for the state-finite machine
    
    Parameters
    ----------
    _state: String
        Represents the current state
        
    _detection_mode: String
        Represents the orientation: either the x or y-axis

    Returns
    -------
    None
    '''
    global state, detection_mode
    
    state = _state
    detection_mode = _detection_mode
        
def main_loop(state):
    '''
    The main loop that runs in the program;
    also serves as the entry point
    
    Parameters
    ----------
    state: String
        The current state of the program

    Returns
    -------
    None
    '''
    while True:
        if state == 'INIT':
            display.scroll('ATOMIZER', wait=False, loop=True)
            
            state = 'IDLE'
            
        if state == 'IDLE':
            
            if button_a.was_pressed():
                display.scroll('OBJECT', wait=True, loop=False)
                audio.play(Sound.HAPPY)

                detection_mode = 'YAW'
                state = 'OBJECT'
                
            if button_b.was_pressed():
                display.scroll('CAMERA', wait=True, loop=False)
                audio.play(Sound.HAPPY)
                
                detection_mode = 'YAW'
                state = 'CAMERA'
                
                
        if state == 'CAMERA' or state == 'OBJECT':
            
            if detection_mode == 'YAW':
                reading_x = round(accelerometer.get_x())
                _x_detection(reading_x)
                
                if button_b.was_pressed():
                    detection_mode = 'ELEVATOR'
            
            if detection_mode == 'ELEVATOR':
                reading_y = round(accelerometer.get_y())
                _y_detection(reading_y)
                
                if button_b.was_pressed():
                    detection_mode = 'YAW'
                
        sleep(10) # a 10 millisecond delay

# Set the intial state and define the entry point...
set_initial_states('INIT', 'YAW')
main_loop(state)
