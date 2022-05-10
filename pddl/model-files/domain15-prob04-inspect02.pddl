;Model version 1.5. Movement between and abstract inspection of various
;objects and waypoints.  

(define (problem inspect-object)
    (:domain inspection015)
    
    ;Objects
    (:objects   waypoint1 waypoint2 waypoint3 waypoint4 - waypoint
                object1 object2 object3 - interesting
    )
    
    ;Initial State
    (:init  (at-waypoint waypoint1) (rob-facing waypoint2) ;limitation: we must know which way the robot is facing to begin with.
            (by-interesting waypoint2 object1) 
            (by-interesting waypoint2 object2)
            (by-interesting waypoint4 object3)
    )
    
    ;goal specification
    (:goal (and (at-waypoint waypoint3) (has-inspected object1) (has-inspected object2) (has-inspected object3)))
    
)