;Model version 3.1. Inspection with waypoint radiation, pipes and valves. 
; Objects arbitrarily defined. 

(define (problem inspection09)
    (:domain inspection31)
    
    ;Objects
    (:objects   ;interesting objects for inspection
                pipe1 pipe2 - pipe
                valve1 valve2 - valve 
                ;waypoints
                w1x w2x w3x w4x w5x w6x w7x w8x w9x w10x
                w11x w12x w13x w14x w15x w16x w17x w18x w19x w20x - posx
                w1y w2y w3y w4y w5y w6y w7y w8y w9y w10y
                w11y w12y w13y w14y w15y w16y w17y w18y w19y w20y - posy
    )
    
    ;Initial State
    ;Need to set valve to pipe, set all valves to closed. 
    (:init  ;Specify coordinate values (imported from file in misc):
            (= (waypoint w1x) -0.0322999954223632) 
            (= (waypoint w2x) 2.57498836517334) 
            (= (waypoint w3x) 0.9946775436401368) 
            (= (waypoint w4x) 0.9345312118530272) 
            (= (waypoint w5x) 0.9594030380249025) 
            (= (waypoint w6x) -0.0355825424194335) 
            (= (waypoint w7x) -1.0341663360595703) 
            (= (waypoint w8x) -2.017702102661133) 
            (= (waypoint w9x) -3.1271705627441406) 
            (= (waypoint w10x) -2.944549560546875) 
            (= (waypoint w11x) -1.998824119567871) 
            (= (waypoint w12x) -1.0400714874267578) 
            (= (waypoint w13x) 0.0156641006469726) 
            (= (waypoint w14x) -0.4028682708740234) 
            (= (waypoint w15x) -1.4070329666137695) 
            (= (waypoint w16x) -2.6309947967529297) 
            (= (waypoint w17x) -3.925074577331543) 
            (= (waypoint w18x) -5.126544952392578) 
            (= (waypoint w19x) -3.267972946166992) 
            (= (waypoint w20x) -2.123725891113281) 
            (= (waypoint w1y) 0.056706428527832) 
            (= (waypoint w2y) -1.9012956619262693) 
            (= (waypoint w3y) -0.0172901153564453) 
            (= (waypoint w4y) -1.0321807861328125) 
            (= (waypoint w5y) -1.9780254364013672) 
            (= (waypoint w6y) -2.032480239868164) 
            (= (waypoint w7y) -1.999770164489746) 
            (= (waypoint w8y) -1.988779067993164) 
            (= (waypoint w9y) -2.033329963684082) 
            (= (waypoint w10y) -4.053982734680176) 
            (= (waypoint w11y) -4.01506233215332) 
            (= (waypoint w12y) -3.993097305297852) 
            (= (waypoint w13y) -3.964311599731445) 
            (= (waypoint w14y) -6.472708702087402) 
            (= (waypoint w15y) -6.626125335693359) 
            (= (waypoint w16y) -6.7042646408081055) 
            (= (waypoint w17y) -6.478175163269043) 
            (= (waypoint w18y) -5.17695426940918) 
            (= (waypoint w19y) -5.254915237426758) 
            (= (waypoint w20y) -5.286971092224121) 

            ;specify which combination of waypoint coordinates are valid
            (is-waypoint w1x w1y) 
            (is-waypoint w2x w2y) 
            (is-waypoint w3x w3y) 
            (is-waypoint w4x w4y) 
            (is-waypoint w5x w5y) 
            (is-waypoint w6x w6y) 
            (is-waypoint w7x w7y) 
            (is-waypoint w8x w8y) 
            (is-waypoint w9x w9y) 
            (is-waypoint w10x w10y) 
            (is-waypoint w11x w11y) 
            (is-waypoint w12x w12y) 
            (is-waypoint w13x w13y) 
            (is-waypoint w14x w14y) 
            (is-waypoint w15x w15y) 
            (is-waypoint w16x w16y) 
            (is-waypoint w17x w17y) 
            (is-waypoint w18x w18y) 
            (is-waypoint w19x w19y) 
            (is-waypoint w20x w20y) 

            ;specify where the inspection objects are located
            (by-interesting w2x w2y pipe1)
            (by-interesting w14x w14y pipe2)

            ;specify which valve belongs to which pip
            (has-valve pipe1 valve1)
            (has-valve pipe2 valve2)

            ;valves are closed
            (valve-closed valve2)
            (valve-closed valve1)

            ;specify where the robot starts
            (at-waypoint w1x w1y)

            ;total cost (total distance traveled) starts as 0
            (= (total-cost) 0)

    ) 
    
    ;goal specification;
    (:goal (and (forall (?x - posx)
                        (radiation-registered ?x))
                (forall (?y - posy)
                        (radiation-registered ?y))
                (at-waypoint w1x w1y)
                (forall (?o - interesting)
                        (has-inspected ?o))
                (forall (?v - valve)
                        (valve-closed ?v))))

    
    (:metric minimize (total-cost))  
)