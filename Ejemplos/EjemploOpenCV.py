import cv2
import numpy as np

original = cv2.imread("C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/testdata/Beach_left.jpg")
duplicate = cv2.imread("C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/testdata/Beach_left.jpg")
image_to_compare = cv2.imread("C:/Users/juanc/PycharmProjects/RobotFrameworkNivel1/Ejemplos/testdata/Beach_left.jpg")

image1 = original.shape
image2 = duplicate.shape

if image1 == image2:
    print("The images have same size and channels")
    difference = cv2.subtract(original, duplicate)
    b, g, r = cv2.split(difference)
    cv2.imshow("difference", difference)
    cv2.imshow("b", b)
    cv2.imshow("g", g)
    cv2.imshow("r", r)
    print(cv2.countNonZero(b))
    print(cv2.countNonZero(g))
    print(cv2.countNonZero(r))

    if cv2.countNonZero(b) == 0 and cv2.countNonZero(g) == 0 and cv2.countNonZero(r) == 0:
        print("The images are completely Equal")
    else:
        print("The images are NOT Equal")

cv2.imshow("Original", original)
cv2.imshow("Duplicate", duplicate)
cv2.waitKey(0)
cv2.destroyAllWindows()

# 2) Check for similarities between the 2 images
sift = cv2.xfeatures2d.SIFT_create()
kp_1, desc_1 = sift.detectAndCompute(original, None)
kp_2, desc_2 = sift.detectAndCompute(image_to_compare, None)

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


print("Keypoints 1ST Image: " + str(len(kp_1)))
print("Keypoints 2ND Image: " + str(len(kp_2)))
print("GOOD Matches:", len(good_points))
print("How good it's the match: ", len(good_points) / number_keypoints * 100)

result = cv2.drawMatches(original, kp_1, image_to_compare, kp_2, good_points, None)


cv2.imshow("result", cv2.resize(result, None, fx=0.4, fy=0.4))
cv2.imwrite("feature_matching.jpg", result)


cv2.imshow("Original", cv2.resize(original, None, fx=0.4, fy=0.4))
cv2.imshow("Duplicate", cv2.resize(image_to_compare, None, fx=0.4, fy=0.4))
cv2.waitKey(0)
cv2.destroyAllWindows()




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
