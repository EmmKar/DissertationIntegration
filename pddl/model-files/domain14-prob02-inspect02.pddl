(define (problem inspect-object)
    (:domain inspection014)
    
    ;Objects
    (:objects   waypoint1 waypoint2 waypoint3 waypoint4
                object1 object2 object3
    )
    
    ;Initial State
    (:init  (waypoint waypoint1) (waypoint waypoint2) (waypoint waypoint3) (waypoint waypoint4)
            (at-waypoint waypoint1) (rob-facing waypoint2) ;limitation: we must know which way the robot is facing to begin with.
            (is-interesting object1) (is-interesting object2) (is-interesting object3)
            (at-interesting waypoint2 object1) 
            (at-interesting waypoint2 object2)
            (at-interesting waypoint4 object3)
            ;(not (has-passed waypoint2)) (not (has-passed waypoint3)) 
    )
    
    ;goal specification
    (:goal (and (at-waypoint waypoint3) (has-inspected object1) (has-inspected object2) (has-inspected object3)))
    
)