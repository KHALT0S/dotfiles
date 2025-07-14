import numpy as np
from PIL import Image, ImageDraw
from Xlib import X, display
import random
import time

# Function to generate noise (grain)
def generate_noise(width, height, noise_level=0.3):
    noise = np.random.normal(0, noise_level, (height, width, 3)) * 255
    noise = np.clip(noise, 0, 255).astype(np.uint8)
    return Image.fromarray(noise)

# Function to apply noise to a window
def apply_noise_to_window(window_id, noise_image):
    # Open the window
    window = disp.create_resource_object('window', window_id)
    window.map()
    window_width = window.get_geometry().width
    window_height = window.get_geometry().height

    # Create an image to hold the noise texture
    noise_resized = noise_image.resize((window_width, window_height), Image.NEAREST)
    
    # We need to fetch the X11 window's content and overlay the noise texture
    # Here we're creating the overlay, but additional X11 API work would be needed to draw it
    
    # For this simple example, we will just save the image to demonstrate the texture
    noise_resized.save(f"noise_window_{window_id}.png")

# Function to detect inactive windows
def get_inactive_windows():
    # This function lists all windows, simulating "inactive" detection
    inactive_windows = []
    root_window = disp.screen().root
    window_ids = root_window.query_tree().children
    for window_id in window_ids:
        window = disp.create_resource_object('window', window_id)
        # Inactive window: no focus and not minimized
        if not window.is_mapped() or window_id == focused_window_id:
            continue
        inactive_windows.append(window_id)
    return inactive_windows

# Setup connection to X11
disp = display.Display()

# Focused window ID (just a placeholder, you can implement logic to track focused windows)
focused_window_id = None

try:
    while True:
        # List inactive windows
        inactive_windows = get_inactive_windows()

        # Create noise image (you can adjust the size or noise level)
        noise = generate_noise(1920, 1080)  # You can adjust the resolution here
        
        for window_id in inactive_windows:
            print(f"Applying noise to window {window_id}")
            apply_noise_to_window(window_id, noise)
        
        time.sleep(1)  # Run every second (adjust as needed)

except KeyboardInterrupt:
    print("Exiting...")
    disp.close()
