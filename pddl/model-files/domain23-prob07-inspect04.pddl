;Model version 1.5. Movement between and abstract inspection of various
;objects and waypoints.  

(define (problem inspection04)
    (:domain inspection23)
    
    ;Objects
    (:objects   object1 object2 object3 - interesting ;Points of interest in the world
                ;Declare objects for coordinate values, one for x and y and up to the
                ;highest number of waypoints in the problem
                w1x w2x w3x w4x w5x w6x w7x w8x w9x w10x
                w11x w12x w13x w14x w15x w16x w17x w18x w19x w20x 
                w21x - posx
                w1y w2y w3y w4y w5y w6y w7y w8y w9y w10y
                w11y w12y w13y w14y w15y w16y w17y w18y w19y w20y
                w21y - posy
    )
    
    ;Initial State
    (:init  ;Specify coordinate values (imported from file in misc):
            (= (waypoint w1x) -0.0078611373901367) 
            (= (waypoint w2x) -0.0855283737182617) 
            (= (waypoint w3x) -0.0213308334350585) 
            (= (waypoint w4x) -0.010416030883789) 
            (= (waypoint w5x) 0.023655891418457) 
            (= (waypoint w6x) -0.0940732955932617) 
            (= (waypoint w7x) -0.2073278427124023) 
            (= (waypoint w8x) -0.0810909271240234) 
            (= (waypoint w9x) -0.7112255096435547) 
            (= (waypoint w10x) -0.9256105422973632) 
            (= (waypoint w11x) -1.4557132720947266) 
            (= (waypoint w12x) -1.3065519332885742) 
            (= (waypoint w13x) -1.330887794494629) 
            (= (waypoint w14x) -1.2670660018920898) 
            (= (waypoint w15x) -1.175724983215332) 
            (= (waypoint w16x) -1.8202133178710935) 
            (= (waypoint w17x) -2.5858850479125977) 
            (= (waypoint w18x) -2.6054906845092773) 
            (= (waypoint w19x) -2.742687225341797) 
            (= (waypoint w20x) -3.02841854095459) 
            (= (waypoint w21x) -3.2291698455810547) 
            (= (waypoint w1y) -0.9847574234008788) 
            (= (waypoint w2y) -2.0470895767211914) 
            (= (waypoint w3y) -3.010516166687012) 
            (= (waypoint w4y) -4.010639190673828) 
            (= (waypoint w5y) -4.975879669189453) 
            (= (waypoint w6y) -5.762591361999512) 
            (= (waypoint w7y) -7.102699279785156) 
            (= (waypoint w8y) -8.345015525817871) 
            (= (waypoint w9y) -9.339797973632812) 
            (= (waypoint w10y) -9.107548713684082) 
            (= (waypoint w11y) -8.359051704406738) 
            (= (waypoint w12y) -6.637836456298828) 
            (= (waypoint w13y) -5.03082275390625) 
            (= (waypoint w14y) -4.158780097961426) 
            (= (waypoint w15y) -3.05061149597168) 
            (= (waypoint w16y) -2.975918769836426) 
            (= (waypoint w17y) -3.393125534057617) 
            (= (waypoint w18y) -4.204794883728027) 
            (= (waypoint w19y) -5.9219465255737305) 
            (= (waypoint w20y) -7.939396858215332) 
            (= (waypoint w21y) -8.889455795288086)

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
            (is-waypoint w21x w21y)

            ;total cost (total distance traveled) starts as 0
            (= (total-cost) 0)

            ;specify where the inspection objects are located
            (by-interesting w4x w4y object1) 
            (by-interesting w11x w11y object2)
            (by-interesting w14x w14y object3)

            ;specify where the robot starts
            (at-waypoint w1x w1y)
    )
    
    ;goal specification;
    ; for all combinations of x and y, either it isn't a waypoint or it has been passed

                
    (:goal (and (forall (?x -posx ?y - posy)
                    (or (not (is-waypoint ?x ?y))
                        (and (has-passed ?x ?y)
                             (radiation-registered ?x ?y)))) ;since the coordinates can only be put as passed for the combinations,  
                (at-waypoint w1x w1y)
                (forall (?o - interesting)
                        (has-inspected ?o))))

    
    (:metric minimize (total-cost))  
)