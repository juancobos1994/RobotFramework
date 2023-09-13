import cv2
import numpy as np

def Compare_Images_Size(image1, image2):
    original = cv2.imread(image1)
    duplicate = cv2.imread(image2)

    val1 = original.shape
    val2 = duplicate.shape

    if val1 == val2:
        return "The images have same size and channels"
    else:
        return "The images did not have same size and channels"
    
def Compare_Image_RGB(image1, image2):
    original = cv2.imread(image1)
    duplicate = cv2.imread(image2)

    difference = cv2.subtract(original, duplicate)
    b, g, r = cv2.split(difference)

    if cv2.countNonZero(b) == 0 and cv2.countNonZero(g) == 0 and cv2.countNonZero(r) == 0:
        return "The images are completely Equal"
    else:
        return "The images are NOT Equal"

def Compare_Image_Similarity(image1, image2):
    original = cv2.imread(image1)
    duplicate = cv2.imread(image2)

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




img1="C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/testdata/Beach_left.jpg"
img2="C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/testdata/Beach_left.jpg"

Result1 = Compare_Images_Size(img1,img2)
print(Result1)

Result2 = Compare_Image_RGB(img1, img2)
print(Result2)

Result3 = Compare_Image_Similarity(img1, img2)
print(Result3)
