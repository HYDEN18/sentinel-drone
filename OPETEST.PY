import cv2 as cv
import numpy as np
img = cv.imread("yellow_detect.jpeg")
hsv = cv.cvtColor(img, cv.COLOR_BGR2HSV)
lower_yellow= np.array([0,130, 130])
upper_yellow = np.array([150,255, 255])
mask = cv.inRange(hsv, lower_yellow, upper_yellow)
res = cv.bitwise_and(img, img, mask=mask)
# #create resizable windows for displaying the images
# cv.namedWindow("res", cv.WINDOW_NORMAL)
# cv.namedWindow("hsv", cv.WINDOW_NORMAL)
# cv.namedWindow("mask", cv.WINDOW_NORMAL)

# #display the images
# cv.imshow("mask", mask)
# cv.imshow("hsv", hsv)
# cv.imshow("res", res)
gray = cv.cvtColor(res, cv.COLOR_BGR2GRAY)
corners = cv.goodFeaturesToTrack(gray,12, 0.01, 10)
corners = np.int0(corners)
# for i in corners:
#     x, y = i.ravel()
#     cv.circle(res, (x, y), 5, (0, 0, 255), -1)
(corners)


# # Display the image
# cv.imshow('a', res)
# cv.waitKey(0)

# if cv.waitKey(0):
#     cv.destroyAllWindows()
