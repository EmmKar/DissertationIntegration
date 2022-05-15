(define (problem inspect-object)
    (:domain inspection014)
    
    ;Objects
    (:objects   waypoint1 waypoint2 waypoint3 
                object1)
    
    ;Initial State
    (:init  (waypoint waypoint1) (waypoint waypoint2) (waypoint waypoint3)
            (at-waypoint waypoint1) (rob-facing waypoint2) ;limitation: we must know which way the robot is facing to begin with.
            (is-interesting object1)
            (at-interesting waypoint2 object1)
            ;(not (has-passed waypoint2)) (not (has-passed waypoint3)) 
    )
    
    ;goal specification
    (:goal (and (at-waypoint waypoint3) (has-inspected object1)))
    
)