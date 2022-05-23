;Model version 3.1. Inspection with all object types. 
; Objects are arbitrarily defined. 

(define (problem full-inspection)
    (:domain inspection32)
    
    ;Objects
    (:objects   
                pipe1-obj10 pipe2-obj9 pipe3-obj8 pipe4-obj11 pipe5-obj7 - pipe
                valve1 valve2 valve3 valve4 valve5 - valve 
                box1-obj7 - control-box
                vessel1-obj6 vessel2-obj4 vessel3-obj5 vessel4-obj5 vessel6-obj3 vessel7-obj2 - regular-vessel
                wall1-obj14 wall2-obj13 wall3-obj15 wall4-obj12 - wall
                vessel5-obj1 - toggle-vessel
                switch1-obj16 - vessel-switch

                ;waypoints
                w20x w21x w22x w23x w24x w25x w26x w27x w28x w29x w30x 
                w31x w32x w33x w34x w35x w36x w37x w38x w39x w40x 
                w41x w42x w43x w44x w45x  - posx

                w20y w21y w22y w23y w24y w25y w26y w27y w28y w29y w30y 
                w31y w32y w33y w34y w35y w36y w37y w38y w39y w40y 
                w41y w42y w43y w44y w45y   - posy
    )
    
    ;Initial State
    ;Need to set valve to pipe, set all valves to closed. 
    (:init  ;Specify coordinate values (imported from file in misc):
                
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
                (= (waypoint w36x) -7.490196228027344) 
                (= (waypoint w37x) -7.573483467102051) 
                (= (waypoint w38x) -8.172195434570312) 
                (= (waypoint w39x) -7.444209098815918) 
                (= (waypoint w40x) -7.549870491027832) 
                (= (waypoint w41x) -5.798432350158691) 
                (= (waypoint w42x) -4.909024238586426) 
                (= (waypoint w43x) -4.969869613647461) 
                (= (waypoint w44x) -5.5551958084106445) 
                (= (waypoint w45x) -5.341214179992676) 
             
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
                (= (waypoint w36y) 4.039443016052246) 
                (= (waypoint w37y) 5.720549583435059) 
                (= (waypoint w38y) 6.9970245361328125) 
                (= (waypoint w39y) 8.832785606384277) 
                (= (waypoint w40y) 3.727993965148926) 
                (= (waypoint w41y) 0.0971441268920898) 
                (= (waypoint w42y) 1.8313970565795896) 
                (= (waypoint w43y) 3.5237350463867188) 
                (= (waypoint w44y) 4.095023155212402) 
                (= (waypoint w45y) 6.497528553009033) 
               

            ;specify which combination of waypoint coordinates are valid
                
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
                (is-waypoint w36x w36y) 
                (is-waypoint w37x w37y) 
                (is-waypoint w38x w38y) 
                (is-waypoint w39x w39y) 
                (is-waypoint w40x w40y) 
                (is-waypoint w41x w41y) 
                (is-waypoint w42x w42y) 
                (is-waypoint w43x w43y) 
                (is-waypoint w44x w44y) 
                (is-waypoint w45x w45y) 
               

            ;specify where the robot starts
                (at-waypoint w20x w20y)

            ;total cost (total distance traveled) starts as 0
                (= (total-cost) 0)

        ) 
        
        ;goal specification;
        (:goal (and (forall (?x - posx)
                                (radiation-registered ?x))
                        (forall (?y - posy)
                                (radiation-registered ?y))
                    (at-waypoint w45x w45y)))

        
        (:metric minimize (total-cost))  
)