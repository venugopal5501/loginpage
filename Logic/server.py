from flask import Flask, request, jsonify, send_file
import cv2
import pickle
import numpy as np
import io

app = Flask(__name__)

width, height = 107, 48
try:
    with open('CarParkPos', 'rb') as f:
        posList = pickle.load(f)
except:
    posList = []

@app.route('/process_image', methods=['GET'])
def process_image():
    # Load the image
    img = cv2.imread('C:\Users\venug\OneDrive\Documents\loginpage\Logic\carParkImg.png')
    
    # Apply the logic to highlight areas
    for pos in posList:
        cv2.rectangle(img, pos, (pos[0] + width, pos[1] + height), (255, 0, 255), 2)
    
    # Convert the processed image to a format that can be sent over HTTP
    is_success, im_buf_arr = cv2.imencode(".png", img)
    byte_im = io.BytesIO(im_buf_arr.tobytes())
    
    # Return the processed image
    return send_file(byte_im, mimetype='image/png')
if __name__ == '__main__':
    app.run(debug=True)