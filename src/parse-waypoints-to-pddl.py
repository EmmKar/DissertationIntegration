## File to generate a plot of waypoints to vizualise where they are on the map. 

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd 
import rospkg

## Get path to the inspection_plan package
rospack = rospkg.RosPack()
waypointsFile = input("Name of input waypoint file (excl extension): ")
# waypointsFile = 'test.csv'
inputPath = rospack.get_path('inspection_plan') + '/waypoints/' + waypointsFile + ".csv"
outputPath = rospack.get_path('inspection_plan') + "/src/outputs/"

## Orientation is represented as a quaternion, where we have that yaw is rotation around z axis, roll around x and pitch around y, 
## and w indicates the amount of rotation which will accur about the axis
waypoints = pd.read_csv(inputPath,
                        names = ['x', 'y', 'z', 'roll', 'pitch', 'yaw', 'w', 'isInteresting'])
#print(waypoints)

#save waypoints to a file, formatted to easily initialise in PDDL model
#save waypoints to a file, formatted to keep track of which name is which waypoint

#the many for-loops are for readability in the pddl code, at cost of speed of this code
pddl_waypoints = open(outputPath + "pddl-" + waypointsFile + ".txt", "w")
waypoint_lookup = open(outputPath + "lookup-" + waypointsFile + ".txt", "w")

#Format x coordinates
for i, x in waypoints['x'].iteritems():
    pddl_waypoints.write("(= (waypoint w{}x) {}) \n".format(i+1, x))
    waypoint_lookup.write("w{}x={}\n".format(i+1, x))

#Format y coordinates
for i, y in waypoints['y'].iteritems():
    pddl_waypoints.write("(= (waypoint w{}y) {}) \n".format(i+1, y))
    waypoint_lookup.write("w{}y={}\n".format(i+1, y))

#Format PDDL code to init valid waypoints
for i, x in waypoints['x'].iteritems():
    pddl_waypoints.write("(is-waypoint w{}x w{}y) \n".format(i+1, i+1))

#Format PDDL code to init interesting objects
num = 0
for i, x in waypoints['x'].iteritems():
    if waypoints.iloc[i]['isInteresting'] == True:
        num += 1
        pddl_waypoints.write("(by-interesting w{}x w{}y object{})\n".format(i+1, i+1, num))

pddl_waypoints.close()
waypoint_lookup.close()



def test():
    position = waypoints.drop(['roll', 'pitch', 'yaw', 'w'], axis=1)
    orientation = waypoints.drop(['x', 'y', 'z'], axis=1)
    return position, orientation

mytest = test()
#print(mytest)
 
## As we are only interested in a 2D plot, we only need x and y points.
waypoints = waypoints.drop(['z', 'roll', 'pitch', 'yaw', 'w'], axis=1)
#print(waypoints)

create_figure = input("Would you like to plot these waypoints? (y/n) ")
if create_figure.lower() == 'y':
    plotName = waypointsFile
    ## Create plot. LATER can save an image of the map and overlay it into the plot so it is clearer where the waypoints are. 
    plt.figure()
    plt.title("Waypoint Plot: " + plotName)
    plt.scatter(waypoints.x, waypoints.y)
    plt.ylim(ymax=10, ymin=-10)
    plt.xlim(xmax=10, xmin=-10)
    plt.xticks(range(-9,10,3))
    plt.yticks(range(-9,10,3))
    plt.xlabel("x")
    plt.ylabel("y")
    plt.savefig(rospack.get_path('inspection_plan') + "/src/figures/" + plotName + ".png")
    print("Plot saved to /src/figures/"+plotName+".png")
    plt.show()

else:
    print("No plot created.")