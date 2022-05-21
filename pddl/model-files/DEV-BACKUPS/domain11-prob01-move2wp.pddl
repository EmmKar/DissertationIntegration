(define (problem two-waypoints)
    (:domain inspection011)
    
    ;Objects
    (:objects waypoint1 waypoint2)
    
    ;Initial State
    (:init  (waypoint waypoint1) (waypoint waypoint2)
            (at-waypoint waypoint1)
    )
    
    ;goal specification
    (:goal (at-waypoint waypoint2))
)