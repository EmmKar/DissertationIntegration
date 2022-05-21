(define (problem three-waypoints)
    (:domain inspection012)
    
    ;Objects
    (:objects waypoint1 waypoint2 waypoint3)
    
    ;Initial State
    (:init  (waypoint waypoint1) (waypoint waypoint2) (waypoint waypoint3)
            (at-waypoint waypoint1) 
            ;(not (has-passed waypoint2)) (not (has-passed waypoint3)) 
    )
    
    ;goal specification
    (:goal (and (at-waypoint waypoint3) (has-passed waypoint2)))
)