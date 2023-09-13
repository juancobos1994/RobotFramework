from pathlib import Path
from playwright.sync_api import sync_playwright
import cv2
import numpy as np

def ScreenShotAllPage(Link):

    with sync_playwright() as pw:
        browser = pw.chromium.launch(headless=False)

        # To save cookies to a file first extract them from the browser context:
        context = browser.new_context(viewport={"width": 1920, "height": 1080})
        page = context.new_page()
        page.goto(Link)
        image_bytes = page.screenshot(
            full_page=True,   # this will try to scroll to capture full page
            path='screenshot.png',  # this will save the screenshot directly to a file
        #clip={"x": 0, "y": 0, "width": 100, "height": 100},  # this will clip the screenshot to a specific region
        )
        # or we can save it manually
        Path("screenshot.png").write_bytes(image_bytes)

    return image_bytes


def ScreenShotElement(Locator, Link):
    with sync_playwright() as pw:
        browser = pw.chromium.launch(headless=False)

        # To save cookies to a file first extract them from the browser context:
        context = browser.new_context(viewport={"width": 1920, "height": 1080})
        page = context.new_page()
        page.goto(Link)
        image_bytes1 = page.locator(Locator).screenshot( path= 'screenshotElement.png' )
        Path("screenshotElement.png").write_bytes(image_bytes1)

        return image_bytes1



def Compare_Images(Link,Locator):

    with sync_playwright() as pw:
        browser = pw.chromium.launch(headless=False)

        # To save cookies to a file first extract them from the browser context:
        context = browser.new_context(viewport={"width": 1920, "height": 1080})
        page = context.new_page()
        page.goto(Link)
        image_bytes = page.screenshot(
            full_page=True,   # this will try to scroll to capture full page
            path='screenshot.png',  # this will save the screenshot directly to a file
        #clip={"x": 0, "y": 0, "width": 100, "height": 100},  # this will clip the screenshot to a specific region
        )
        # or we can save it manually
        Path("screenshot.png").write_bytes(image_bytes)
    
    with sync_playwright() as pw:
        browser = pw.chromium.launch(headless=False)

        # To save cookies to a file first extract them from the browser context:
        context = browser.new_context(viewport={"width": 1920, "height": 1080})
        page = context.new_page()
        page.goto(Link)
        image_bytes1 = page.locator(Locator).screenshot( path= 'screenshotElement.png' )
        Path("screenshotElement.png").write_bytes(image_bytes1)
    
    original = cv2.imread("screenshot.png")
    duplicate = cv2.imread("screenshotElement.png")
    sift = cv2.xfeatures2d.SIFT_create()
    kp_1, desc_1 = sift.detectAndCompute(original, None)
    kp_2, desc_2 = sift.detectAndCompute(duplicate, None)
    index_params = dict(algorithm=0, trees=5)
    search_params = dict()
    flann = cv2.FlannBasedMatcher(index_params, search_params)

    matches = flann.knnMatch(desc_1, desc_2, k=2)

    good_points = []
    for m, n in matches:
        if m.distance < 0.6*n.distance:
            good_points.append(m)

    # Define how similar they are
    number_keypoints = 0
    if len(kp_1) <= len(kp_2):
        number_keypoints = len(kp_1)
    else:
        number_keypoints = len(kp_2)

    porcentage = len(good_points) / number_keypoints * 100
    print("Keypoints 1ST Image: " + str(len(kp_1)))
    print("Keypoints 2ND Image: " + str(len(kp_2)))
    print("GOOD Matches:", len(good_points))
    print("How good it's the match: ", len(good_points) / number_keypoints * 100)

    return porcentage





