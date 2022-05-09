## File to generate a plot of waypoints to vizualise where they are on the map. 

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd 
import rospkg

## Get path to the inspection_plan package
rospack = rospkg.RosPack()
#waypointsFile = input("Name of waypoint file: " + ".csv")
waypointsFile = 'test.csv'
filePath = rospack.get_path('inspection_plan') + '/waypoints/' + waypointsFile

## Orientation is represented as a quaternion, where we have that yaw is rotation around z axis, roll around x and pitch around y, 
## and w indicates the amount of rotation which will accur about the axis
waypoints = pd.read_csv(filePath,
                        names = ['x', 'y', 'z', 'roll', 'pitch', 'yaw', 'w'])
#print(waypoints)

def test():
    position = waypoints.drop(['roll', 'pitch', 'yaw', 'w'], axis=1)
    orientation = waypoints.drop(['x', 'y', 'z'], axis=1)
    return position, orientation

mytest = test()
print(mytest)

## As we are only interested in a 2D plot, we only need x and y points.
waypoints = waypoints.drop(['z', 'roll', 'pitch', 'yaw', 'w'], axis=1)
print(waypoints)


## Create plot. LATER can save an image of the map and overlay it into the plot so it is clearer where the waypoints are. 
plt.figure()
plt.title("Waypoint Plot")
plt.scatter(waypoints.x, waypoints.y)
plt.ylim(ymax=10, ymin=-10)
plt.xlim(xmax=10, xmin=-10)
plt.xticks(range(-9,10,3))
plt.yticks(range(-9,10,3))
plt.xlabel("x")
plt.ylabel("y")
plt.savefig("waypoint_plot.png")
plt.show()
