(define (problem inspect-object)
    (:domain inspection013)
    
    ;Objects
    (:objects   waypoint1 waypoint2 waypoint3
                object1)
    
    ;Initial State
    (:init  (waypoint waypoint1) (waypoint waypoint2) (waypoint waypoint3)
            (at-waypoint waypoint1)
            (is-interesting object1)
            (at-interesting waypoint2 object1)
            (not (has-passed waypoint2)) (not (has-passed waypoint3)) 
    )
    
    ;goal specification
    (:goal (and (at-waypoint waypoint3) (has-inspected object1)))
    
)