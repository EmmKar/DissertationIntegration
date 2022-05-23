;Model version 3.1. Inspection with all object types. 
; Objects are arbitrarily defined. 

(define (problem full-inspection)
    (:domain inspection31)
    
    ;Objects
    (:objects   ;interesting objects for inspection - not used
                pipe-obj7 pipe-obj11 pipe-obj9 pipe-obj10 pipe-obj8 - pipe
                valve-obj7 valve-obj11 valve-obj9 valve-obj10 valve-obj8 - valve 
                box-obj7 - control-box
                vessel-obj5 vessel-obj4 vessel-obj4-2 vessel-obj5-2 vessel-obj6 
                vessel-obj3 vessel-obj2 vessel-obj2-2 vessel-obj3-2 - regular-vessel
                wall-obj14 wall-obj13 wall-obj15 wall-obj12 - wall
                tvessel-obj1 - toggle-vessel
                switch-obj16 - vessel-switch 
    
    ;waypoints
                w1x w2x w3x w4x w5x w6x w7x w8x w9x w10x 
                w11x w12x w13x w14x w15x w16x w17x w18x w19x w20x 
                w21x w22x w23x w24x w25x w26x w27x w28x w29x w30x 
                w31x w32x w33x w34x w35x - posx

                w1y w2y w3y w4y w5y w6y w7y w8y w9y w10y 
                w11y w12y w13y w14y w15y w16y w17y w18y w19y w20y 
                w21y w22y w23y w24y w25y w26y w27y w28y w29y w30y 
                w31y w32y w33y w34y w35y  - posy
    )
    
    ;Initial State
    ;Need to set valve to pipe, set all valves to closed. 
    (:init  ;Specify coordinate values (imported from file in misc):
                (= (waypoint w1x) -0.1218318939208984) 
                (= (waypoint w2x) 1.994096755981445) 
                (= (waypoint w3x) 4.5313568115234375) 
                (= (waypoint w4x) 6.557579040527344) 
                (= (waypoint w5x) 7.842391490936279) 
                (= (waypoint w6x) 6.856735229492188) 
                (= (waypoint w7x) 5.555830001831055) 
                (= (waypoint w8x) 5.42558479309082) 
                (= (waypoint w9x) 6.519083023071289) 
                (= (waypoint w10x) 6.963254928588867) 
                (= (waypoint w11x) 4.584283828735352) 
                (= (waypoint w12x) 2.317379951477051) 
                (= (waypoint w13x) 1.2779722213745115) 
                (= (waypoint w14x) -0.1611576080322265) 
                (= (waypoint w15x) -0.1605119705200195) 
                (= (waypoint w16x) 2.485994338989258) 
                (= (waypoint w17x) 4.404748916625977) 
                (= (waypoint w18x) 5.656575202941895) 
                (= (waypoint w19x) 0.4570999145507812) 
                (= (waypoint w20x) -1.0125885009765625) 
                (= (waypoint w21x) -1.8590946197509768) 
                (= (waypoint w22x) -1.9677982330322263) 
                (= (waypoint w23x) -1.908034324645996) 
                (= (waypoint w24x) -3.658760070800781) 
                (= (waypoint w25x) -3.973165512084961) 
                (= (waypoint w26x) -6.4872589111328125) 
                (= (waypoint w27x) -8.25124740600586) 
                (= (waypoint w28x) -3.904906272888184) 
                (= (waypoint w29x) -1.8641395568847656) 
                (= (waypoint w30x) -0.8509674072265625) 
                (= (waypoint w31x) -2.883949279785156) 
                (= (waypoint w32x) -5.219956398010254) 
                (= (waypoint w33x) -7.481934547424316) 
                (= (waypoint w34x) -7.848366737365723) 
                (= (waypoint w35x) -7.753649711608887) 
                (= (waypoint w1y) -0.0259771347045898) 
                (= (waypoint w2y) -0.0439786911010742) 
                (= (waypoint w3y) -0.085784912109375) 
                (= (waypoint w4y) -0.3214273452758789) 
                (= (waypoint w5y) -2.5718584060668945) 
                (= (waypoint w6y) -5.310903549194336) 
                (= (waypoint w7y) -3.291231155395508) 
                (= (waypoint w8y) -6.284844398498535) 
                (= (waypoint w9y) -6.657915115356445) 
                (= (waypoint w10y) -8.342772483825684) 
                (= (waypoint w11y) -8.234786033630371) 
                (= (waypoint w12y) -8.385184288024902) 
                (= (waypoint w13y) -8.489228248596191) 
                (= (waypoint w14y) -6.5234785079956055) 
                (= (waypoint w15y) -3.616194725036621) 
                (= (waypoint w16y) -1.8003826141357422) 
                (= (waypoint w17y) -1.3879127502441406) 
                (= (waypoint w18y) -1.8085193634033203) 
                (= (waypoint w19y) -1.4837875366210938) 
                (= (waypoint w20y) 0.2969217300415039) 
                (= (waypoint w21y) -2.0568294525146484) 
                (= (waypoint w22y) -3.821854591369629) 
                (= (waypoint w23y) -6.88770866394043) 
                (= (waypoint w24y) -8.398080825805664) 
                (= (waypoint w25y) -6.456343650817871) 
                (= (waypoint w26y) -5.229393005371094) 
                (= (waypoint w27y) -5.351316452026367) 
                (= (waypoint w28y) -4.276196479797363) 
                (= (waypoint w29y) -8.6356201171875) 
                (= (waypoint w30y) -5.360382080078125) 
                (= (waypoint w31y) -2.35261344909668) 
                (= (waypoint w32y) -2.495210647583008) 
                (= (waypoint w33y) -0.4833307266235351) 
                (= (waypoint w34y) -2.752452850341797) 
                (= (waypoint w35y) 1.9571685791015625) 

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
                (is-waypoint w22x w22y) 
                (is-waypoint w23x w23y) 
                (is-waypoint w24x w24y) 
                (is-waypoint w25x w25y) 
                (is-waypoint w26x w26y) 
                (is-waypoint w27x w27y) 
                (is-waypoint w28x w28y) 
                (is-waypoint w29x w29y) 
                (is-waypoint w30x w30y) 
                (is-waypoint w31x w31y) 
                (is-waypoint w32x w32y) 
                (is-waypoint w33x w33y) 
                (is-waypoint w34x w34y) 
                (is-waypoint w35x w35y) 

            ;specify where the robot starts
                (at-waypoint w1x w1y)

            ;total cost (total distance traveled) starts as 0
                (= (total-cost) 0)

        ) 
        
        ;goal specification;
        (:goal (and (forall (?x - posx)
                                (radiation-registered ?x))
                        (forall (?y - posy)
                                (radiation-registered ?y))))

        
        (:metric minimize (total-cost))  
)